package com.stylefeng.guns.modular.schedule.service.impl;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.modular.schedule.service.IPlanService;
import com.stylefeng.guns.modular.system.dao.PlanMapper;
import com.stylefeng.guns.modular.system.model.Plan;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;

/**
 * <p>
 * 计划表 服务实现类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-28
 */
@Service
public class PlanServiceImpl extends ServiceImpl<PlanMapper, Plan> implements IPlanService {
	
	
	
	/**
	 * 查询指定日期的日程
	 * @param param
	 * @return
	 */
	public List<Map<String ,Object>> selectListByMap(Map<String, Object> param){
		  return this.baseMapper.selectListByMap(param);
	}

}
