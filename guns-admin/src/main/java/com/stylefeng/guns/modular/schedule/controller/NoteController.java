package com.stylefeng.guns.modular.schedule.controller;

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
@RequestMapping("/note")
public class NoteController extends BaseController {

    private String PREFIX = "/schedule/note/";

    @Autowired
    private INoteService noteService;

    
	@InitBinder
	protected void init(HttpServletRequest request,
			ServletRequestDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
	
	
    
    /**
     * 跳转到便签管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "note.html";
    }

    /**
     * 跳转到添加便签管理
     */
    @RequestMapping("/note_add")
    public String noteAdd() {
        return PREFIX + "note_add.html";
    }
    
    /**
     * 跳转到菜单添加便签管理
     */
    @RequestMapping("/note_info")
    public String noteInfo() {
        return PREFIX + "note_info.html";
    }

    /**
     * 跳转到修改便签管理
     */
    @RequestMapping("/note_update/{noteId}")
    public String noteUpdate(@PathVariable Integer noteId, Model model) {
        Note note = noteService.selectById(noteId);
        model.addAttribute("item",note);
        LogObjectHolder.me().set(note);
        return PREFIX + "note_edit.html";
    }

    /**
     * 获取便签管理列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
   		Page<Note> page = new PageFactory<Note>().defaultPage();
   		EntityWrapper<Note> entityWrapper =new EntityWrapper<Note>();
    	if(ToolUtil.isNotEmpty(condition)){
    		entityWrapper.like("text", condition);
    	}
   		page = this.noteService.selectPage(page,entityWrapper);
   		Object list = new NoteWrapper(PageFactory.getObj(page)).warp();
        return PageFactory.btPage(page,list);
    }

    /**
     * 新增便签管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Note note) {
    	note.create();//初始化
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

    /**
     * 便签管理详情
     */
    @RequestMapping(value = "/detail/{noteId}")
    @ResponseBody
    public Object detail(@PathVariable("noteId") Integer noteId) {
        return noteService.selectById(noteId);
    }
}
