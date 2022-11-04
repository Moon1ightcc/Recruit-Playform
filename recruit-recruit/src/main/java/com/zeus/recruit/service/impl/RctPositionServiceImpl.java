package com.zeus.recruit.service.impl;

import com.zeus.common.utils.DateUtils;
import com.zeus.recruit.domain.RctCategory;
import com.zeus.recruit.domain.RctCompany;
import com.zeus.recruit.domain.RctPosition;
import com.zeus.recruit.mapper.RctCategoryMapper;
import com.zeus.recruit.mapper.RctPositionMapper;
import com.zeus.recruit.service.IRctPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 招聘岗位Service业务层处理
 * 
 * @author Ayase
 * @date 2022-10-16
 */
@Service
public class RctPositionServiceImpl implements IRctPositionService
{
    @Autowired
    private RctPositionMapper rctPositionMapper;

    @Autowired
    private RctCategoryMapper rctCategoryMapper;

    private static final String PREFIX_ADDRESS =  "http://localhost:82/dev-api";
    ;

    /**
     * 查询招聘岗位
     * 
     * @param recruitId 招聘岗位主键
     * @return 招聘岗位
     */
    @Override
    public RctPosition selectRctPositionByRecruitId(Long recruitId)
    {
        return rctPositionMapper.selectRctPositionByRecruitId(recruitId);
    }

    /**
     * 查询招聘岗位列表
     * 
     * @param rctPosition 招聘岗位
     * @return 招聘岗位
     */
    @Override
    public List<RctPosition> selectRctPositionList(RctPosition rctPosition)
    {
        return rctPositionMapper.selectRctPositionList(rctPosition);
    }

    /**
     * 新增招聘岗位
     * 
     * @param rctPosition 招聘岗位
     * @return 结果
     */
    @Override
    public int insertRctPosition(RctPosition rctPosition)
    {
        rctPosition.setCreateTime(DateUtils.getNowDate());
        return rctPositionMapper.insertRctPosition(rctPosition);
    }

    /**
     * 修改招聘岗位
     * 
     * @param rctPosition 招聘岗位
     * @return 结果
     */
    @Override
    public int updateRctPosition(RctPosition rctPosition)
    {
        rctPosition.setUpdateTime(DateUtils.getNowDate());
        return rctPositionMapper.updateRctPosition(rctPosition);
    }

    /**
     * 批量删除招聘岗位
     * 
     * @param recruitIds 需要删除的招聘岗位主键
     * @return 结果
     */
    @Override
    public int deleteRctPositionByRecruitIds(Long[] recruitIds)
    {
        return rctPositionMapper.deleteRctPositionByRecruitIds(recruitIds);
    }

    /**
     * 删除招聘岗位信息
     * 
     * @param recruitId 招聘岗位主键
     * @return 结果
     */
    @Override
    public int deleteRctPositionByRecruitId(Long recruitId)
    {
        return rctPositionMapper.deleteRctPositionByRecruitId(recruitId);
    }

    /**
     * 查询热门招聘岗位信息
     *
     * @return 结果
     */
    @Override
    public List<RctPosition> selectHotPositionList() {
        List<RctPosition> rctPositionList = rctPositionMapper.selectRctHotPosition();

        for (RctPosition rctPosition : rctPositionList) {
            RctCategory category = rctPosition.getCategory();
            RctCompany company = rctPosition.getCompany();
            company.setLogo(PREFIX_ADDRESS+company.getLogo());
            String parentCategory = rctCategoryMapper.selectRctParentCategory(category.getParentId());
            RctCategory rctCategory =  rctCategoryMapper.selectRctCategoryByPositionId(category.getPositionId());
            category.setPositionName(rctCategory.getPositionName());
            category.setParentCategory(parentCategory);
        }

        return rctPositionList;
    }

    /**
     * 按名称条件模糊查询所有岗位
     *
     * @return 结果
     */
    @Override
    public List<RctPosition> listByPositionName(RctPosition rctPosition) {
        List<RctPosition> rctPositionList = rctPositionMapper.listByPositionName(rctPosition);

        for (RctPosition position : rctPositionList) {
            RctCategory category = position.getCategory();
            RctCompany company = position.getCompany();
            company.setLogo(PREFIX_ADDRESS+company.getLogo());
            String parentCategory = rctCategoryMapper.selectRctParentCategory(category.getParentId());
            RctCategory rctCategory =  rctCategoryMapper.selectRctCategoryByPositionId(category.getPositionId());
            category.setPositionName(rctCategory.getPositionName());
            category.setParentCategory(parentCategory);
        }

        return rctPositionList;
    }

    @Override
    public RctPosition selectPositionInfoVoByRecruitId(Long recruitId) {
        RctPosition position = rctPositionMapper.selectPositionInfoVoByRecruitId(recruitId);

        RctCategory category = position.getCategory();
        RctCompany company = position.getCompany();
        company.setLogo(PREFIX_ADDRESS+company.getLogo());
        String parentCategory = rctCategoryMapper.selectRctParentCategory(category.getParentId());
        RctCategory rctCategory =  rctCategoryMapper.selectRctCategoryByPositionId(category.getPositionId());
        category.setPositionName(rctCategory.getPositionName());
        category.setParentCategory(parentCategory);

        return position;
    }

    @Override
    public List<Map<Object, Object>> positionCountList() {
        return rctPositionMapper.positionCountList();
    }

    @Override
    public List<RctPosition> listByCompanyName(RctPosition rctPosition) {
        List<RctPosition> rctPositionList = rctPositionMapper.listByCompanyName(rctPosition);

        for (RctPosition position : rctPositionList) {
            RctCategory category = position.getCategory();
            RctCompany company = position.getCompany();
            company.setLogo(PREFIX_ADDRESS+company.getLogo());
            String parentCategory = rctCategoryMapper.selectRctParentCategory(category.getParentId());
            RctCategory rctCategory =  rctCategoryMapper.selectRctCategoryByPositionId(category.getPositionId());
            category.setPositionName(rctCategory.getPositionName());
            category.setParentCategory(parentCategory);
        }

        return rctPositionList;
    }

}
