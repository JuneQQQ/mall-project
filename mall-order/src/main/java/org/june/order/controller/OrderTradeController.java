package org.june.order.controller;

import org.june.order.service.OrderService;
import org.june.order.vo.OrderConfirmVo;
import org.june.order.vo.OrderSubmitVo;
import org.june.order.vo.SubmitOrderResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class OrderTradeController {
    @Autowired
    OrderService orderService;

    @GetMapping("/toTrade")
    public String toTrade(Model model) {
        OrderConfirmVo o = orderService.confirmOrder();
        model.addAttribute("orderConfirmData", o);
        return "confirm";
    }

    @PostMapping("/submitOrder")
    public String submitOrder(OrderSubmitVo vo, Model model, RedirectAttributes attributes) {
        // 下单，去创建订单，验证令牌，验证价格，锁库存...
        // 下单成功来到支付选择页
        // 下单失败回到订单确认页重新确认订单信息
        SubmitOrderResponseVo s = orderService.submitOrder(vo);
        if (s.getCode() == 0) {
            model.addAttribute("submitOrderResp", s);
            return "pay";
        } else {
            String msg = "";
            switch (s.getCode()) {
                case 1:
                    msg += "订单信息过期，请刷新后再次提交";
                    break;
                case 2:
                    msg += "订单商品价格发生变化，请确认后重新提交";
                    break;
                case 3:
                    msg += "库存锁定失败，商品库存不足";
                    break;
            }
            attributes.addFlashAttribute("msg", msg);
            return "redirect:http://order.projectdemo.top/toTrade";
        }
    }
}
