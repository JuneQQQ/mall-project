package org.june.common.exception;

public enum StatusCode {
    UNKNOW_EXCEPTION(10000, "系统未知异常"),
    VALID_EXCEPTION(10001, "参数格式校验失败"),
    SMS_CODE_TO_OFTEN_EXCEPTION(10002, "验证码获取过于频繁"),
    TOO_MANY_REQUEST(10003, "请求流量过大"),
    PRODUCT_UP_EXCEPTION(11000, "商品上架异常"),
    PHONE_HAS_EXIST_EXCEPTION(15001, "手机号已经存在"),
    USERNAME_HAS_EXIST_EXCEPTION(15002, "用户名已存在"),
    USERNAME_PASSWORD_INVALID_EXCEPTION(15003, "用户名或密码错误"),
    NO_STOCK_EXCEPTION(21000, "商品库存不足"),
    PURCHASE_STATUS_ERROR(22000,"仅允许【新建状态】的采购单进行合并"),
    SEARCH_SERVICE_UNKNOW_EXCEPTION(30000,"Search服务未知异常");
    private int code;
    private String msg;

    StatusCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
