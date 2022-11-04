package com.zeus.common.core.domain.param;

import lombok.Getter;

@Getter
public class RegisterParam {

    private String email; // 邮箱

    private String permissionCode; // 验证码
}

