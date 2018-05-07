package com.stylefeng.guns.modular.api.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.util.ToolUtil;

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
    
    
    /**
     * 获取计划管理列表
     */
    @RequestMapping(value = "/remindlist")
    @ResponseBody
    public Object reindlist(String linkcode) {
    	
    	User user = checkCode(linkcode);
    	if(user==null){
    		return ApiTip.LinkError();
    	}
    	Integer userid = user.getId();
    	Map<String ,Object> param = new HashMap<String, Object>();
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String starttime = simpleDateFormat.format(new Date())+" 00:00:00";
    	String endtime = simpleDateFormat.format(new Date())+" 23:59:59";
    	param.put("remind_start", starttime);
    	param.put("remind_end", endtime);
    	param.put("userid", userid);
    	param.put("is_remind", 1);
    	List<Map<String, Object>> list = planService.selectListByMap(param);
    	Object warp = new ApiPlanWarpper(list).warp();
        return JSONObject.toJSON(ApiTip.ok(warp));
    }
    
    public String getTimeLength(String thedate){
    	String result ="";
    	String[] split = thedate.split(" - ");
    	String  start = split[0];
    	String end = split[1];
    	int hour= Integer.parseInt(end.split(":")[0])-Integer.parseInt(start.split(":")[0]);
    	int min = Integer.parseInt(end.split(":")[1])-Integer.parseInt(start.split(":")[1]);
    	int sun = hour*60+min;
    	if(sun/60!=0){
    		result+=sun/60+"小时";
    	}
    	if(sun%60!=0){
    		result+=sun%60+"分钟";
    	}
    	return  result;
    }
    
    
    public String getNextTheDay(String thedate,int n){
    	String result ="";
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
    	Date date = new Date();
    	try {
    		date = simpleDateFormat.parse(thedate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	Calendar  c = Calendar.getInstance();  
    	c.setTime(date);
    	c.add(Calendar.DAY_OF_MONTH, n);
    	 result = simpleDateFormat.format(c.getTime());
    	return  result;
    }
    public String getNextRemindTime(String remindtime,int n){
    	String result ="";
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date date = new Date();
    	try {
    		date = simpleDateFormat.parse(remindtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	Calendar  c = Calendar.getInstance();  
    	c.setTime(date);
    	 c.add(Calendar.DAY_OF_MONTH, n);
    	 result = simpleDateFormat.format(c.getTime());
    	return  result;
    }
    
    
    /**
     * 后台获取提醒列表
     */
    @RequestMapping(value = "/admin_remindlist")
    @ResponseBody
    public Object admin_remindlist() {
    	Integer userid =  ShiroKit.getUser().getId();
    	Map<String ,Object> param = new HashMap<String, Object>();
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String starttime = simpleDateFormat.format(new Date())+" 00:00:00";
    	String endtime = simpleDateFormat.format(new Date())+" 23:59:59";
    	param.put("remind_start", starttime);
    	param.put("remind_end", endtime);
    	param.put("userid", userid);
    	param.put("is_remind", 1);
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
    public Object add(Plan plan,String linkcode) {
    	
    	User user = checkCode(linkcode);
    	if(user==null){
    		return ApiTip.LinkError();
    	}
    	Integer userid = user.getId();
    	
    	
    	plan.ApiCreate(userid);
 /*   	
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
       planService.insert(plan);*/
       
       
       
   	if(plan.getIsWholeday()==0){
		plan.setRangelength(getTimeLength(plan.getRange()));
	}
	  Integer isRepeat = plan.getIsRepeat();
	  Integer isRemind = plan.getIsRemind();
  Integer repeatSpace = plan.getRepeatSpace();
  Integer repeatCount = plan.getRepeatCount();
	  if(ToolUtil.isEmpty(repeatSpace)){
		  repeatSpace = 0;
	  }
	  if(ToolUtil.isEmpty(repeatCount)){
		  repeatCount = 1;
	  }
	  System.out.println(repeatCount==null);
	  System.out.println((null+"").equals(repeatCount));
	  
	  for (int i = 0; i <repeatCount; i++) {
		  
		  
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
    
    	  plan.setNowprogress(i+1);
		  
		  
		  
		  planService.insert(plan);
		  plan.setThedate(getNextTheDay(plan.getThedate(),repeatSpace+1));
		  if(isRemind==1){
			  plan.setRemindtime(getNextRemindTime(plan.getRemindtime(),repeatSpace+1));
		  }
		  plan.setId(null);
		
	}
	  
       
       
       
       
       
       
       
       
       
       
       
       
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
