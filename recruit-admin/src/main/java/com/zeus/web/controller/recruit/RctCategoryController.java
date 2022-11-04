package com.zeus.web.controller.recruit;

import com.zeus.common.annotation.Log;
import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.common.enums.BusinessType;
import com.zeus.common.utils.poi.ExcelUtil;
import com.zeus.recruit.domain.RctCategory;
import com.zeus.recruit.service.IRctCategoryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 招聘分类Controller
 *
 * @author Ayase
 * @date 2022-10-15
 */
@Api(tags = "展示分类")
@RestController
@RequestMapping("/recruit/category")
public class RctCategoryController extends BaseController
{
    @Autowired
    private IRctCategoryService rctCategoryService;

    /**
     * 查询大分类和分类下面的岗位
     */
//    @ApiOperation(value = "查询所有分类以及分类下面的岗位")
//    @GetMapping("/queryAllCategory")
//    public AjaxResult listBigCategory(){
//
//        List<RctCategory> categoryList = rctCategoryService.selectAllCategory();
//
//        return AjaxResult.success("查询分类成功",categoryList);
//    }

    /**
     * 查询招聘分类列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(RctCategory rctCategory)
    {
        startPage();
        List<RctCategory> list = rctCategoryService.selectRctCategoryList(rctCategory);
        return getDataTable(list);
    }

    /**
     * 查询招聘分类列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:listNotParent')")
    @GetMapping("/listNotParent")
    public TableDataInfo listNotParent()
    {
        startPage();
        List<RctCategory> list = rctCategoryService.selectRctCategoryNotParent();
        return getDataTable(list);
    }

    /**
     * 导出招聘分类列表
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:export')")
    @Log(title = "招聘分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RctCategory rctCategory)
    {
        List<RctCategory> list = rctCategoryService.selectRctCategoryList(rctCategory);
        ExcelUtil<RctCategory> util = new ExcelUtil<RctCategory>(RctCategory.class);
        util.exportExcel(response, list, "招聘分类数据");
    }

    /**
     * 获取招聘分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:query')")
    @GetMapping(value = "/{positionId}")
    public AjaxResult getInfo(@PathVariable("positionId") Long positionId)
    {
        return AjaxResult.success(rctCategoryService.selectRctCategoryByPositionId(positionId));
    }

    /**
     * 新增招聘分类
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:add')")
    @Log(title = "招聘分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RctCategory rctCategory)
    {
        return toAjax(rctCategoryService.insertRctCategory(rctCategory));
    }

    /**
     * 修改招聘分类
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:edit')")
    @Log(title = "招聘分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RctCategory rctCategory)
    {
        return toAjax(rctCategoryService.updateRctCategory(rctCategory));
    }

    /**
     * 删除招聘分类
     */
    @PreAuthorize("@ss.hasPermi('recruit:category:remove')")
    @Log(title = "招聘分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{positionIds}")
    public AjaxResult remove(@PathVariable Long[] positionIds)
    {
        return toAjax(rctCategoryService.deleteRctCategoryByPositionIds(positionIds));
    }
}
