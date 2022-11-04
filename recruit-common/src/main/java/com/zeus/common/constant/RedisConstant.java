package com.zeus.common.constant;

public class RedisConstant {

    // Key
    /**
     * 邮箱缓存前缀
     */
    public static final String EMAIL = "EMAIL_";
    /**
     * 邮箱请求的权限码
     */
    public static final String EMAIL_REQUEST_VERIFY = "EMAIL_REQUEST_VERIFY_";

    // 缓存时间
    public static final int EXPIRE_TEN_SECOND = 10; // 10s
    public static final int EXPIRE_ONE_MINUTE = 60; // 1分钟
    public static final int EXPIRE_FIVE_MINUTE = 5 * 60; // （五分钟）
    public static final int EXPIRE_HALF_HOUR = 30 * 60; // 半小时（30分钟）
    public static final int EXPIRE_ONE_DAY = 24 * 60 * 60; // （1天）


}
