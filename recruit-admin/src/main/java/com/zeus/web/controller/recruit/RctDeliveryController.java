package com.zeus.web.controller.recruit;

import com.zeus.common.annotation.Log;
import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.common.enums.BusinessType;
import com.zeus.common.utils.poi.ExcelUtil;
import com.zeus.recruit.domain.RctDelivery;
import com.zeus.recruit.service.IRctDeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 简历投递信息Controller
 *
 * @author Ayase
 * @date 2022-10-17
 */
@RestController
@RequestMapping("/recruit/delivery")
public class RctDeliveryController extends BaseController
{
    @Autowired
    private IRctDeliveryService rctDeliveryService;

    /**
     * 查询简历投递信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:list')")
    @GetMapping("/list")
    public TableDataInfo list(RctDelivery rctDelivery)
    {
        startPage();
        List<RctDelivery> list = rctDeliveryService.selectRctDeliveryList(rctDelivery);
        return getDataTable(list);
    }

    /**
     * 导出简历投递信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:export')")
    @Log(title = "简历投递信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RctDelivery rctDelivery)
    {
        List<RctDelivery> list = rctDeliveryService.selectRctDeliveryList(rctDelivery);
        ExcelUtil<RctDelivery> util = new ExcelUtil<RctDelivery>(RctDelivery.class);
        util.exportExcel(response, list, "简历投递信息数据");
    }

    /**
     * 获取简历投递信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:query')")
    @GetMapping(value = "/{deliveryId}")
    public AjaxResult getInfo(@PathVariable("deliveryId") Long deliveryId)
    {
        return AjaxResult.success(rctDeliveryService.selectRctDeliveryByDeliveryId(deliveryId));
    }

    /**
     * 新增简历投递信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:add')")
    @Log(title = "简历投递信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RctDelivery rctDelivery)
    {
        return toAjax(rctDeliveryService.insertRctDelivery(rctDelivery));
    }

    /**
     * 修改简历投递信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:edit')")
    @Log(title = "简历投递信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RctDelivery rctDelivery)
    {
        return toAjax(rctDeliveryService.updateRctDelivery(rctDelivery));
    }

    /**
     * 删除简历投递信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:delivery:remove')")
    @Log(title = "简历投递信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deliveryIds}")
    public AjaxResult remove(@PathVariable Long[] deliveryIds)
    {
        return toAjax(rctDeliveryService.deleteRctDeliveryByDeliveryIds(deliveryIds));
    }
}
