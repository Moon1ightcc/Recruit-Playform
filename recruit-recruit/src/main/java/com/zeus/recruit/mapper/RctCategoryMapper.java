package com.zeus.recruit.mapper;

import com.zeus.recruit.domain.RctCategory;

import java.util.List;

/**
 * 招聘分类Mapper接口
 *
 * @author Ayase
 * @date 2022-10-15
 */
public interface RctCategoryMapper
{
    /**
     * 查询招聘分类
     *
     * @param positionId 招聘分类主键
     * @return 招聘分类
     */
    public RctCategory selectRctCategoryByPositionId(Long positionId);

    /**
     * 查询不属于大分类的招聘岗位
     *
     * @return 招聘分类
     */
    public List<RctCategory> selectRctCategoryNotParent();

    /**
     * 查询招聘分类列表
     *
     * @param rctCategory 招聘分类
     * @return 招聘分类集合
     */
    public List<RctCategory> selectRctCategoryList(RctCategory rctCategory);

    /**
     * 新增招聘分类
     *
     * @param rctCategory 招聘分类
     * @return 结果
     */
    public int insertRctCategory(RctCategory rctCategory);

    /**
     * 修改招聘分类
     *
     * @param rctCategory 招聘分类
     * @return 结果
     */
    public int updateRctCategory(RctCategory rctCategory);

    /**
     * 删除招聘分类
     *
     * @param positionId 招聘分类主键
     * @return 结果
     */
    public int deleteRctCategoryByPositionId(Long positionId);

    /**
     * 批量删除招聘分类
     *
     * @param positionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRctCategoryByPositionIds(Long[] positionIds);

    String selectRctParentCategory(Long parentId);
}
