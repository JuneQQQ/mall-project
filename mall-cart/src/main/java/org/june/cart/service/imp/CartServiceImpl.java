package org.june.cart.service.imp;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import lombok.extern.slf4j.Slf4j;
import org.june.cart.feign.ProductFeignService;
import org.june.cart.interceptor.CartInterceptor;
import org.june.cart.service.CartService;
import org.june.cart.vo.Cart;
import org.june.cart.vo.CartItem;
import org.june.cart.vo.SkuInfoVo;
import org.june.common.constant.CartConstant;
import org.june.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.stream.Collectors;


@Service
@Slf4j
public class CartServiceImpl implements CartService {
    @Autowired
    StringRedisTemplate redisTemplate;
    @Autowired
    ProductFeignService productFeignService;
    @Autowired
    ThreadPoolExecutor executor;


    /**
     * 查询购物车列表
     */
    @Override
    public List<CartItem> cartList() {
        Cart cart = getCart(CartInterceptor.loginUser.get());
        return cart.getItems().stream().
                filter(CartItem::getCheck).
                map(item -> {
                    // 更新价格
                    R r = productFeignService.getPrice(item.getSkuId());
                    if (r.getCode() == 0) {
                        BigDecimal data = r.getData(new TypeReference<BigDecimal>() {
                        });
                        item.setPrice(data);
                    } else {
                        // 商品查询不到价格? TODO
                        item.setPrice(new BigDecimal("9999999"));
                    }
                    return item;
                }).
                collect(Collectors.toList());
    }

    /**
     * 添加到购物车，但实际可能是修改操作
     */
    @Override
    public CartItem addToCart(Long skuId, Integer num, Long memberId) {
        // key  prefix-memberId -> cart:8 |  hash-key -> skuId  hash-value -> cartItem-Json
        BoundHashOperations<String, String, String> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        CartItem cartItem = new CartItem();

        String o = bound.get(skuId.toString());
        if (StringUtils.isEmpty(o)) {
            // 添加
            fillItem(skuId, num, cartItem);
            bound.put(skuId.toString(), JSON.toJSONString(cartItem));
        } else {
            // 修改，把redis中的json取出来改一遍就行了
            cartItem = JSON.parseObject(o, CartItem.class);
            cartItem.setCount(cartItem.getCount() + num);
            bound.put(skuId.toString(), JSON.toJSONString(cartItem));
        }
        return cartItem;
    }

    @Override
    public CartItem getCartItem(Long skuId, Long memberId) {
        BoundHashOperations<String, String, String> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        String s = bound.get(skuId.toString());
        return JSON.parseObject(s, CartItem.class);
    }

    /**
     * 由redis中购物项的数据封装一个购物车
     */
    @Override
    public Cart getCart(Long memberId) {
        BoundHashOperations<String, String, String> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        Cart cart = new Cart();
        List<String> values = bound.values();  // hash-key + hash-value
        if (!CollectionUtils.isEmpty(values)) {
            List<CartItem> collect = values.stream().map(item ->
                    JSON.parseObject(item, CartItem.class)).collect(Collectors.toList());
            cart.setItems(collect);
        }
        return cart;
    }
    /**
     * 清空购物车
     */
    @Override
    public void clearCart(Long memberId) {
        redisTemplate.delete(CartConstant.CART_MEMBER_PREFIX + memberId);
    }

    /**
     * 更改选中状态
     * 1选中true，0没选中false
     */
    @Override
    public void checkItem(Long skuId, Integer check, Long memberId) {
        BoundHashOperations<String, Object, Object> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        CartItem cartItem = getCartItem(skuId, memberId);
        cartItem.setCheck(check == 1);
        bound.put(skuId.toString(), JSON.toJSONString(cartItem));
    }

    @Override
    public void countItem(Long skuId, Integer count, Long memberId) {
        BoundHashOperations<String, Object, Object> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        CartItem cartItem = getCartItem(skuId, memberId);
        cartItem.setCount(count);
        bound.put(skuId.toString(), JSON.toJSONString(cartItem));
    }

    /**
     * 删除某个商品
     */
    @Override
    public void deleteItem(Long skuId, Long memberId) {
        BoundHashOperations<String, Object, Object> bound =
                redisTemplate.boundHashOps(CartConstant.CART_MEMBER_PREFIX + memberId);
        bound.delete(skuId.toString());
    }


    /**
     * 该方法由添加购物车入口调用，主要是查询并封装传入的参数 cartItem
     */
    private void fillItem(Long skuId, Integer num, CartItem cartItem) {
        // f1:获取sku-info
        CompletableFuture<Void> f1 = CompletableFuture.runAsync(() -> {
            R info = productFeignService.info(skuId);
            if (info.getCode() != 0) {
                log.error("远程调用出错1");
            }
            SkuInfoVo skuInfo = info.getData(new TypeReference<SkuInfoVo>() {
            });
            // 商品添加到购物车
            cartItem.setCheck(true);
            cartItem.setImage(skuInfo.getSkuDefaultImg());
            cartItem.setCount(num);
            cartItem.setTitle(skuInfo.getSkuTitle());
            cartItem.setSkuId(skuId);
            cartItem.setPrice(skuInfo.getPrice());
        }, executor);
        // f2:获取sku-attrs
        CompletableFuture<Void> f2 = CompletableFuture.runAsync(() -> {
            R r = productFeignService.getSkuSaleAttrValues(skuId);
            if (r.getCode() != 0) log.error("远程调用出错2");
            List<String> data = (List<String>) r.get("data");
            cartItem.setSkuAttr(data);

        }, executor);

        try {
            CompletableFuture.allOf(f1, f2).get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
    }
}
