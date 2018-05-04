/**
 * 初始化计划管理详情对话框
 */
var PlanInfoDlg = {
    planInfoData : {}
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
/*    .set('isWholeday')*/
/*    .set('isRepeat')*/
    
    .set('isWholeday',getCheckboxValue('isWholeday'))
    .set('repeatCount')
      .set('repeatSpace')
        .set('repeatType')
    .set('progressCount')
    .set('progressUnit')
/*    .set('isProgress')*/
    
       .set('isProgress',getCheckboxValue('isProgress'))
    .set('waitStatus')
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

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plan/add", function(data){
        Feng.success("添加成功!");
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

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/plan/update", function(data){
        Feng.success("修改成功!");
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


});
