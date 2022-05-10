package com.fank.hotreload.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HotReloadController {

    @GetMapping("hot")
    public String hotReload() {
        return "hotReload";
    }
}
