package com.stylefeng.guns.modular.system.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.modular.system.dao.IndexMapper;
import com.stylefeng.guns.modular.system.dao.LoginLogMapper;
import com.stylefeng.guns.modular.system.dao.MenuMapper;
import com.stylefeng.guns.modular.system.model.LoginLog;
import com.stylefeng.guns.modular.system.model.OperationLog;
import com.stylefeng.guns.modular.system.service.IIndexService;
import com.stylefeng.guns.modular.system.service.ILoginLogService;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/**
 * <p>
 * 登录记录 服务实现类
 * </p>
 *
 * @author stylefeng123
 * @since 2018-02-22
 */
@Service
public class IndexServiceImpl implements IIndexService{
	
	
    @Resource
    private IndexMapper indexMapper;
	
	/**
	 * 首页统计
	 * @return
	 */
	public Map<String, Object> getStatistics(){
		Map<String ,Object > map =new HashMap<String, Object>();
		Map<String ,Object > param =new HashMap<String, Object>();
		Integer userId = ShiroKit.getUser().getId();
		
		int n = 0;
		param.put("roleid", 6);
		map.put("allUserCount", indexMapper.getUserCount(param));
		map.put("allPlanCount", indexMapper.getPlanCount(param));
		param.put("userid", userId);
		map.put("planCount", indexMapper.getPlanCount(param));
		map.put("noteCount", indexMapper.getNoteCount(param));
		return map;
	}

}
