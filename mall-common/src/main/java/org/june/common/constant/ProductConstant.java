package org.june.common.constant;

public class ProductConstant {
    public enum AttrEnum {
        ATTR_TYPE_BASE(1, "基本属性/规格参数"), ATTR_TYPE_SALE(0, "销售属性");
        private final int code;
        private final String msg;

        AttrEnum(int code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public int getCode() {
            return code;
        }

        public String getMsg() {
            return msg;
        }
    }

    public enum SpuStatusEnum {
        SPU_NEW(0, "新建"),
        SPU_UP(1, "上架"),
        SPU_DOWN(2, "下架");
        private final int code;
        private final String msg;

        SpuStatusEnum(int code, String msg) {
            this.code = code;
            this.msg = msg;
        }

        public int getCode() {
            return code;
        }

        public String getMsg() {
            return msg;
        }
    }

}
