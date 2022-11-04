package com.zeus.web.controller.recruit;

import com.zeus.common.annotation.Log;
import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.common.enums.BusinessType;
import com.zeus.common.utils.poi.ExcelUtil;
import com.zeus.recruit.domain.RctPosition;
import com.zeus.recruit.service.IRctPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 招聘岗位Controller
 * 
 * @author Ayase
 * @date 2022-10-16
 */
@RestController
@RequestMapping("/recruit/position")
public class RctPositionController extends BaseController
{
    @Autowired
    private IRctPositionService rctPositionService;

    /**
     * 查询招聘岗位列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:list')")
    @GetMapping("/list")
    public TableDataInfo list(RctPosition rctPosition)
    {
        startPage();
        List<RctPosition> list = rctPositionService.selectRctPositionList(rctPosition);
        return getDataTable(list);
    }



    /**
     * 导出招聘岗位列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:export')")
    @Log(title = "招聘岗位", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RctPosition rctPosition)
    {
        List<RctPosition> list = rctPositionService.selectRctPositionList(rctPosition);
        ExcelUtil<RctPosition> util = new ExcelUtil<RctPosition>(RctPosition.class);
        util.exportExcel(response, list, "招聘岗位数据");
    }

    /**
     * 获取招聘岗位详细信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:query')")
    @GetMapping(value = "/{recruitId}")
    public AjaxResult getInfo(@PathVariable("recruitId") Long recruitId)
    {
        return AjaxResult.success(rctPositionService.selectRctPositionByRecruitId(recruitId));
    }

    /**
     * 新增招聘岗位
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:add')")
    @Log(title = "招聘岗位", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RctPosition rctPosition)
    {
        return toAjax(rctPositionService.insertRctPosition(rctPosition));
    }

    /**
     * 修改招聘岗位
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:edit')")
    @Log(title = "招聘岗位", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RctPosition rctPosition)
    {
        return toAjax(rctPositionService.updateRctPosition(rctPosition));
    }

    /**
     * 删除招聘岗位
     */
    @PreAuthorize("@ss.hasPermi('recruit:position:remove')")
    @Log(title = "招聘岗位", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recruitIds}")
    public AjaxResult remove(@PathVariable Long[] recruitIds)
    {
        return toAjax(rctPositionService.deleteRctPositionByRecruitIds(recruitIds));
    }
}
