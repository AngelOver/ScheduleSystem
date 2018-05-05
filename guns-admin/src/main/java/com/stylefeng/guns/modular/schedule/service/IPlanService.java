package com.stylefeng.guns.modular.schedule.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.stylefeng.guns.modular.system.model.Plan;

/**
 * <p>
 * 计划表 服务类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-28
 */
public interface IPlanService extends IService<Plan> {

	/**
	 * 查询指定日期的日程
	 * @param param
	 * @return
	 */
	List<Map<String ,Object>> selectListByMap(Map<String, Object> param);

}
