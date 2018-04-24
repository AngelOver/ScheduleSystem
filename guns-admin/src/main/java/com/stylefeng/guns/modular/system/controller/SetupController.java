package com.stylefeng.guns.modular.system.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.common.constant.factory.PageFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;

import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.page.PageInfoBT;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.Setup;
import com.stylefeng.guns.modular.system.service.ISetupService;

/**
 * 组织机构控制器
 *
 * @author fengshuonan
 * @Date 2018-04-24 18:19:26
 */
@Controller
@RequestMapping("/setup")
public class SetupController extends BaseController {

    private String PREFIX = "/system/setup/";

    @Autowired
    private ISetupService setupService;

    /**
     * 跳转到组织机构首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "setup.html";
    }

    /**
     * 跳转到添加组织机构
     */
    @RequestMapping("/setup_add")
    public String setupAdd() {
        return PREFIX + "setup_add.html";
    }

    /**
     * 跳转到修改组织机构
     */
    @RequestMapping("/setup_update/{setupId}")
    public String setupUpdate(@PathVariable Integer setupId, Model model) {
        Setup setup = setupService.selectById(setupId);
        model.addAttribute("item",setup);
        LogObjectHolder.me().set(setup);
        return PREFIX + "setup_edit.html";
    }

    /**
     * 获取组织机构列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
   		Page<Setup> page = new PageFactory<Setup>().defaultPage();
   		page = setupService.selectPage(page);
   		PageInfoBT<Setup> pageInfoBT= this.packForBT(page);
        return pageInfoBT;
    }

    /**
     * 新增组织机构
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Setup setup) {
        setupService.insert(setup);
        return SUCCESS_TIP;
    }

    /**
     * 删除组织机构
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer setupId) {
        setupService.deleteById(setupId);
        return SUCCESS_TIP;
    }

    /**
     * 修改组织机构
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Setup setup) {
        setupService.updateById(setup);
        return SUCCESS_TIP;
    }

    /**
     * 组织机构详情
     */
    @RequestMapping(value = "/detail/{setupId}")
    @ResponseBody
    public Object detail(@PathVariable("setupId") Integer setupId) {
        return setupService.selectById(setupId);
    }
}
