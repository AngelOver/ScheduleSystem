package com.stylefeng.guns.modular.system.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.modular.system.model.LoginLog;
import com.stylefeng.guns.modular.system.model.OperationLog;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 登录记录 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2017-07-11
 */
public interface IndexMapper{

    /**
     * 获取登录日志
     */
    List<Map<String, Object>> getLoginLogs();

	/**统计注册用户数量
	 * @return
	 */
	int getUserCount(Map<String, Object> param);

	/**
	 * 统计总计划数量 参数userid
	 * @param param
	 * @return
	 */
	int getPlanCount(Map<String, Object> param);

	/**
	 * 统计用户便签数 参数 userid
	 * @return
	 */
	int getNoteCount(Map<String, Object> param);

}