package org.june.mall_third_party.controller;

import lombok.extern.slf4j.Slf4j;
import org.june.common.utils.R;
import org.june.mall_third_party.component.SmsComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
@RequestMapping("third/sms")
public class SmsController {
    @Autowired
    private SmsComponent smsComponent;

    @RequestMapping("/code")
    @ResponseBody
    public R sendCode(@RequestParam("phone") String phone, @RequestParam("code") String code) {
        smsComponent.sendSmsCode(phone, code);
        return R.ok();
    }
}
