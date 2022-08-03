package org.june.cart.controller;

import org.june.cart.interceptor.CartInterceptor;
import org.june.cart.service.CartService;
import org.june.cart.vo.Cart;
import org.june.cart.vo.CartItem;
import org.june.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CartController {
    @Autowired
    CartService cartService;


    @GetMapping("/cart/list")
    @ResponseBody
    public R listJson() {
        List<CartItem> cartItemList = cartService.cartList();
        return R.ok().put("data", cartItemList);
    }


    @GetMapping("/cart/deleteItem")
    public String countItem(@RequestParam("skuId") Long skuId
    ) {

        cartService.deleteItem(skuId, CartInterceptor.loginUser.get());
        return "redirect:http://cart.projectdemo.top/cartList.html";
    }

    @GetMapping("/cart/countItem")
    public String countItem(@RequestParam("skuId") Long skuId,
                            @RequestParam("num") Integer count
    ) {
        cartService.countItem(skuId, count, CartInterceptor.loginUser.get());

        return "redirect:http://cart.projectdemo.top/cartList.html";
    }


    @GetMapping("/cart/checkItem")
    public String checkItem(@RequestParam("skuId") Long skuId,
                            @RequestParam("check") Integer check
    ) {
        cartService.checkItem(skuId, check, CartInterceptor.loginUser.get());

        return "redirect:http://cart.projectdemo.top/cartList.html";
    }

    @GetMapping("/cart/clearAll")
    public String clearCart() {
        cartService.clearCart(CartInterceptor.loginUser.get());
        return "cartList";
    }

    /**
     * 购物车列表页
     */
    @GetMapping("/cartList.html")
    public String cartListPage(Model model) {
        Cart cart = cartService.getCart(CartInterceptor.loginUser.get());
        model.addAttribute("cart", cart);
        return "cartList";
    }


    /**
     * auth:login
     * 添加购物车
     * RedirectAttributes ra
     *  ra.addFlashAttribute()  放在session里，只能取出一次
     *  ra.addAttribute() 放在url后面
     */
    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("skuId") Long skuId, @RequestParam("num") Integer num) {
        cartService.addToCart(skuId, num, CartInterceptor.loginUser.get());
        return "redirect:http://cart.projectdemo.top/cart/getItem.html?skuId=" + skuId;
    }

    /**
     * 查询单个购物项
     * 添加到购物车成功后，重定向到此接口
     */
    @GetMapping("/cart/getItem.html")
    public String addToCartSuccessPage(@RequestParam("skuId") Long skuId, Model model) {
        CartItem cart = cartService.getCartItem(skuId, CartInterceptor.loginUser.get());
        model.addAttribute("item", cart);
        return "success";
    }

}
