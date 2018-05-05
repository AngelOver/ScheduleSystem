package com.stylefeng.guns.modular.api.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.stylefeng.guns.core.base.controller.BaseController;

import org.apache.commons.collections.map.HashedMap;
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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.stylefeng.guns.core.log.LogObjectHolder;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.Note;
import com.stylefeng.guns.modular.system.model.OperationLog;
import com.stylefeng.guns.modular.system.model.User;
import com.stylefeng.guns.modular.system.service.IUserService;
import com.stylefeng.guns.modular.system.warpper.ApiNoteWrapper;
import com.stylefeng.guns.modular.system.warpper.ApiPlanWarpper;
import com.stylefeng.guns.modular.system.warpper.LogWarpper;
import com.stylefeng.guns.modular.system.warpper.NoteWrapper;
import com.stylefeng.guns.modular.system.warpper.NoticeWrapper;
import com.stylefeng.guns.modular.system.warpper.UserWarpper;
import com.stylefeng.guns.modular.schedule.service.INoteService;

/**
 * 便签管理控制器
 *
 * @author fengshuonan
 * @Date 2018-04-24 18:55:22
 */
@Controller
@RequestMapping("/api/note")
public class ApiNoteController extends BaseController {

    private String PREFIX = "/schedule/note/";

    @Autowired
    private INoteService noteService;
    
    @Autowired
    private IUserService userService;

    /*
	@InitBinder
	protected void init(HttpServletRequest request,
			ServletRequestDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
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
    	param.put("is_show", 1);
    	param.put("userid", userid);
    	List<Map<String, Object>> list = noteService.selectListByMap(param);
    	for (int i = 0; i < list.size(); i++) {
			list.get(i).put("num", i+1);
		}
    	Object warp = new ApiNoteWrapper(list).warp();
        return JSONObject.toJSON(ApiTip.ok(warp));
    }
    public User checkCode(String linkcode){
    	return  userService.getUserByLinkCode(linkcode);
    }


    /**
     * 新增便签管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Note note,String linkcode) {
    	User user = checkCode(linkcode);
    	if(user==null){
    		return ApiTip.LinkError();
    	}
    	Integer userid = user.getId();
    	
    	note.ApiCreate(userid);//初始化
        noteService.insert(note);
        return SUCCESS_TIP;
    }

    /**
     * 删除便签管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer noteId) {
        noteService.deleteById(noteId);
        return SUCCESS_TIP;
    }

    /**
     * 修改便签管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Note note) {
    	note.update();
        noteService.updateById(note);
        return SUCCESS_TIP;
    }

}
