package com.zeus.web.controller.recruit.vo;

import com.zeus.common.core.controller.BaseController;
import com.zeus.common.core.domain.AjaxResult;
import com.zeus.common.core.page.TableDataInfo;
import com.zeus.recruit.domain.RctPosition;
import com.zeus.recruit.service.IRctPositionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "前端展示热门发布岗位")
@RestController
@RequestMapping("/position/vo")
public class RctPositionVoController extends BaseController {

    @Autowired
    private IRctPositionService rctPositionService;

    /**
     * 查询热门招聘岗位列表
     */
    @GetMapping("/listHotPosition")
    @ApiOperation(value = "前端查询所有分类")
    public AjaxResult listHotPosition()
    {
        List<RctPosition> list = rctPositionService.selectHotPositionList();
        return AjaxResult.success("成功查询热门招聘岗位",list);
    }

    /**
     * 根据岗位名称分页查询招聘岗位列表
     */
    @GetMapping("/listByPositionName")
    @ApiOperation(value = "按岗位名称前端分页查询招聘岗位列表")
    public TableDataInfo listByPositionName(RctPosition rctPosition)
    {
        startPage();
        List<RctPosition> list = rctPositionService.listByPositionName(rctPosition);
        return getDataTable(list);
    }

    /**
     * 根据公司名称查询招聘岗位列表
     */
    @GetMapping("/listByCompanyName")
    @ApiOperation(value = "按公司名称分页查询招聘岗位列表")
    public TableDataInfo listByCompanyName(RctPosition rctPosition)
    {
        startPage();
        List<RctPosition> list = rctPositionService.listByCompanyName(rctPosition);
        return getDataTable(list);
    }


    /**
     * 获取招聘岗位详细信息
     */
    @GetMapping(value = "/{recruitId}")
    @ApiOperation(value = "前端获取招聘岗位详细信息")
    public AjaxResult getPositionInfoVo(@PathVariable("recruitId") Long recruitId)
    {
        return AjaxResult.success(rctPositionService.selectPositionInfoVoByRecruitId(recruitId));
    }

}
