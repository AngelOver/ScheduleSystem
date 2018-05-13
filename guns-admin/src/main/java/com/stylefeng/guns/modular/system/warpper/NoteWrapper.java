package com.stylefeng.guns.modular.system.warpper;

import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.Map;

/**
 * 部门列表的包装
 *
 * @author fengshuonan
 * @date 2017年4月25日 18:10:31
 */
public class NoteWrapper extends BaseControllerWarpper {

    public NoteWrapper(Object list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
    	Integer id = (Integer) map.get("userid");
        String  text =  map.get("text")+"";
        //去除html标签，提取摘要
        text = text.replaceAll("<[^>]*>", "");
        if(text.length()>16){
        	text = text.substring(0,20)+"……";
        }
        map.put("username", ConstantFactory.me().getUserNameById(id));
        map.put("text", text);
    }

}
