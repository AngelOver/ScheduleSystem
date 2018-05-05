package com.stylefeng.guns.modular.api.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.stylefeng.guns.modular.system.model.User;
import com.stylefeng.guns.modular.system.service.IUserService;
import com.stylefeng.guns.modular.system.warpper.ApiPlanWarpper;
import com.stylefeng.guns.modular.system.warpper.UserWarpper;
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
    @Autowired
    private IUserService userService;

    

    /**
     * 获取计划管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String start,String end,String linkcode) {
    	
    	User user = checkCode(linkcode);
    	if(user==null){
    		return ApiTip.LinkError();
    	}
    	Integer userid = user.getId();
    	Map<String ,Object> param = new HashMap<String, Object>();
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String starttime = simpleDateFormat.format(new Date(new Long(start)))+" 00:00:00";
    	String endtime = simpleDateFormat.format(new Date(new Long(end)))+" 00:00:00";
    	param.put("start", starttime);
    	param.put("end", endtime);
    	param.put("userid", userid);
    	List<Map<String, Object>> list = planService.selectListByMap(param);
    	Object warp = new ApiPlanWarpper(list).warp();
        return JSONObject.toJSON(ApiTip.ok(warp));
    }
    
    public User checkCode(String linkcode){
    	return  userService.getUserByLinkCode(linkcode);
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
