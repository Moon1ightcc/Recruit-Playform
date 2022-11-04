package com.zeus.web.controller.recruit;

import com.zeus.common.annotation.Log;
import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.common.enums.BusinessType;
import com.zeus.common.utils.poi.ExcelUtil;
import com.zeus.recruit.domain.RctCompany;
import com.zeus.recruit.service.IRctCompanyService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 企业信息Controller
 * 
 * @author Ayase
 * @date 2022-10-15
 */
@RestController
@RequestMapping("/recruit/company")
public class RctCompanyController extends BaseController
{
    @Autowired
    private IRctCompanyService rctCompanyService;

    /**
     * 查询企业信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:list')")
    @GetMapping("/list")
    public TableDataInfo list(RctCompany rctCompany)
    {
        startPage();
        List<RctCompany> list = rctCompanyService.selectRctCompanyList(rctCompany);
        return getDataTable(list);
    }

    /**
     * 导出企业信息列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:export')")
    @Log(title = "企业信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RctCompany rctCompany)
    {
        List<RctCompany> list = rctCompanyService.selectRctCompanyList(rctCompany);
        ExcelUtil<RctCompany> util = new ExcelUtil<RctCompany>(RctCompany.class);
        util.exportExcel(response, list, "企业信息数据");
    }

    /**
     * 获取企业信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:query')")
    @GetMapping(value = "/{companyId}")
    public AjaxResult getInfo(@PathVariable("companyId") Long companyId)
    {
        return AjaxResult.success(rctCompanyService.selectRctCompanyByCompanyId(companyId));
    }

    /**
     * 新增企业信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:add')")
    @Log(title = "企业信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RctCompany rctCompany)
    {
        return toAjax(rctCompanyService.insertRctCompany(rctCompany));
    }

    /**
     * 修改企业信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:edit')")
    @Log(title = "企业信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RctCompany rctCompany)
    {
        return toAjax(rctCompanyService.updateRctCompany(rctCompany));
    }

    /**
     * 删除企业信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:company:remove')")
    @Log(title = "企业信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{companyIds}")
    public AjaxResult remove(@PathVariable Long[] companyIds)
    {
        return toAjax(rctCompanyService.deleteRctCompanyByCompanyIds(companyIds));
    }
}
