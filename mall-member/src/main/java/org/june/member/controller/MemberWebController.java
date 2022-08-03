package org.june.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.june.common.utils.R;
import org.june.member.feign.OrderFeignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class MemberWebController {
    @Autowired
    OrderFeignService orderFeignService;

    @GetMapping("/memberOrder.html")
    public String memberOrderPage(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                  Model model) {
        Map<String, Object> page = new HashMap<>();
        page.put("page", pageNum);
        R r = orderFeignService.listWithItem(page);
        model.addAttribute("orders", r);

        return "orderList";
    }
}
