package com.zeus.recruit.Common.impl;

import com.alibaba.fastjson2.JSON;
import com.zeus.common.constant.EmailStatusConstants;
import com.zeus.common.constant.RedisConstant;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.domain.param.RegisterParam;
import com.zeus.common.utils.StringUtils;
import com.zeus.common.utils.uuid.UUID;
import com.zeus.recruit.Common.CommonService;
import com.zeus.recruit.Thread.ThreadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
public class CommonServiceImpl implements CommonService {
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Autowired
    private ThreadService threadService;

    @Override
    public AjaxResult getRequestPermissionCode(String emailJson) {
        // 非空校验
        if(StringUtils.isBlank(emailJson)){
            return AjaxResult.error(EmailStatusConstants.PARAM_ERROR_CODE,EmailStatusConstants.PARAM_ERROR_MSG);
        }

        // JSON装换,提取email的值
        String email = JSON.parseObject(emailJson).getString("email").trim();
//        Map map = JSON.parseObject(emailJson, Map.class);
//        String email = map.get("email").toString();

        // 邮箱校验
        if(!StringUtils.checkEmail(email)){
            return AjaxResult.error(EmailStatusConstants.EMAIL_ERROR_CODE,EmailStatusConstants.EMAIL_ERROR_MSG);
        }

        // 随机生成权限吗
        String permissionCode = UUID.randomUUID().toString();

        // 存入redis,缓存60s
        redisTemplate.opsForValue().set(RedisConstant.EMAIL_REQUEST_VERIFY + email, permissionCode, RedisConstant.EXPIRE_ONE_MINUTE, TimeUnit.SECONDS);

        // 返回
        return AjaxResult.success("获取权限码请求成功",permissionCode);
    }

    @Override
    public AjaxResult sendEmailCode(RegisterParam registerParam) {
        // 如果注册参数为空
        if(registerParam == null){
            return AjaxResult.error(EmailStatusConstants.PARAM_ERROR_CODE,EmailStatusConstants.PARAM_ERROR_MSG);
        }

        // 获取权限码和邮箱
        String email = registerParam.getEmail();
        String permissionCode = registerParam.getPermissionCode();

        // 参数校验
        if (StringUtils.isAnyBlank(email,permissionCode)){
            return AjaxResult.error(EmailStatusConstants.PARAM_ERROR_CODE,EmailStatusConstants.PARAM_ERROR_MSG);
        }else if(!StringUtils.checkEmail(email)){
            // 邮箱校验
            return AjaxResult.error(EmailStatusConstants.EMAIL_ERROR_CODE,EmailStatusConstants.EMAIL_ERROR_MSG);
        }else {
            // 权限码对比
            String rightCode = redisTemplate.opsForValue().get(RedisConstant.EMAIL_REQUEST_VERIFY + email);
            if(!permissionCode.equals(rightCode)){
                // 不通过
                return AjaxResult.error(EmailStatusConstants.ILLEGAL_OPERATION__CODE,EmailStatusConstants.ILLEGAL_OPERATION_MSG);
            }
        }

        // 全部通过

        // 生成随机6位数字验证码
        String coding = StringUtils.randomSixCode();

        // 正文内容
        String content = "亲爱的用户：\n" +
                "您此次的验证码为：\n\n" +
                coding + "\n\n" +
                "此验证码5分钟内有效，请立即进行下一步操作。 如非你本人操作，请忽略此邮件。\n" +
                "感谢您的使用！";

        // 发送验证码
        threadService.sendSimpleMail(email, "您此次的验证码为：" + coding, content);

        // 丢人缓存,设置5分钟过期
        redisTemplate.opsForValue().set(RedisConstant.EMAIL + email, coding, RedisConstant.EXPIRE_FIVE_MINUTE, TimeUnit.SECONDS);

        return AjaxResult.success("验证码已发送至邮箱，请注意查收",coding);
    }
}
