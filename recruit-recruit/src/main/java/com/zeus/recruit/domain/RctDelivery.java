package com.zeus.recruit.domain;

import com.zeus.common.annotation.Excel;
import com.zeus.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 简历投递信息对象 rct_delivery
 *
 * @author Ayase
 * @date 2022-10-17
 */
public class RctDelivery extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    @Excel(name = "ID")
    private Long deliveryId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String nickName;

    /** 岗位信息ID */
    @Excel(name = "岗位信息ID")
    private Long positionId;

    /** 岗位名称 */
    @Excel(name = "岗位名称")
    private String positionName;

    /** 投递状态 */
    @Excel(name = "投递状态")
    private String deliveryStatus;

    /** 公司ID */
    @Excel(name = "公司ID")
    private Long companyId;

    /** 公司名称 */
    @Excel(name = "公司名称")
    private String companyName;

    public RctPosition getPosition() {
        return position;
    }

    public void setPosition(RctPosition position) {
        this.position = position;
    }

    private RctPosition position;

    public void setDeliveryId(Long deliveryId)
    {
        this.deliveryId = deliveryId;
    }

    public Long getDeliveryId()
    {
        return deliveryId;
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
    public void setPositionId(Long positionId)
    {
        this.positionId = positionId;
    }

    public Long getPositionId()
    {
        return positionId;
    }
    public void setPositionName(String positionName)
    {
        this.positionName = positionName;
    }

    public String getPositionName()
    {
        return positionName;
    }
    public void setDeliveryStatus(String deliveryStatus)
    {
        this.deliveryStatus = deliveryStatus;
    }

    public String getDeliveryStatus()
    {
        return deliveryStatus;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("deliveryId", getDeliveryId())
                .append("userId", getUserId())
                .append("nickName", getNickName())
                .append("positionId", getPositionId())
                .append("positionName", getPositionName())
                .append("deliveryStatus", getDeliveryStatus())
                .append("companyId", getCompanyId())
                .append("companyName", getCompanyName())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("position", getPosition())
                .toString();
    }
}
