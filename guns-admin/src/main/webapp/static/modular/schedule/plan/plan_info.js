/**
 * 初始化计划管理详情对话框
 */
var PlanInfoDlg = {
    planInfoData : {
    	
    },
validateFields: {
	 title: {
         validators: {
             notEmpty: {
                 message: '标题不能为空'
             }
         }
     },
     thedate: {
         validators: {
             notEmpty: {
                 message: '计划时间不能为空'
             }
         }
     }
	
}
};

/**
 * 清除数据
 */
PlanInfoDlg.clearData = function() {
    this.planInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlanInfoDlg.set = function(key, val) {
    this.planInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlanInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
PlanInfoDlg.close = function() {
    parent.layer.close(window.parent.Plan.layerIndex);
}

/**
 * 获取checkbox的值
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
function getCheckboxValue(id){
	return $("#"+id).is(":checked")?1:0;
}

/**
 * 收集数据
 */
PlanInfoDlg.collectData = function() {
    this
    .set('id')
    .set('title')
    .set('remark')
    .set('address')
    .set('thedate')
    .set('range')
    .set('rangelength')
    .set('rangetype')
    .set('starttime')
    .set('endtime')
    .set('remindtime')
    .set('remindtype')
    .set('importantstatus')
    .set('isRepeat')
    .set('isRemind')
    .set('isWholeday')
    .set('repeatCount')
      .set('repeatSpace')
        .set('repeatType')
    .set('progressCount')
    .set('progressUnit')
    
       .set('isProgress')
    .set('status')
    .set('nowprogress')
    .set('createtime')
    .set('updatetime')
    .set('version');
}

/**
 * 提交添加
 */
PlanInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();
	var isWholeday = PlanInfoDlg.planInfoData.isWholeday;
	var range = PlanInfoDlg.planInfoData.range;
	var isRemind = PlanInfoDlg.planInfoData.isRemind;
	var remindtime = PlanInfoDlg.planInfoData.remindtime;
	var isRepeat = PlanInfoDlg.planInfoData.isRepeat;
	var repeatSpace = PlanInfoDlg.planInfoData.repeatSpace;
	var repeatCount = PlanInfoDlg.planInfoData.repeatCount;
	console.log(isWholeday);
	    if(isWholeday=="0"){
	    	if(range==""){
	    		layer.msg("时间范围必填");
	    		return false;
	    	}else{
				var start = range.split(" - ")[0];
				var end = range.split(" - ")[1];
				console.log(start+end);
				if(end<start){
					layer.msg("结束时间不能小于开始时间");
					return false;
				}
				
			}
	    }
		if(isRemind=="1") {
			if(remindtime=="") {
			layer.msg("提醒时间不能为空");
				return false;
			}
		}
		
		if(isRepeat=="1") {
			if(repeatSpace=="") {
				layer.msg("间隔天数不能为空");
				return false;
			}
			if(repeatCount=="") {
				layer.msg("重复次数不能为空");
				return false;
			}
		}  
    
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plan/add", function(data){
        Feng.success("添加成功!");
        top[0].window.location.reload();
        window.parent.Plan.table.refresh();
        PlanInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.planInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
PlanInfoDlg.editSubmit = function() {

	var isWholeday = PlanInfoDlg.planInfoData.isWholeday;
	var range = PlanInfoDlg.planInfoData.range;
	var isRemind = PlanInfoDlg.planInfoData.isRemind;
	var remindtime = PlanInfoDlg.planInfoData.remindtime;
	var isRepeat = PlanInfoDlg.planInfoData.isRepeat;
	var repeatSpace = PlanInfoDlg.planInfoData.repeatSpace;
	var repeatCount = PlanInfoDlg.planInfoData.repeatCount;
	    if(isWholeday=="0"){
	    	if(range==""){
	    		layer.msg("时间范围必填");
	    		return false;
	    	}else{
				var start = range.split(" - ")[0];
				var end = range.split(" - ")[1];
				console.log(start+end);
				if(end<start){
					layer.msg("结束时间不能小于开始时间");
					return false;
				}
				
			}
	    }
		if(isRemind=="1") {
			if(remindtime=="") {
			layer.msg("提醒时间不能为空");
				return false;
			}
		}
		
		if(isRepeat=="1") {
			if(repeatSpace=="") {
				layer.msg("间隔天数不能为空");
				return false;
			}
			if(repeatCount=="") {
				layer.msg("重复次数不能为空");
				return false;
			}
		}  
	
    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plan/update", function(data){
        Feng.success("修改成功!");
        top[0].window.location.reload();
        window.parent.Plan.table.refresh();
       
        PlanInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.planInfoData);
    ajax.start();
}


layui.use(['form','laydate'],function(){
	 var laydate = layui.laydate;
	laydate.render({ elem: '#thedate',format: 'yyyy年MM月dd日',theme: 'molv'});
	laydate.render({ elem: '#range',format: 'HH:mm',theme: 'molv',type: 'time' ,range: true});
	laydate.render({ elem: '#remindtime',format: 'yyyy-MM-dd HH:mm:ss',theme: 'molv' ,type: 'datetime'});
}); 


$(function() {
	Feng.initValidator("planInfoForm", PlanInfoDlg.validateFields);
    $("#isRepeat").val($("#isRepeatVal").val());
    $("#isRemind").val($("#isRemindVal").val());
    $("#status").val($("#statusVal").val());
    $("#isWholeday").val($("#isWholedayVal").val());
    $("#importantstatus").val($("#importantstatusVal").val());
});
