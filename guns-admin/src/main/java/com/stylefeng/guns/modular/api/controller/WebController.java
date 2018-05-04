package com.stylefeng.guns.modular.api.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.schedule.service.INoteService;

/**
 * web网站前台连接控制器
 *
 */
@Controller
@RequestMapping("/api/web")
public class WebController extends BaseController {

    private String PREFIX = "/web/";

    @Autowired
    private INoteService noteService;

    /**
     * 跳转带首页
     */
    @RequestMapping("")
    public String index() {
    	
        return PREFIX + "home.html";
    }
    /**
     * 跳转带首页
     */
    @RequestMapping("/home")
    public String home() {
    	
        return PREFIX + "home.html";
    }
    
    /**
     * 跳转带首页
     */
    @RequestMapping("/about")
    public String about() {
    	
        return PREFIX + "about.html";
    }
    
    /**
     * 跳转带首页
     */
    @RequestMapping("/timeline")
    public String timeline() {
    	
        return PREFIX + "timeline.html";
    }

}


