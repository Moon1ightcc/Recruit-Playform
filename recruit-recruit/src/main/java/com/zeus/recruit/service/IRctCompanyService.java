package com.zeus.recruit.service;

import com.zeus.recruit.domain.RctCompany;

import java.util.List;
import java.util.Map;

/**
 * 企业信息Service接口
 * 
 * @author Ayase
 * @date 2022-10-15
 */
public interface IRctCompanyService 
{
    /**
     * 查询企业信息
     * 
     * @param companyId 企业信息主键
     * @return 企业信息
     */
    public RctCompany selectRctCompanyByCompanyId(Long companyId);

    /**
     * 查询企业信息列表
     * 
     * @param rctCompany 企业信息
     * @return 企业信息集合
     */
    public List<RctCompany> selectRctCompanyList(RctCompany rctCompany);

    /**
     * 新增企业信息
     * 
     * @param rctCompany 企业信息
     * @return 结果
     */
    public int insertRctCompany(RctCompany rctCompany);

    /**
     * 修改企业信息
     * 
     * @param rctCompany 企业信息
     * @return 结果
     */
    public int updateRctCompany(RctCompany rctCompany);

    /**
     * 批量删除企业信息
     * 
     * @param companyIds 需要删除的企业信息主键集合
     * @return 结果
     */
    public int deleteRctCompanyByCompanyIds(Long[] companyIds);

    /**
     * 删除企业信息信息
     * 
     * @param companyId 企业信息主键
     * @return 结果
     */
    public int deleteRctCompanyByCompanyId(Long companyId);

    String checkComapnyNameUnique(RctCompany company);

    List<Map<Object, Object>>  companyAddressList();

}
