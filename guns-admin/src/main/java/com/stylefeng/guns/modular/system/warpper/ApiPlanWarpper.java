package com.stylefeng.guns.modular.system.warpper;

import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.List;
import java.util.Map;

/**
 * 计划管理的包装类
 *
 * @author fengshuonan
 * @date 2017年2月13日 下午10:47:03
 */
public class ApiPlanWarpper extends BaseControllerWarpper {

    public ApiPlanWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
    	String start = "";
    	String end = "";
    	String isWholeday  = map.get("is_wholeday")+"";
    	String starttime  = map.get("starttime")+"";
    	String endtime  = map.get("endtime")+"";
    	String thedate  = map.get("thedate")+"";
    	if("0".equals(isWholeday)){
    		start =  (starttime).replace(" ", "T").replace(".0", "");
    		end =  (endtime).replace(" ", "T").replace(".0", "");
    		map.put("start", start);
    		map.put("end", end);
    	}else{
    		start =thedate.replace("年", "-").replace("月", "-").replace("日", "");
    		map.put("start", start);
    	}
    	
    /*	title: 'Repeating Event',
		start: '2018-05-16T16:00:00'
		end: */
    }

}
