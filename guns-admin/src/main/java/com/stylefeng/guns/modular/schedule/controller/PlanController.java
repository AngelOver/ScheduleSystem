package com.stylefeng.guns.modular.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.stylefeng.guns.core.base.controller.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stylefeng.guns.core.common.constant.factory.PageFactory;
import com.stylefeng.guns.core.page.PageInfoBT;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.util.ToolUtil;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.stylefeng.guns.core.log.LogObjectHolder;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.Note;
import com.stylefeng.guns.modular.system.model.Plan;
import com.stylefeng.guns.modular.system.warpper.NoteWrapper;
import com.stylefeng.guns.modular.schedule.service.IPlanService;

/**
 * 计划管理控制器
 *
 * @author fengshuonan
 * @Date 2018-04-28 17:41:28
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

	@InitBinder
	protected void init(HttpServletRequest request,
			ServletRequestDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
    
	
    /**
     * 跳转到写便签界面
     */
    @RequestMapping("/plan_info")
    public String plan_info() {
        return PREFIX + "plan_info.html";
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
   		
	   	 Integer deptId = ShiroKit.getUser().getDeptId();
	  	 Integer id = ShiroKit.getUser().getId();
	  	EntityWrapper<Plan> entityWrapper =new EntityWrapper<Plan>();
	  	if(deptId==29){
  	   		entityWrapper.eq("userid", id);
  	   	 }
		/*if(ToolUtil.isNotEmpty(condition)){
	   		entityWrapper.like("text", condition);
	   	}*/
   		page = this.planService.selectPage(page,entityWrapper);
   		PageInfoBT<Plan> pageInfoBT= this.packForBT(page);
        return pageInfoBT;
    }
    
    
    

    /**
     * 新增计划管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Plan plan) {
    	plan.create();
    	
    	 Integer isWholeday = plan.getIsWholeday();
    	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	 String range = plan.getRange();
    	 String thedate = plan.getThedate().replace("年", "-").replace("月", "-").replace("日", "");
    	 String start =  thedate +" 00:00:00";
    	 String end =  thedate +" 23:59:59";
    	 if(isWholeday == 0){ //是否全天
    		if(ToolUtil.isNotEmpty(range)){
    			String[] split = range.split(" - ");
    			start = thedate + " "+split[0]+":00";
    			end = thedate + " "+split[1]+":00";
    		}
    	 }
    	try {
    		 plan.setStarttime(simpleDateFormat.parse(start));
			 plan.setEndtime(simpleDateFormat.parse(end));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
    	
    	Integer isWholeday = plan.getIsWholeday();
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String range = plan.getRange();
	  	 String thedate = plan.getThedate().replace("年", "-").replace("月", "-").replace("日", "");
	  	 String start =  thedate +" 00:00:00";
	  	 String end =  thedate +" 23:59:59";
	  	 if(isWholeday == 0){ //是否全天
	  		if(ToolUtil.isNotEmpty(range)){
	  			String[] split = range.split(" - ");
	  			start = thedate + " "+split[0]+":00";
	  			end = thedate + " "+split[1]+":00";
	  		}
	  	 }else{
	  		 //是全天清空数据
	  		plan.setRange("");
	  	 }
	  	try {
	  		 plan.setStarttime(simpleDateFormat.parse(start));
				 plan.setEndtime(simpleDateFormat.parse(end));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
    	
    	
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
