package com.fank.swagger2_test.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;

@RestController
@Api(tags = "api文档", description = "文档description")
public class TestController {

    @GetMapping("hello")
    @ApiOperation("获取hello接口")
    public String hello() {
        return "hello";
    }

    @GetMapping("say")
    @ApiOperation("获取say接口")
    public String say() {
        return "say something";
    }

    @PutMapping("query")
    @ApiOperation("获取query接口")
    public String query(@RequestParam String id) {
        return "say something";
    }

    @GetMapping("get/{id}/{name}")
    @ApiOperation("获取say接口")
    public String getById(@PathVariable String id, @ApiParam("名称") @PathVariable String name) {
        return "get by id - " + id + ", name = " + name;
    }
}
