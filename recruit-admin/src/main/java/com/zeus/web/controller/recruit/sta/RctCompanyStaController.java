package com.zeus.web.controller.recruit.sta;

import com.zeus.common.core.domain.AjaxResult;
import com.zeus.recruit.service.IRctCompanyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/company/sta")
@Api("公司信息")
public class RctCompanyStaController {

    @Autowired
    private IRctCompanyService rctCompanyService;

    /**
     * echarts扎实企业地址分布
     */
    @ApiOperation("公司选址分布")
    @GetMapping("/companyAddress")
    public AjaxResult companyAddress(){
        List<Map<Object, Object>> list =  rctCompanyService.companyAddressList();

        return AjaxResult.success(list);
    }
}
