package org.june.member.exception;

public class UsernameHasExistException extends RuntimeException {
    public UsernameHasExistException() {
        super("用户名已存在");
    }
}
