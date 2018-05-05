package com.stylefeng.guns.modular.schedule.service.impl;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.modular.system.model.Note;
import com.stylefeng.guns.modular.system.dao.NoteMapper;
import com.stylefeng.guns.modular.schedule.service.INoteService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;

/**
 * <p>
 * 便签表 服务实现类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
@Service
public class NoteServiceImpl extends ServiceImpl<NoteMapper, Note> implements INoteService {
	/**
	 * 查询指定日期的笔记
	 * @param param
	 * @return
	 */
	public List<Map<String ,Object>> selectListByMap(Map<String, Object> param){
		  return this.baseMapper.selectListByMap(param);
	}
}
