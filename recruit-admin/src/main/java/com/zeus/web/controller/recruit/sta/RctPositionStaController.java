package com.zeus.web.controller.recruit.sta;


import com.zeus.common.core.domain.AjaxResult;
import com.zeus.recruit.service.IRctCompanyService;
import com.zeus.recruit.service.IRctPositionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/position/sta")
@Api("公司信息")
public class RctPositionStaController {

    @Autowired
    private IRctPositionService rctPositionService;

    /**
     * echarts扎实企业地址分布
     */
    @ApiOperation("发布岗位种类统计")
    @GetMapping("/positionCount")
    public AjaxResult positionCount(){
        List<Map<Object, Object>> list =  rctPositionService.positionCountList();

        return AjaxResult.success(list);
    }
}