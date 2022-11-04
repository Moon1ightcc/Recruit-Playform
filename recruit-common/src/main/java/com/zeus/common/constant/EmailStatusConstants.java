package com.zeus.common.constant;

import lombok.Getter;

@Getter
public class EmailStatusConstants {

    public static final String EMAIL_ERROR_MSG = "邮箱格式不正确";
    public static final int EMAIL_ERROR_CODE = 4001;

    public static final String PARAM_ERROR_MSG = "参数格式不正确";
    public static final int PARAM_ERROR_CODE = 4002;

    public static final String CODE_ERROR_MSG = "验证码不正确";
    public static final int CODE_ERROR_CODE = 4002;

    public static final String PASSWORD_ERROR_MSG = "密码错误";
    public static final int PASSWORD_ERROR_CODE = 4003;

    public static final String USER_NOT_EXIST_MSG = "用户不存在";
    public static final int USER_NOT_EXIST_CODE = 4004;

    public static final String EMAIL_ALREADY_EXIST_MSG = "邮箱已被注册";
    public static final int EMAIL_ALREADY_EXIST_CODE = 4005;

    public static final String PASSWORD_INCONSISTENT_MSG = "密码不一致";
    public static final int PASSWORD_INCONSISTENT_CODE = 4006;

    public static final String PARAM_ILLEGAL_MSG = "参数不合法";
    public static final int PARAM_ILLEGAL_CODE = 4007;

    public static final String ILLEGAL_OPERATION_MSG = "非法操作";
    public static final int ILLEGAL_OPERATION__CODE = 88888;
}
