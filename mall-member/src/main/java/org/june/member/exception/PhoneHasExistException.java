package org.june.member.exception;

public class PhoneHasExistException extends RuntimeException {
    public PhoneHasExistException() {
        super("手机号码已存在");
    }
}
