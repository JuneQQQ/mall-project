package org.june.order.controller;


import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import lombok.extern.slf4j.Slf4j;
import org.june.order.config.AlipayTemplate;
import org.june.order.service.OrderService;
import org.june.order.vo.PayAsyncVo;
import org.june.order.vo.PayVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@Slf4j
@RefreshScope
public class PayController {
    @Autowired
    AlipayTemplate alipayTemplate;
    @Autowired
    OrderService orderService;

    @ResponseBody
    @GetMapping(value = "/order/alipay/pay", produces = "text/html")
    public String alipayOrder(@RequestParam("orderSn") String orderSn) throws AlipayApiException {
        PayVo vo = orderService.getPayVoByOrderSn(orderSn);
        return alipayTemplate.pay(vo);
    }

    @ResponseBody
    @PostMapping("/order/alipay/notify")
    public String handleAlipay(PayAsyncVo vo, HttpServletRequest request) throws AlipayApiException {
        log.error("异步回调！");
        // 1.验签
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean sign = AlipaySignature.rsaCheckV1(params, alipayTemplate.getAlipay_public_key(), alipayTemplate.getCharset(), alipayTemplate.getSign_type());
        // 2.改本地数据库
        if (sign) {
            orderService.saveOrderStatusAndPaymentEntity(vo);
            return "success";
        }
        return "error";
    }

}
