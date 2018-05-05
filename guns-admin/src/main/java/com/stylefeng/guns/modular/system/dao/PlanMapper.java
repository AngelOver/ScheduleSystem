package com.stylefeng.guns.modular.system.dao;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.modular.system.model.Plan;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 计划表 Mapper 接口
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-28
 */
public interface PlanMapper extends BaseMapper<Plan> {

	/**
	 * 查询指定日期的日程
	 * @param param
	 * @return
	 */
	List<Map<String ,Object>> selectListByMap(Map<String, Object> param);

}
