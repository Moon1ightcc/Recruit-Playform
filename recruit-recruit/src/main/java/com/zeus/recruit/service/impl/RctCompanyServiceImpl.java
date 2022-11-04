package com.zeus.recruit.service.impl;

import com.zeus.common.constant.UserConstants;
import com.zeus.common.utils.DateUtils;
import com.zeus.common.utils.StringUtils;
import com.zeus.recruit.domain.RctCompany;
import com.zeus.recruit.mapper.RctCompanyMapper;
import com.zeus.recruit.service.IRctCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 企业信息Service业务层处理
 * 
 * @author Ayase
 * @date 2022-10-15
 */
@Service
public class RctCompanyServiceImpl implements IRctCompanyService
{
    @Autowired
    private RctCompanyMapper rctCompanyMapper;

    /**
     * 查询企业信息
     * 
     * @param companyId 企业信息主键
     * @return 企业信息
     */
    @Override
    public RctCompany selectRctCompanyByCompanyId(Long companyId)
    {
        return rctCompanyMapper.selectRctCompanyByCompanyId(companyId);
    }



    /**
     * 查询企业信息列表
     * 
     * @param rctCompany 企业信息
     * @return 企业信息
     */
    @Override
    public List<RctCompany> selectRctCompanyList(RctCompany rctCompany)
    {
        return rctCompanyMapper.selectRctCompanyList(rctCompany);
    }

    /**
     * 新增企业信息
     * 
     * @param rctCompany 企业信息
     * @return 结果
     */
    @Override
    public int insertRctCompany(RctCompany rctCompany)
    {
        rctCompany.setCreateTime(DateUtils.getNowDate());
        return rctCompanyMapper.insertRctCompany(rctCompany);
    }

    /**
     * 修改企业信息
     * 
     * @param rctCompany 企业信息
     * @return 结果
     */
    @Override
    public int updateRctCompany(RctCompany rctCompany)
    {
        rctCompany.setUpdateTime(DateUtils.getNowDate());
        return rctCompanyMapper.updateRctCompany(rctCompany);
    }

    /**
     * 批量删除企业信息
     * 
     * @param companyIds 需要删除的企业信息主键
     * @return 结果
     */
    @Override
    public int deleteRctCompanyByCompanyIds(Long[] companyIds)
    {
        return rctCompanyMapper.deleteRctCompanyByCompanyIds(companyIds);
    }

    /**
     * 删除企业信息信息
     * 
     * @param companyId 企业信息主键
     * @return 结果
     */
    @Override
    public int deleteRctCompanyByCompanyId(Long companyId)
    {
        return rctCompanyMapper.deleteRctCompanyByCompanyId(companyId);
    }

    @Override
    public String checkComapnyNameUnique(RctCompany company) {
        Long companyId = StringUtils.isNull(company.getCompanyId()) ? -1L : company.getCompanyId();
        RctCompany info = rctCompanyMapper.checkCompanyNameUnique(company.getCompanyName());
        if (StringUtils.isNotNull(info) && info.getCompanyId().longValue() != companyId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;

    }

    @Override
    public List<Map<Object, Object>> companyAddressList() {
         List<Map<Object, Object>> data = rctCompanyMapper.companyAddressList();
         return  data;
    }
}
