package org.june.cart.service;

import org.june.cart.vo.Cart;
import org.june.cart.vo.CartItem;

import java.util.List;

public interface CartService {

    CartItem addToCart(Long skuId, Integer num, Long id);

    CartItem getCartItem(Long skuId, Long id);

    Cart getCart(Long id);

    void clearCart(Long id);

    void checkItem(Long skuId, Integer check, Long id);

    void countItem(Long skuId, Integer count, Long id);

    void deleteItem(Long skuId, Long id);

    List<CartItem> cartList();
}
