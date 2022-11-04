package com.zeus.recruit.service;

import com.zeus.recruit.domain.RctDelivery;

import java.util.List;

/**
 * 简历投递信息Service接口
 *
 * @author Ayase
 * @date 2022-10-17
 */
public interface IRctDeliveryService
{
    /**
     * 查询简历投递信息
     *
     * @param deliveryId 简历投递信息主键
     * @return 简历投递信息
     */
    public RctDelivery selectRctDeliveryByDeliveryId(Long deliveryId);

    /**
     * 查询简历投递信息列表
     *
     * @param rctDelivery 简历投递信息
     * @return 简历投递信息集合
     */
    public List<RctDelivery> selectRctDeliveryList(RctDelivery rctDelivery);

    /**
     * 新增简历投递信息
     *
     * @param rctDelivery 简历投递信息
     * @return 结果
     */
    public int insertRctDelivery(RctDelivery rctDelivery);

    /**
     * 修改简历投递信息
     *
     * @param rctDelivery 简历投递信息
     * @return 结果
     */
    public int updateRctDelivery(RctDelivery rctDelivery);

    /**
     * 批量删除简历投递信息
     *
     * @param deliveryIds 需要删除的简历投递信息主键集合
     * @return 结果
     */
    public int deleteRctDeliveryByDeliveryIds(Long[] deliveryIds);

    /**
     * 删除简历投递信息信息
     *
     * @param deliveryId 简历投递信息主键
     * @return 结果
     */
    public int deleteRctDeliveryByDeliveryId(Long deliveryId);

    /**
     * 查询求职用户已投递简历信息列表
     *
     * @param rctDelivery 简历投递信息
     * @return 简历投递信息集合
     */
    List<RctDelivery> selectDeliveryListByNickName(RctDelivery rctDelivery);
}
