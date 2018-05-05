package com.stylefeng.guns.core.base.tips;

/**
 * 返回给Api的成功提示
 *
 * @author fengshuonan
 * @date 2016年11月12日 下午5:05:22
 */
public class ApiTip  {
	private boolean success  ;
	private String message  ;
	private Object obj;
	
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public ApiTip(){
		this.success = true;
		this.message = "操作成功";
	}
	public ApiTip  ok(Object obj ){ 
		this.success = true;
		this.message = "操作成功";
		this.obj = obj;
		return this;
	}
	
	public ApiTip  error(String msg){ 
		this.success = false;
		this.message = msg;
		this.obj = null;
		return this;
	}
	
	public ApiTip  LinkError(){ 
		this.success = false;
		this.message = "该链接已失效，请重新验证";
		this.obj = null;
		return this;
	}
}
