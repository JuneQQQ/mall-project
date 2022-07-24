package org.june.member.exception;

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
@RestControllerAdvice(basePackages = "org.june.member.controller")
public class MemberExceptionControllerAdvice {
    @ExceptionHandler(value = PhoneHasExistException.class)
    public R handleException(PhoneHasExistException e) {
        e.printStackTrace();
        log.error("服务异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.PHONE_HAS_EXIST_EXCEPTION.getCode(), StatusCode.PHONE_HAS_EXIST_EXCEPTION.getMsg());
    }

    @ExceptionHandler(value = UsernameHasExistException.class)
    public R handleException(UsernameHasExistException e) {
        e.printStackTrace();
        log.error("服务异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.USERNAME_HAS_EXIST_EXCEPTION.getCode(), StatusCode.USERNAME_HAS_EXIST_EXCEPTION.getMsg());
    }

    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable e) {
        e.printStackTrace();
        log.error("未知异常：{},异常类型：{}，异常原因：{}", e.getMessage(), e.getClass(), e.getCause());
        return R.error(StatusCode.UNKNOW_EXCEPTION.getCode(), StatusCode.UNKNOW_EXCEPTION.getMsg());
    }
}
