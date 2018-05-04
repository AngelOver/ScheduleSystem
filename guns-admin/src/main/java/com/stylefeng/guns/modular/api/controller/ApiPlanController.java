package com.stylefeng.guns.modular.api.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.stylefeng.guns.core.base.controller.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stylefeng.guns.core.common.constant.factory.PageFactory;
import com.stylefeng.guns.core.page.PageInfoBT;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.plugins.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.stylefeng.guns.core.log.LogObjectHolder;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.Plan;
import com.stylefeng.guns.modular.schedule.service.IPlanService;

/**
 * 计划管理控制器
 *
 * @author fengshuonan
 * @Date 2018-04-28 17:41:28
 */
@Controller
@RequestMapping("/api/plan")
public class ApiPlanController extends BaseController {

    private String PREFIX = "/schedule/plan/";

    @Autowired
    private IPlanService planService;



    /**
     * 获取计划管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
   		Page<Plan> page = new PageFactory<Plan>().defaultPage();
   		List<Plan> selectList = this.planService.selectList(null);
   		page = this.planService.selectPage(page);
   		PageInfoBT<Plan> pageInfoBT= this.packForBT(page);
        return JSONObject.toJSON(pageInfoBT);
    }

    /**
     * 新增计划管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Plan plan) {
    	plan.create();
        planService.insert(plan);
        return SUCCESS_TIP;
    }

    /**
     * 删除计划管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer planId) {
        planService.deleteById(planId);
        return SUCCESS_TIP;
    }

    /**
     * 修改计划管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Plan plan) {
    	plan.update();
        planService.updateById(plan);
        return SUCCESS_TIP;
    }

    /**
     * 计划管理详情
     */
    @RequestMapping(value = "/detail/{planId}")
    @ResponseBody
    public Object detail(@PathVariable("planId") Integer planId) {
        return planService.selectById(planId);
    }
}
