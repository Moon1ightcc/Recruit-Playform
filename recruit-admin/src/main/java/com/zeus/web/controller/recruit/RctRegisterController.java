package com.zeus.web.controller.recruit;

import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.domain.vo.RegisterCompanyVo;
import com.zeus.common.core.domain.vo.RegisterVo;
import com.zeus.common.utils.StringUtils;
import com.zeus.framework.web.service.SysRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.zeus.common.core.domain.AjaxResult.error;
import static com.zeus.common.core.domain.AjaxResult.success;

@RestController
@RequestMapping("/recruit/register")
public class RctRegisterController {

    @Autowired
    private SysRegisterService registerService;

    /**
     * 普通求职用户注册
     * @param user 求职用户注册vo类
     * @return 返回注册的结果
     */

    @PostMapping("/user")
    public AjaxResult register(@RequestBody RegisterVo user){

        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);

    }

    /**
     * 普通企业用户注册
     * @param companyUser 企业用户注册vo类型
     * @return 返回注册的结果
     */

    @PostMapping("/company")
    public AjaxResult register(@RequestBody RegisterCompanyVo companyUser){

        String msg = registerService.register(companyUser);
        return StringUtils.isEmpty(msg) ? success() : error(msg);

    }

}
