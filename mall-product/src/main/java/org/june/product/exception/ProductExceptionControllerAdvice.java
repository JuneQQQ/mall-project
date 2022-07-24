package org.june.product.exception;

import lombok.extern.slf4j.Slf4j;
import org.june.common.exception.StatusCode;
import org.june.common.utils.R;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestControllerAdvice(basePackages = "org.june.product.controller")
public class ProductExceptionControllerAdvice {
    @ExceptionHandler(value = {MethodArgumentNotValidException.class})
    public R handleValidException(MethodArgumentNotValidException e) {
        log.error("数据校验出现问题：{}\n异常类型：{}\n异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        BindingResult bindingResult = e.getBindingResult();
        Map<String, String> errorMap = new HashMap<>();
        bindingResult.getFieldErrors().forEach(result -> errorMap.put(result.getField(), result.getDefaultMessage()));
        return R.error(StatusCode.VALID_EXCEPTION.getCode(), StatusCode.VALID_EXCEPTION.getMsg()).put("data", errorMap);
    }

    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable e) {
        e.printStackTrace();
        log.error("未知异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.UNKNOW_EXCEPTION.getCode(), StatusCode.UNKNOW_EXCEPTION.getMsg());
    }
}
