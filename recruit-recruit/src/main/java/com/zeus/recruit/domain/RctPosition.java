package com.zeus.recruit.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zeus.common.annotation.Excel;
import com.zeus.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 招聘信息对象 rct_recruit
 *
 * @author Ayase
 * @date 2022-10-16
 */
public class RctPosition extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 招聘信息id */
    private Long recruitId;

    /** 招聘岗位名称 */
    @Excel(name = "招聘岗位名称")
    private String positionName;

    /** 要求 */
    @Excel(name = "要求")
    private String requirement;

    /** 工作城市 */
    @Excel(name = "工作城市")
    private String workCity;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deadline;

    /** 招聘人数 */
    @Excel(name = "招聘人数")
    private Long numbers;

    /** 最高薪资 */
    @Excel(name = "最高薪资")
    private BigDecimal maxSalary;

    /** 最低薪资 */
    @Excel(name = "最低薪资")
    private BigDecimal minSalary;

    /** 公司id */
    @Excel(name = "公司id")
    private Long companyId;

    /** 岗位分类id */
    @Excel(name = "岗位分类id")
    private Long categoryId;

    /** 审核（0 通过、1 驳回） */
    @Excel(name = "审核", readConverterExp = "0=,通=过、1,驳=回")
    private String status;


    private String companyName;

    /**岗位分类 */
    private RctCategory category;

    /** 公司 */
    private RctCompany company;

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public RctCategory getCategory() {
        return category;
    }

    public void setCategory(RctCategory category) {
        this.category = category;
    }

    public RctCompany getCompany() {
        return company;
    }

    public void setCompany(RctCompany company) {
        this.company = company;
    }

    public void setRecruitId(Long recruitId)
    {
        this.recruitId = recruitId;
    }

    public Long getRecruitId()
    {
        return recruitId;
    }
    public void setPositionName(String positionName)
    {
        this.positionName = positionName;
    }

    public String getPositionName()
    {
        return positionName;
    }
    public void setRequirement(String requirement)
    {
        this.requirement = requirement;
    }

    public String getRequirement()
    {
        return requirement;
    }
    public void setWorkCity(String workCity)
    {
        this.workCity = workCity;
    }

    public String getWorkCity()
    {
        return workCity;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setDeadline(Date deadline)
    {
        this.deadline = deadline;
    }

    public Date getDeadline()
    {
        return deadline;
    }
    public void setNumbers(Long numbers)
    {
        this.numbers = numbers;
    }

    public Long getNumbers()
    {
        return numbers;
    }
    public void setMaxSalary(BigDecimal maxSalary)
    {
        this.maxSalary = maxSalary;
    }

    public BigDecimal getMaxSalary()
    {
        return maxSalary;
    }
    public void setMinSalary(BigDecimal minSalary)
    {
        this.minSalary = minSalary;
    }

    public BigDecimal getMinSalary()
    {
        return minSalary;
    }
    public void setCompanyId(Long companyId)
    {
        this.companyId = companyId;
    }

    public Long getCompanyId()
    {
        return companyId;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("recruitId", getRecruitId())
                .append("positionName", getPositionName())
                .append("requirement", getRequirement())
                .append("workCity", getWorkCity())
                .append("phone", getPhone())
                .append("startTime", getStartTime())
                .append("deadline", getDeadline())
                .append("numbers", getNumbers())
                .append("maxSalary", getMaxSalary())
                .append("minSalary", getMinSalary())
                .append("companyId", getCompanyId())
                .append("status", getStatus())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("categoryId",getCategoryId())
                .append("companyName",getCompanyName())
                .toString();
    }
}
