package com.stylefeng.guns.modular.schedule.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.stylefeng.guns.core.common.constant.factory.PageFactory;
import com.stylefeng.guns.core.page.PageInfoBT;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.Plan;
import com.stylefeng.guns.modular.schedule.service.IPlanService;

/**
 * 计划管理控制器
 *
 * @author fengshuonan
 * @Date 2018-04-24 18:55:41
 */
@Controller
@RequestMapping("/plan")
public class PlanController extends BaseController {

    private String PREFIX = "/schedule/plan/";

    @Autowired
    private IPlanService planService;

    /**
     * 跳转到计划管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "plan.html";
    }

    /**
     * 跳转到添加计划管理
     */
    @RequestMapping("/plan_add")
    public String planAdd() {
        return PREFIX + "plan_add.html";
    }

    /**
     * 跳转到修改计划管理
     */
    @RequestMapping("/plan_update/{planId}")
    public String planUpdate(@PathVariable Integer planId, Model model) {
        Plan plan = planService.selectById(planId);
        model.addAttribute("item",plan);
        LogObjectHolder.me().set(plan);
        return PREFIX + "plan_edit.html";
    }

    /**
     * 获取计划管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
   		Page<Plan> page = new PageFactory<Plan>().defaultPage();
   		page = this.planService.selectPage(page);
   		PageInfoBT<Plan> pageInfoBT= this.packForBT(page);
        return pageInfoBT;
    }

    /**
     * 新增计划管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Plan plan) {
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
