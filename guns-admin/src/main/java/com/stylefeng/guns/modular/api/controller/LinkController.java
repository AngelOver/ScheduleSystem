package com.stylefeng.guns.modular.api.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.schedule.service.INoteService;

/**
 * 用户专属连接管理控制器
 *
 */
@Controller
@RequestMapping("/api/link")
public class LinkController extends BaseController {

    private String PREFIX = "/link/";

    @Autowired	
    private INoteService noteService;


    /**
     * 跳转到修改便签管理
     */
    @RequestMapping("/{usercode}")
    public String userlink(@PathVariable String usercode) {
    	
    	//验证code合法性 ，查询 user
    	
    	//userid 取得当前用户list 数据 直接放 ${} 里面
    	
    	//返回页面
      /*  Note note = noteService.selectById(usercode);*/
      /*  model.addAttribute("item",note);*/
        return PREFIX + "index.html";
    }

}


