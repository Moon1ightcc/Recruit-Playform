package com.zeus.recruit.mapper;

import com.zeus.recruit.domain.RctPosition;

import java.util.List;
import java.util.Map;

/**
 * 招聘岗位Mapper接口
 * 
 * @author Ayase
 * @date 2022-10-16
 */
public interface RctPositionMapper
{
    /**
     * 查询招聘岗位
     * 
     * @param recruitId 招聘岗位主键
     * @return 招聘岗位
     */
    public RctPosition selectRctPositionByRecruitId(Long recruitId);

    /**
     * 查询招聘岗位列表
     * 
     * @param rctPosition 招聘岗位
     * @return 招聘岗位集合
     */
    public List<RctPosition> selectRctPositionList(RctPosition rctPosition);

    /**
     * 新增招聘岗位
     * 
     * @param rctPosition 招聘岗位
     * @return 结果
     */
    public int insertRctPosition(RctPosition rctPosition);

    /**
     * 修改招聘岗位
     * 
     * @param rctPosition 招聘岗位
     * @return 结果
     */
    public int updateRctPosition(RctPosition rctPosition);

    /**
     * 删除招聘岗位
     * 
     * @param recruitId 招聘岗位主键
     * @return 结果
     */
    public int deleteRctPositionByRecruitId(Long recruitId);

    /**
     * 批量删除招聘岗位
     * 
     * @param recruitIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRctPositionByRecruitIds(Long[] recruitIds);

    /**
     * 查询热门招聘岗位
     * @return 结果
     */
    public List<RctPosition> selectRctHotPosition();

    /**
     * 通过岗位名称查询岗位信息
     * @return 结果
     */
    public List<RctPosition> listByPositionName(RctPosition rctPosition);


    /**
     * 通过岗位Id获取岗位详情
     * @return 结果
     */
    public RctPosition selectPositionInfoVoByRecruitId(Long recruitId);

    public List<Map<Object, Object>> positionCountList();

    public List<RctPosition> listByCompanyName(RctPosition rctPosition);
}
