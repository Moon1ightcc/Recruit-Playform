package com.zeus.recruit.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zeus.common.annotation.Excel;
import com.zeus.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 简历信息对象 rct_resume
 * 
 * @author Ayase
 * @date 2022-10-18
 */
public class RctResume extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 简历ID */
    private Long resumeId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String nickName;

    /** 性别 */
    @Excel(name = "性别")
    private String sex;

    /** 健康状态 */
    @Excel(name = "健康状态")
    private String healthStatus;

    /** 求职意向 */
    @Excel(name = "求职意向")
    private String jobIntention;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String politicsStatus;

    /** 最高学历 */
    @Excel(name = "最高学历")
    private String education;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date birthday;

    /** 所学专业 */
    @Excel(name = "所学专业")
    private String major;

    /** 现居地 */
    @Excel(name = "现居地")
    private String presentAddress;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 所获奖项 */
    @Excel(name = "所获奖项")
    private String award;

    /** 自我评价 */
    @Excel(name = "自我评价")
    private String selfEvaluation;

    /** 简历附件 */
    @Excel(name = "简历附件")
    private String resumeFile;

    public void setResumeId(Long resumeId) 
    {
        this.resumeId = resumeId;
    }

    public Long getResumeId() 
    {
        return resumeId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setNickName(String nickName) 
    {
        this.nickName = nickName;
    }

    public String getNickName() 
    {
        return nickName;
    }
    public void setSex(String sex) 
    {
        this.sex = sex;
    }

    public String getSex() 
    {
        return sex;
    }
    public void setHealthStatus(String healthStatus) 
    {
        this.healthStatus = healthStatus;
    }

    public String getHealthStatus() 
    {
        return healthStatus;
    }
    public void setJobIntention(String jobIntention) 
    {
        this.jobIntention = jobIntention;
    }

    public String getJobIntention() 
    {
        return jobIntention;
    }
    public void setPoliticsStatus(String politicsStatus) 
    {
        this.politicsStatus = politicsStatus;
    }

    public String getPoliticsStatus() 
    {
        return politicsStatus;
    }
    public void setEducation(String education) 
    {
        this.education = education;
    }

    public String getEducation() 
    {
        return education;
    }
    public void setBirthday(Date birthday) 
    {
        this.birthday = birthday;
    }

    public Date getBirthday() 
    {
        return birthday;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setPresentAddress(String presentAddress) 
    {
        this.presentAddress = presentAddress;
    }

    public String getPresentAddress() 
    {
        return presentAddress;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setAward(String award) 
    {
        this.award = award;
    }

    public String getAward() 
    {
        return award;
    }
    public void setSelfEvaluation(String selfEvaluation) 
    {
        this.selfEvaluation = selfEvaluation;
    }

    public String getSelfEvaluation() 
    {
        return selfEvaluation;
    }
    public void setResumeFile(String resumeFile) 
    {
        this.resumeFile = resumeFile;
    }

    public String getResumeFile() 
    {
        return resumeFile;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("resumeId", getResumeId())
            .append("userId", getUserId())
            .append("nickName", getNickName())
            .append("sex", getSex())
            .append("healthStatus", getHealthStatus())
            .append("jobIntention", getJobIntention())
            .append("politicsStatus", getPoliticsStatus())
            .append("education", getEducation())
            .append("birthday", getBirthday())
            .append("major", getMajor())
            .append("presentAddress", getPresentAddress())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("award", getAward())
            .append("selfEvaluation", getSelfEvaluation())
            .append("resumeFile", getResumeFile())
            .toString();
    }
}
