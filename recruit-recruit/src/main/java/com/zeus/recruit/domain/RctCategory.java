package com.zeus.recruit.domain;

import com.zeus.common.annotation.Excel;
import com.zeus.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 招聘分类对象 rct_category
 *
 * @author Ayase
 * @date 2022-10-15
 */
public class RctCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 岗位ID */
    private Long positionId;

    /** 岗位名称 */
    @Excel(name = "岗位名称")
    private String positionName;

    /** 父ID */
    @Excel(name = "父ID")
    private Long parentId;

    /** 岗位描述 */
    @Excel(name = "岗位描述")
    private String description;

    @Excel(name = "下级")
    private List<RctCategory> children;

    @Excel(name = "上级")
    private String parentCategory;

    public String getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(String parentCategory) {
        this.parentCategory = parentCategory;
    }
/*
    @Excel(name = "岗位分类等级")
    private Long level;


    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }
*/

    public List<RctCategory> getChildren() {
        return children;
    }

    public void setChildren(List<RctCategory> children) {
        this.children = children;
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
    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Long getParentId()
    {
        return parentId;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("positionId", getPositionId())
                .append("positionName", getPositionName())
                .append("parentId", getParentId())
                .append("description", getDescription())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("parentCategory",getParentCategory())
//                .append("level", getLevel())
//                .append("children", getChildren())
                .toString();
    }
}
