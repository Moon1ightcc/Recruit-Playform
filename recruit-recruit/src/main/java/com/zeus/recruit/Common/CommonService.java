package com.zeus.recruit.Common;

import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.domain.param.RegisterParam;

public interface CommonService {
    /**
     * 获取请求权限码
     * @param emailJson 邮箱
     * @return
     */
    AjaxResult getRequestPermissionCode(String emailJson);

    /**
     * 发送邮箱验证码
     * @param registerParam （邮箱和权限码）
     * @return
     */
    AjaxResult sendEmailCode(RegisterParam registerParam);

}
