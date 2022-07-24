package org.june.ware.exception;

import lombok.extern.slf4j.Slf4j;
import org.june.common.exception.StatusCode;
import org.june.common.utils.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice(basePackages = "org.june.ware.controller")
public class WareExceptionControllerAdvice {
    @ExceptionHandler(value = {PurchaseStatusException.class})
    public R handleValidException(PurchaseStatusException e) {
        log.error("采购需求状态可能不是新建状态，详细信息：{}\n异常类型：{}\n异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.PURCHASE_STATUS_ERROR.getCode(), StatusCode.PURCHASE_STATUS_ERROR.getMsg()).put("data", e.getMessage());
    }

    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable e) {
        e.printStackTrace();
        log.error("未知异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.UNKNOW_EXCEPTION.getCode(), StatusCode.UNKNOW_EXCEPTION.getMsg());
    }
}
