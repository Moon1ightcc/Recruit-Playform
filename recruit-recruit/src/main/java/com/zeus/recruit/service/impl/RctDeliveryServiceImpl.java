package com.zeus.recruit.service.impl;

import com.zeus.common.utils.DateUtils;
import com.zeus.recruit.domain.RctDelivery;
import com.zeus.recruit.mapper.RctDeliveryMapper;
import com.zeus.recruit.service.IRctDeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 简历投递信息Service业务层处理
 *
 * @author Ayase
 * @date 2022-10-17
 */
@Service
public class RctDeliveryServiceImpl implements IRctDeliveryService
{
    @Autowired
    private RctDeliveryMapper rctDeliveryMapper;

    /**
     * 查询简历投递信息
     *
     * @param deliveryId 简历投递信息主键
     * @return 简历投递信息
     */
    @Override
    public RctDelivery selectRctDeliveryByDeliveryId(Long deliveryId)
    {
        return rctDeliveryMapper.selectRctDeliveryByDeliveryId(deliveryId);
    }

    /**
     * 查询简历投递信息列表
     *
     * @param rctDelivery 简历投递信息
     * @return 简历投递信息
     */
    @Override
    public List<RctDelivery> selectRctDeliveryList(RctDelivery rctDelivery)
    {
        return rctDeliveryMapper.selectRctDeliveryList(rctDelivery);
    }

    /**
     * 新增简历投递信息
     *
     * @param rctDelivery 简历投递信息
     * @return 结果
     */
    @Override
    public int insertRctDelivery(RctDelivery rctDelivery)
    {
        rctDelivery.setCreateTime(DateUtils.getNowDate());
        return rctDeliveryMapper.insertRctDelivery(rctDelivery);
    }

    /**
     * 修改简历投递信息
     *
     * @param rctDelivery 简历投递信息
     * @return 结果
     */
    @Override
    public int updateRctDelivery(RctDelivery rctDelivery)
    {
        rctDelivery.setUpdateTime(DateUtils.getNowDate());
        return rctDeliveryMapper.updateRctDelivery(rctDelivery);
    }

    /**
     * 批量删除简历投递信息
     *
     * @param deliveryIds 需要删除的简历投递信息主键
     * @return 结果
     */
    @Override
    public int deleteRctDeliveryByDeliveryIds(Long[] deliveryIds)
    {
        return rctDeliveryMapper.deleteRctDeliveryByDeliveryIds(deliveryIds);
    }

    /**
     * 删除简历投递信息信息
     *
     * @param deliveryId 简历投递信息主键
     * @return 结果
     */
    @Override
    public int deleteRctDeliveryByDeliveryId(Long deliveryId)
    {
        return rctDeliveryMapper.deleteRctDeliveryByDeliveryId(deliveryId);
    }


    /**
     * 求职用户查询简历投递信息列表
     *
     * @param rctDelivery 简历投递信息
     * @return 简历投递信息
     */
    @Override
    public List<RctDelivery> selectDeliveryListByNickName(RctDelivery rctDelivery) {
        return rctDeliveryMapper.selectDeliveryListByNickName(rctDelivery);
    }
}
