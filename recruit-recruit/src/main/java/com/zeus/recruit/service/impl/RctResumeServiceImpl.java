package com.zeus.recruit.service.impl;

import com.zeus.recruit.domain.RctResume;
import com.zeus.recruit.mapper.RctResumeMapper;
import com.zeus.recruit.service.IRctResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 简历信息Service业务层处理
 * 
 * @author Ayase
 * @date 2022-10-18
 */
@Service
public class RctResumeServiceImpl implements IRctResumeService
{
    @Autowired
    private RctResumeMapper rctResumeMapper;

    /**
     * 查询简历信息
     * 
     * @param resumeId 简历信息主键
     * @return 简历信息
     */
    @Override
    public RctResume selectRctResumeByResumeId(Long resumeId)
    {
        return rctResumeMapper.selectRctResumeByResumeId(resumeId);
    }

    /**
     * 查询简历信息列表
     * 
     * @param rctResume 简历信息
     * @return 简历信息
     */
    @Override
    public List<RctResume> selectRctResumeList(RctResume rctResume)
    {
        return rctResumeMapper.selectRctResumeList(rctResume);
    }

    /**
     * 新增简历信息
     * 
     * @param rctResume 简历信息
     * @return 结果
     */
    @Override
    public int insertRctResume(RctResume rctResume)
    {
        return rctResumeMapper.insertRctResume(rctResume);
    }

    /**
     * 修改简历信息
     * 
     * @param rctResume 简历信息
     * @return 结果
     */
    @Override
    public int updateRctResume(RctResume rctResume)
    {
        return rctResumeMapper.updateRctResume(rctResume);
    }

    /**
     * 批量删除简历信息
     * 
     * @param resumeIds 需要删除的简历信息主键
     * @return 结果
     */
    @Override
    public int deleteRctResumeByResumeIds(Long[] resumeIds)
    {
        return rctResumeMapper.deleteRctResumeByResumeIds(resumeIds);
    }

    /**
     * 删除简历信息信息
     * 
     * @param resumeId 简历信息主键
     * @return 结果
     */
    @Override
    public int deleteRctResumeByResumeId(Long resumeId)
    {
        return rctResumeMapper.deleteRctResumeByResumeId(resumeId);
    }
}
