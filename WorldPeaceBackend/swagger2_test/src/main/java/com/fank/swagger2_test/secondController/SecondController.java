package com.fank.swagger2_test.secondController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(tags = "sec api文档", description = "sec 文档description")
public class SecondController {

    @GetMapping("secHello")
    @ApiOperation("获取sec hello接口")
    public String hello() {
        return "secondHello";
    }

    @GetMapping("secSay")
    @ApiOperation("获取sec say接口")
    public String say() {
        return "secSay something";
    }
}
