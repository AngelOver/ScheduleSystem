package com.stylefeng.guns.modular.system.warpper;

import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String start = "";
    	String end = "";
    	String isWholeday  = map.get("is_wholeday")+"";
    	String starttime  = map.get("starttime")+"";
    	String endtime  = map.get("endtime")+"";
    	String thedate  = map.get("thedate")+"";
    	String range  = map.get("range")+"";
    	
    	String importantstatus  = map.get("importantstatus")+"";
    	String color = "Khaki";
    	switch (importantstatus) {
		case "1":
			color="red";
			break;
		case "2":
			color="MediumSlateBlue";
			break;
		case "3":
			color="SlateGray";
			break;

		default:
			break;
		}
    	map.put("color",color);
    	if("0".equals(isWholeday)){
    		start =  (starttime).replace(" ", "T").replace(".0", "");
    		end =  (endtime).replace(" ", "T").replace(".0", "");
    		map.put("start", start);
    		map.put("end", end);
    		map.put("rangetime", range);
    	}else{
    		start =thedate.replace("年", "-").replace("月", "-").replace("日", "");
    		map.put("start", start);
    		map.put("rangetime", "全天");
    	}
    	String remindtime  = map.get("remindtime")+"";
    	if(!remindtime.equals(null+"")&&!remindtime.equals("")){
    		try {
				long time = dateFormat.parse(remindtime).getTime();
				map.put("time",time);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	map.put("rangetime", "全天");
    /*	title: 'Repeating Event',
		start: '2018-05-16T16:00:00'
		end: */
    }
/*    public static void main(String[] args) {
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String remindtime  = "2018-5-6 13:52:00";
    	try {
			long time = dateFormat.parse(remindtime).getTime();
			System.out.println(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

}
