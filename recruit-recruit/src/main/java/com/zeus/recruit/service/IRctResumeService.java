package com.zeus.recruit.service;

import com.zeus.recruit.domain.RctResume;

import java.util.List;

/**
 * 简历信息Service接口
 * 
 * @author Ayase
 * @date 2022-10-18
 */
public interface IRctResumeService 
{
    /**
     * 查询简历信息
     * 
     * @param resumeId 简历信息主键
     * @return 简历信息
     */
    public RctResume selectRctResumeByResumeId(Long resumeId);

    /**
     * 查询简历信息列表
     * 
     * @param rctResume 简历信息
     * @return 简历信息集合
     */
    public List<RctResume> selectRctResumeList(RctResume rctResume);

    /**
     * 新增简历信息
     * 
     * @param rctResume 简历信息
     * @return 结果
     */
    public int insertRctResume(RctResume rctResume);

    /**
     * 修改简历信息
     * 
     * @param rctResume 简历信息
     * @return 结果
     */
    public int updateRctResume(RctResume rctResume);

    /**
     * 批量删除简历信息
     * 
     * @param resumeIds 需要删除的简历信息主键集合
     * @return 结果
     */
    public int deleteRctResumeByResumeIds(Long[] resumeIds);

    /**
     * 删除简历信息信息
     * 
     * @param resumeId 简历信息主键
     * @return 结果
     */
    public int deleteRctResumeByResumeId(Long resumeId);
}
