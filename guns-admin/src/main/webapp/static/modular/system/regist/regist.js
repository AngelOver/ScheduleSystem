/**
 * 用户详情对话框（可用于添加和修改对话框）
 */
var UserInfoDlg = {
    userInfoData: {},
    validateFields: {
        account: {
            validators: {
                notEmpty: {
                    message: '账号不能为空'
                }
            }
        },
        name: {
            validators: {
                notEmpty: {
                    message: '姓名不能为空'
                }
            }
        },
        email: {
            validators: {
                notEmpty: {
                    message: '邮箱不能为空'
                },
                emailAddress: {
                    message: '邮箱地址格式有误'
                }
            }
        },
        password: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                identical: {
                    field: 'rePassword',
                    message: '两次密码不一致'
                },
            }
        },
        rePassword: {
            validators: {
                notEmpty: {
                    message: '密码不能为空'
                },
                identical: {
                    field: 'password',
                    message: '两次密码不一致'
                },
            }
        }
    }
};

/**
 * 清除数据
 */
UserInfoDlg.clearData = function () {
    this.userInfoData = {};
};

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
UserInfoDlg.set = function (key, val) {
    this.userInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
    return this;
};

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
UserInfoDlg.get = function (key) {
    return $("#" + key).val();
};

/**
 * 关闭此对话框
 */
UserInfoDlg.close = function () {
    parent.layer.close(window.parent.MgrUser.layerIndex);
};





/**
 * 收集数据
 */
UserInfoDlg.collectData = function () {
    this.set('account').set('name').set('email')
       .set('password').set('rePassword');
};

/**
 * 验证两个密码是否一致
 */
UserInfoDlg.validatePwd = function () {
    var password = this.get("password");
    var rePassword = this.get("rePassword");
    if (password == rePassword) {
        return true;
    } else {
        return false;
    }
};

/**
 * 验证数据是否为空
 */
UserInfoDlg.validate = function () {	
	 var flag1 = $('#userInfoForm').data("bootstrapValidator").isValid();		
    $('#userInfoForm').data("bootstrapValidator").resetForm();
    $('#userInfoForm').bootstrapValidator('validate');
    var flag = $('#userInfoForm').data("bootstrapValidator").isValid();		
    return $("#userInfoForm").data('bootstrapValidator').isValid();
};

/**
 * 提交添加用户
 */
UserInfoDlg.registSubmit = function () {
    this.clearData();
    this.collectData();
    if (!this.validate()) {
        return;
    }
    if (!this.validatePwd()) {
        Feng.error("两次密码输入不一致");
        return;
    }

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/regist", function (data) {
        Feng.success("注册成功!正在为你自动登录。。。’");
        //自动登录
        layer.msg('注册成功', {
     	   icon: 1,
      	  time: 2000, //2秒关闭（如果不配置，默认是3秒）//设置后不需要自己写定时关闭了，单位是毫秒
      	end:function(){
      		
      		 layer.msg('正在为您自动登录,请等待。。。。', {
      	    	  icon: 16,//提示的样式
      	    	  time: 2000, //2秒关闭（如果不配置，默认是3秒）//设置后不需要自己写定时关闭了，单位是毫秒
      	    	end:function(){
      	    	//自动访问登录接口
      	    	//表单提交
     		 	    		var username = $("#account").val();
     		 	    		$("#username").val(username);
     		 	    		//form submit 不能提交
     		 	    		$("#loginButton").click();
     	/*	 	    		 $.ajax({  
     		  	    	        //提交数据的类型 POST GET  
     		  	    	        type:"POST",  
     		  	    	        //提交的网址  
     		  	    	        url:"${ctxPath}/login",  
     		  	    	        //提交的数据  
     		  	    	        data:{username:username,password:password},  
     		  	    	        //返回数据的格式  
     		  	    	        datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".  
     		  	    	        //在请求之前调用的函数  
     		  	    	        beforeSend:function(){$("#msg").html("logining");},  
     		  	    	        //成功返回之后调用的函数               
     		  	    	        success:function(data){  
     		  	    	       $("#msg").html(decodeURI(data));              
     		  	    	        }   ,  
     		  	    	        //调用执行后调用的函数  
     		  	    	        complete: function(XMLHttpRequest, textStatus){  
     		  	    	           alert(XMLHttpRequest.responseText);  
     		  	    	           alert(textStatus);  
     		  	    	            //HideLoading();  
     		  	    	        },  
     		  	    	        //调用出错执行的函数  
     		  	    	        error: function(){  
     		  	    	            //请求出错处理  
     		  	    	        	
     		  	    	     	 layer.msg('自动登录失败,返回登录。。。。', {
     				 	   	    	  icon: 16,//提示的样式
     				 	   	    	  time: 2000, //2秒关闭（如果不配置，默认是3秒）//设置后不需要自己写定时关闭了，单位是毫秒
     				 	   	    	end:function(){
     				 	   	    	window.location.href='${ctxPath}/';
     				 	   	    	}
     				 	   		 			}); 
     		  	    	        } 
     		  	    		
     		  	    	}); */
     		 	    		
      	    					}
      		 			}); 
      		 
      			}
     	}); 
         
    
        
        
    }, function (data) {
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.userInfoData);
    console.log(this.userInfoData);
    ajax.start();
};

/**
 * 提交修改
 */
UserInfoDlg.editSubmit = function () {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }
    return;

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/mgr/edit", function (data) {
        Feng.success("修改成功!");
        if (window.parent.MgrUser != undefined) {
            window.parent.MgrUser.table.refresh();
            UserInfoDlg.close();
        }
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.userInfoData);
    ajax.start();
};

/**
 * 修改密码
 */
UserInfoDlg.chPwd = function () {
    var ajax = new $ax(Feng.ctxPath + "/mgr/changePwd", function (data) {
        Feng.success("修改成功!");
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set("oldPwd");
    ajax.set("newPwd");
    ajax.set("rePwd");
    ajax.start();

};

function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
            event.target).parents("#menuContent").length > 0)) {
        UserInfoDlg.hideDeptSelectTree();
    }
}

$(function () {
    Feng.initValidator("userInfoForm", UserInfoDlg.validateFields);
});
