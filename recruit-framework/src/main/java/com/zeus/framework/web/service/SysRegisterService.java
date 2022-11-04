package com.zeus.framework.web.service;

import com.zeus.common.constant.CacheConstants;
import com.zeus.common.constant.Constants;
import com.zeus.common.constant.RedisConstant;
import com.zeus.common.constant.UserConstants;
import com.zeus.common.core.domain.entity.SysUser;
import com.zeus.common.core.domain.model.RegisterBody;
import com.zeus.common.core.domain.vo.RegisterCompanyVo;
import com.zeus.common.core.domain.vo.RegisterVo;
import com.zeus.common.core.redis.RedisCache;
import com.zeus.common.exception.user.CaptchaException;
import com.zeus.common.exception.user.CaptchaExpireException;
import com.zeus.common.utils.MessageUtils;
import com.zeus.common.utils.SecurityUtils;
import com.zeus.common.utils.StringUtils;
import com.zeus.framework.manager.AsyncManager;
import com.zeus.framework.manager.factory.AsyncFactory;
import com.zeus.recruit.domain.RctCompany;
import com.zeus.recruit.service.IRctCompanyService;
import com.zeus.system.service.ISysConfigService;
import com.zeus.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 注册校验方法
 *
 * @author ruoyi
 */
@Component
public class SysRegisterService {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private IRctCompanyService companyService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 重载注册方法，用于注册求职用户
     */
    public String register(RegisterVo registerVo) {
        String msg = "", userName = registerVo.getUserName(), password = registerVo.getPassword();
        String phonenumber = registerVo.getPhonenumber(), email = registerVo.getEmail();
        String code = registerVo.getCode(), nickName = registerVo.getNickName();
        SysUser applicantUser = new SysUser();
        applicantUser.setUserName(userName);

        if (code.equals(redisTemplate.opsForValue().get(RedisConstant.EMAIL + email))) {
            if (StringUtils.isEmpty(userName)) {
                msg = "用户名不能为空";
            } else if (StringUtils.isEmpty(password)) {
                msg = "用户密码不能为空";
            } else if (userName.length() < UserConstants.USERNAME_MIN_LENGTH
                    || userName.length() > UserConstants.USERNAME_MAX_LENGTH) {
                msg = "账户长度必须在2到20个字符之间";
            } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                    || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
                msg = "密码长度必须在5到20个字符之间";
            } else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(applicantUser))) {
                msg = "保存用户'" + userName + "'失败，注册账号已存在";
            } else {
                applicantUser.setUserName(userName);
                applicantUser.setNickName(nickName);
                applicantUser.setPhonenumber(phonenumber);
                applicantUser.setEmail(email);
                // 将注册用户类型设置为求职用户类型
                applicantUser.setUserType("10");
                applicantUser.setPassword(SecurityUtils.encryptPassword(password));
                boolean regFlag = userService.registerUser(applicantUser);
                if (!regFlag) {
                    msg = "注册失败,请联系系统管理人员";
                } else {
                    SysUser user = userService.selectUserByUserName(applicantUser.getUserName());
                    userService.updateApplicant(user);
                    AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.REGISTER, MessageUtils.message("user.register.success")));
                }
            }
        } else {
            msg = "验证码不正确,请检查邮箱是否收到";
        }

        return msg;
    }

    /**
     * 重载注册方法，用于注册求职用户
     */
    public String register(RegisterCompanyVo registerCompanyVo) {
        String msg = "", userName = registerCompanyVo.getUserName(), nickName = registerCompanyVo.getNickName();
        String phonenumber = registerCompanyVo.getPhonenumber(), email = registerCompanyVo.getEmail();
        String code = registerCompanyVo.getCode(), password = registerCompanyVo.getPassword();
        String address = registerCompanyVo.getCompanyAddress(), remark = registerCompanyVo.getRemark();
        String nature = registerCompanyVo.getNature(), companyName = registerCompanyVo.getCompanyName();

        // 创建一个用户对象
        SysUser companyUser = new SysUser();
        // 创建一个企业对象
        RctCompany company = new RctCompany();

        companyUser.setUserName(userName);
        company.setCompanyName(companyName);

        if (code.equals(redisTemplate.opsForValue().get(RedisConstant.EMAIL + email))) {
            if (StringUtils.isEmpty(userName)) {
                msg = "用户名不能为空";
            } else if (StringUtils.isEmpty(password)) {
                msg = "用户密码不能为空";
            } else if (userName.length() < UserConstants.USERNAME_MIN_LENGTH
                    || userName.length() > UserConstants.USERNAME_MAX_LENGTH) {
                msg = "账户长度必须在2到20个字符之间";
            } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                    || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
                msg = "密码长度必须在5到20个字符之间";
            } else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(companyUser))) {
                msg = "保存用户'" + userName + "'失败，注册账号已存在";
            } else if (UserConstants.NOT_UNIQUE.equals(companyService.checkComapnyNameUnique(company))) {
                msg = "保存企业名称'" + companyName + "'失败，企业名称已存在";
            } else {
                companyUser.setUserName(userName);
                companyUser.setNickName(nickName);
                companyUser.setPhonenumber(phonenumber);
                companyUser.setEmail(email);
                // 将注册用户类型设置为求职用户类型
                companyUser.setUserType("11");
                companyUser.setPassword(SecurityUtils.encryptPassword(password));

                // 将企业信息插入企业实对象
                company.setCompanyAddress(address);
                company.setNature(nature);
                company.setRemark(remark);
                company.setPhonenumber(phonenumber);
                boolean regFlag = userService.registerUser(companyUser);
                if (!regFlag) {
                    msg = "注册失败,请联系系统管理人员";
                } else {
                    SysUser user = userService.selectUserByUserName(companyUser.getUserName());
                    userService.updateCompany(user);
                    // 将新插入的用户id绑定到企业的所属用户id中
                    company.setUserId(user.getUserId());
                    // 调用新增企业接口,将用户数据插入企业表当中
                    companyService.insertRctCompany(company);
                    AsyncManager.me().execute(AsyncFactory.recordLogininfor(userName, Constants.REGISTER, MessageUtils.message("user.register.success")));
                }
            }
        } else {
            msg = "验证码不正确,请检查邮箱是否收到";
        }

        return msg;
    }

    /**
     * 注册
     */
    public String register(RegisterBody registerBody) {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword();
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);

        // 验证码开关
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled) {
            validateCaptcha(username, registerBody.getCode(), registerBody.getUuid());
        }

        if (StringUtils.isEmpty(username)) {
            msg = "用户名不能为空";
        } else if (StringUtils.isEmpty(password)) {
            msg = "用户密码不能为空";
        } else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            msg = "账户长度必须在2到20个字符之间";
        } else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            msg = "密码长度必须在5到20个字符之间";
        } else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(sysUser))) {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        } else {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag) {
                msg = "注册失败,请联系系统管理人员";
            } else {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code     验证码
     * @param uuid     唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid) {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null) {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException();
        }
    }
}
