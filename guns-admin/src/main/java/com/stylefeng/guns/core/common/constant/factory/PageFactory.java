package com.stylefeng.guns.core.common.constant.factory;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.core.common.constant.state.Order;
import com.stylefeng.guns.core.support.HttpKit;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.model.Note;

import javax.servlet.http.HttpServletRequest;

/**
 * BootStrap Table默认的分页参数创建
 *
 * @author fengshuonan
 * @date 2017-04-05 22:25
 */
public class PageFactory<T> {
	/**
	 * 返回BootStrapTable需要的数据格式
	 * @param page
	 * @return  JSONObject
	 */
	public static JSONObject btPage(Page page) {
		JSONObject pages = new JSONObject();
		pages.put("total", page.getTotal());
		pages.put("rows", page.getRecords());
		return pages;
	}
	
	
	/**
	 * 返回BootStrapTable需要的数据格式
	 * @param page
	 * @param Obj
	 * @return  JSONObject
	 */
	public static JSONObject btPage(Page page,Object list ) {
		JSONObject pages = new JSONObject();
		pages.put("total", page.getTotal());
		pages.put("rows", list);
		return pages;
	}
	
	
	/**
	 * 返回page中list的Obj类型
	 * @param page
	 * @param Obj
	 * @return  JSONObject
	 */
	public static Object getObj(Page page ) {
		return JSONObject.toJSON(page.getRecords()) ;
	}
	
	
	
    public Page<T> defaultPage() {
        HttpServletRequest request = HttpKit.getRequest();
        int limit = Integer.valueOf(request.getParameter("limit"));     //每页多少条数据
        int offset = Integer.valueOf(request.getParameter("offset"));   //每页的偏移量(本页当前有多少条)
        String sort = request.getParameter("sort");         //排序字段名称
        String order = request.getParameter("order");       //asc或desc(升序或降序)
        if (ToolUtil.isEmpty(sort)) {
            Page<T> page = new Page<>((offset / limit + 1), limit);
            page.setOpenSort(false);
            return page;
        } else {
            Page<T> page = new Page<>((offset / limit + 1), limit, sort);
            if (Order.ASC.getDes().equals(order)) {
                page.setAsc(true);
            } else {
                page.setAsc(false);
            }
            return page;
        }
    }
    //测试jsonObject
    public static void main(String[] args) {
    	Note note = new Note();
    	List<Note> list = new ArrayList<Note>();
    	note.setId(1);
    	note.update();
    	note.setText("测试");
    	list.add(note);
    	list.add(note);
    	list.add(note);
    	JSONObject pages = new JSONObject();
		Object json = JSONObject.toJSON(list);
		System.out.println(json);
		System.out.println(pages);
	}
}
