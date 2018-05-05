package com.stylefeng.guns.modular.schedule.service;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.modular.system.model.Note;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 便签表 服务类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
public interface INoteService extends IService<Note> {

	/**
	 * 查询指定日期的笔记
	 * @param param
	 * @return
	 */
	List<Map<String ,Object>> selectListByMap(Map<String, Object> param);

}
