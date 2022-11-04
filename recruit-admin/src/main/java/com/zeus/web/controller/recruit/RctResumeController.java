package com.zeus.web.controller.recruit;

import com.zeus.common.annotation.Log;
import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.common.enums.BusinessType;
import com.zeus.common.utils.poi.ExcelUtil;
import com.zeus.recruit.domain.RctResume;
import com.zeus.recruit.service.IRctResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 简历信息Controller
 * 
 * @author Ayase
 * @date 2022-10-18
 */
@RestController
@RequestMapping("/recruit/resume")
public class RctResumeController extends BaseController
{
    @Autowired
    private IRctResumeService rctResumeService;

    /**
     * 查询简历信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:list')")
    @GetMapping("/list")
    public TableDataInfo list(RctResume rctResume)
    {
        startPage();
        List<RctResume> list = rctResumeService.selectRctResumeList(rctResume);
        return getDataTable(list);
    }

    /**
     * 公司查询简历信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:listResume')")
    @GetMapping("/company")
    public TableDataInfo listResume(RctResume rctResume)
    {
        startPage();
        List<RctResume> list = rctResumeService.selectRctResumeList(rctResume);
        return getDataTable(list);
    }



    /**
     * 导出简历信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:export')")
    @Log(title = "简历信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RctResume rctResume)
    {
        List<RctResume> list = rctResumeService.selectRctResumeList(rctResume);
        ExcelUtil<RctResume> util = new ExcelUtil<RctResume>(RctResume.class);
        util.exportExcel(response, list, "简历信息数据");
    }

    /**
     * 获取简历信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:query')")
    @GetMapping(value = "/{resumeId}")
    public AjaxResult getInfo(@PathVariable("resumeId") Long resumeId)
    {
        return AjaxResult.success(rctResumeService.selectRctResumeByResumeId(resumeId));
    }

    /**
     * 新增简历信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:add')")
    @Log(title = "简历信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RctResume rctResume)
    {
        return toAjax(rctResumeService.insertRctResume(rctResume));
    }

    /**
     * 修改简历信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:edit')")
    @Log(title = "简历信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RctResume rctResume)
    {
        return toAjax(rctResumeService.updateRctResume(rctResume));
    }

    /**
     * 删除简历信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:resume:remove')")
    @Log(title = "简历信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{resumeIds}")
    public AjaxResult remove(@PathVariable Long[] resumeIds)
    {
        return toAjax(rctResumeService.deleteRctResumeByResumeIds(resumeIds));
    }
}
