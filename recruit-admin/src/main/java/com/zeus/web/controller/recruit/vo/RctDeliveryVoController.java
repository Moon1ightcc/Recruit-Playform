package com.zeus.web.controller.recruit.vo;

import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.recruit.domain.RctDelivery;
import com.zeus.recruit.service.IRctDeliveryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "发送简历")
@RestController
@RequestMapping("/delivery/vo")
public class RctDeliveryVoController extends BaseController {

    @Autowired
    private IRctDeliveryService rctDeliveryService;

    /**
     * 新增简历投递信息
     */
    @PostMapping("/addDelivery")
    public AjaxResult addDelivery(@RequestBody RctDelivery rctDelivery)
    {
        return toAjax(rctDeliveryService.insertRctDelivery(rctDelivery));
    }

    /**
     * 查询简历投递信息列表
     */
    @PostMapping("/listByParams")
    public AjaxResult listDeliveryByParams(@RequestBody RctDelivery rctDelivery)
    {
        List<RctDelivery> list = rctDeliveryService.selectRctDeliveryList(rctDelivery);
        return AjaxResult.success(list);
    }

    /**
     * 查询简历投递信息列表
     */
    @PostMapping("/listByNickName")
    public TableDataInfo listDeliveryNickName(@RequestBody RctDelivery rctDelivery){
        startPage();
        List<RctDelivery> list = rctDeliveryService.selectDeliveryListByNickName(rctDelivery);
        return getDataTable(list);
    }

}
