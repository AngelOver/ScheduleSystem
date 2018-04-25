package com.stylefeng.guns.modular.schedule.controller;

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

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.baomidou.mybatisplus.plugins.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import com.stylefeng.guns.core.log.LogObjectHolder;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.Note;
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
   		page = this.noteService.selectPage(page);
   		PageInfoBT<Note> pageInfoBT= this.packForBT(page);
        return pageInfoBT;
    }

    /**
     * 新增便签管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Note note) {
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
