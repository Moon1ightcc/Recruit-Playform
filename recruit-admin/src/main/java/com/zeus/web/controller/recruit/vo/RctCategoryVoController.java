package com.zeus.web.controller.recruit.vo;

import com.zeus.common.core.domain.AjaxResult;
import com.zeus.recruit.domain.RctCategory;
import com.zeus.recruit.service.IRctCategoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "展示分类")
@RestController
@RequestMapping("/category/vo")
public class RctCategoryVoController {

    @Autowired
    private IRctCategoryService rctCategoryService;

    /**
     * 查询大分类和分类下面的岗位
     */
    @ApiOperation(value = "查询所有分类以及分类下面的岗位")
    @GetMapping("/queryAllCategory")
    public AjaxResult listBigCategory(){

        List<RctCategory> categoryList = rctCategoryService.selectAllCategory();

        return AjaxResult.success("查询分类成功",categoryList);
    }
}
