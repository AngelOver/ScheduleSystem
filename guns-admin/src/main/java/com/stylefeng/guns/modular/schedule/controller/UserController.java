package com.stylefeng.guns.modular.schedule.controller;

import javax.swing.text.html.parser.Entity;

import com.stylefeng.guns.core.base.controller.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stylefeng.guns.core.common.constant.factory.PageFactory;
import com.stylefeng.guns.core.page.PageInfoBT;
import com.stylefeng.guns.core.util.ToolUtil;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import org.springframework.beans.factory.annotation.Autowired;

import com.stylefeng.guns.core.log.LogObjectHolder;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.User;
import com.stylefeng.guns.modular.system.service.IUserService;

/**
 * 普通用户控制器
 *
 * @author fengshuonan
 * @Date 2018-04-25 19:40:23
 */
@Controller
@RequestMapping("/scheduleUser")
public class UserController extends BaseController {

    private String PREFIX = "/schedule/user/";

    @Autowired
    private IUserService userService;

    /**
     * 跳转到普通用户首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "user.html";
    }

    /**
     * 跳转到添加普通用户
     */
    @RequestMapping("/scheduleUser_add")
    public String userAdd() {
        return PREFIX + "user_add.html";
    }

    /**
     * 跳转到修改普通用户
     */
    @RequestMapping("/scheduleUser_update/{userId}")
    public String userUpdate(@PathVariable Integer userId, Model model) {
        User user = userService.selectById(userId);
        model.addAttribute("item",user);
        LogObjectHolder.me().set(user);
        return PREFIX + "user_edit.html";
    }

    /**
     * 获取普通用户列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
    	EntityWrapper<User> entityWrapper =new EntityWrapper<User>();
    	entityWrapper.eq("roleid", "6");
    	if(ToolUtil.isNotEmpty(condition)){
    		entityWrapper=new EntityWrapper<User>();
    		entityWrapper.like("name", condition);
    	}
    	
   		Page<User> page = new PageFactory<User>().defaultPage();
   		page = this.userService.selectPage(page,entityWrapper);
   		PageInfoBT<User> pageInfoBT= this.packForBT(page);
        return pageInfoBT;
    }

    /**
     * 新增普通用户
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(User user) {
        userService.insert(user);
        return SUCCESS_TIP;
    }

    /**
     * 删除普通用户
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer userId) {
        userService.deleteById(userId);
        return SUCCESS_TIP;
    }

    /**
     * 修改普通用户
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(User user) {
        userService.updateById(user);
        return SUCCESS_TIP;
    }

    /**
     * 普通用户详情
     */
    @RequestMapping(value = "/detail/{userId}")
    @ResponseBody
    public Object detail(@PathVariable("userId") Integer userId) {
        return userService.selectById(userId);
    }
}
