package com.zeus.recruit.domain;

import com.zeus.common.annotation.Excel;
import com.zeus.common.core.domain.BaseEntity;
import com.zeus.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 企业信息对象 rct_company
 * 
 * @author Ayase
 * @date 2022-10-15
 */
public class RctCompany extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long companyId;

    /** 公司名称 */
    @Excel(name = "公司名称")
    private String companyName;

    /** 公司地址 */
    @Excel(name = "公司地址")
    private String companyAddress;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phonenumber;

    /** 公司LOGO */
    @Excel(name = "公司LOGO")
    private String logo;

    /** 营业执照 */
    @Excel(name = "营业执照")
    private String license;

    /** 审核状态（0未审核 1审核中 2审核成功 3审核失败） */
    @Excel(name = "审核状态", readConverterExp = "0=未审核,1=审核中,2=审核成功,3=审核失败")
    private String status;

    /** 公司性质 */
    @Excel(name = "公司性质")
    private String nature;

    /** 所属用户ID */
    @Excel(name = "所属用户ID")
    private Long userId;

    /** 公司同一城市数量 */
    private Long sum;

    private SysUser user;

    public Long getSum() {
        return sum;
    }

    public void setSum(Long sum) {
        this.sum = sum;
    }

    public SysUser getUser() {
        return user;
    }

    public void setUser(SysUser user) {
        this.user = user;
    }

    public void setCompanyId(Long companyId)
    {
        this.companyId = companyId;
    }

    public Long getCompanyId() 
    {
        return companyId;
    }
    public void setCompanyName(String companyName) 
    {
        this.companyName = companyName;
    }

    public String getCompanyName() 
    {
        return companyName;
    }
    public void setCompanyAddress(String companyAddress) 
    {
        this.companyAddress = companyAddress;
    }

    public String getCompanyAddress() 
    {
        return companyAddress;
    }
    public void setPhonenumber(String phonenumber) 
    {
        this.phonenumber = phonenumber;
    }

    public String getPhonenumber() 
    {
        return phonenumber;
    }
    public void setLogo(String logo) 
    {
        this.logo = logo;
    }

    public String getLogo() 
    {
        return logo;
    }
    public void setLicense(String license) 
    {
        this.license = license;
    }

    public String getLicense() 
    {
        return license;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setNature(String nature) 
    {
        this.nature = nature;
    }

    public String getNature() 
    {
        return nature;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("companyId", getCompanyId())
            .append("companyName", getCompanyName())
            .append("companyAddress", getCompanyAddress())
            .append("phonenumber", getPhonenumber())
            .append("logo", getLogo())
            .append("license", getLicense())
            .append("status", getStatus())
            .append("nature", getNature())
            .append("userId", getUserId())
            .append("createBy", getCreateBy())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("user",getUser())
            .append("sum",getSum())
                .toString();
    }
}
