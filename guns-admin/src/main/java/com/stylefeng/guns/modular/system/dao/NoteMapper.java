package com.stylefeng.guns.modular.system.dao;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.modular.system.model.Note;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 便签表 Mapper 接口
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
public interface NoteMapper extends BaseMapper<Note> {

		/**
	 * 查询指定日期的笔记
	 * @param param
	 * @return
	 */
	public List<Map<String ,Object>> selectListByMap(Map<String, Object> param);

}
