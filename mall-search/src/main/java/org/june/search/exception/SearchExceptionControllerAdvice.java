package org.june.search.exception;

import lombok.extern.slf4j.Slf4j;
import org.june.common.exception.StatusCode;
import org.june.common.utils.R;
import org.june.search.service.exception.ProductUpException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestControllerAdvice(basePackages = "org.june.search.controller")
public class SearchExceptionControllerAdvice {
    @ExceptionHandler(value = {ProductUpException.class})
    public R handleValidException(ProductUpException e) {
        log.error("商品上架异常：{}\n异常类型：{}\n异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.VALID_EXCEPTION.getCode(), StatusCode.VALID_EXCEPTION.getMsg()).put("data", e.getMessage());
    }

    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable e) {
        e.printStackTrace();
        log.error("Search服务未知异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.SEARCH_SERVICE_UNKNOW_EXCEPTION.getCode(),
                StatusCode.SEARCH_SERVICE_UNKNOW_EXCEPTION.getMsg());
    }
}
