package com.stylefeng.guns.modular.system.warpper;

import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * 部门列表的包装
 *
 * @author fengshuonan
 * @date 2017年4月25日 18:10:31
 */
public class ApiNoteWrapper extends BaseControllerWarpper {

    public ApiNoteWrapper(Object list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM-dd");
        String  text =  map.get("text")+"";
        //去除html标签，提取摘要
        text=text.replaceAll("<[^>]*>", "");
        if(text.length()>16){
        	text = text.substring(0,20)+"……";
        }
        map.put("text", text);
        String createtime  = map.get("createtime")+"";
        String time = createtime.substring(5,10);
        map.put("time", time);
    }
    

}
