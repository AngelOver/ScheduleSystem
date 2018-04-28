/**
 * 计划管理管理初始化
 */
var Plan = {
    id: "PlanTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Plan.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
/*            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},*/
/*            {title: '用户id', field: 'userid', visible: true, align: 'center', valign: 'middle'},*/
            {title: '标题', field: 'title', visible: true, align: 'center', valign: 'middle'},
            {title: '备注', field: 'remark', visible: true, align: 'center', valign: 'middle'},
            {title: '地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
            {title: '计划时间', field: 'thedate', visible: true, align: 'center', valign: 'middle'},
            {title: '时间范围', field: 'range', visible: true, align: 'center', valign: 'middle'},
            {title: '时间长度', field: 'rangelength', visible: true, align: 'center', valign: 'middle'},
            {title: '时间段', field: 'rangetype', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'starttime', visible: true, align: 'center', valign: 'middle'},
            {title: '结束时间', field: 'endtime', visible: true, align: 'center', valign: 'middle'},
            {title: '提醒时间', field: 'remindtime', visible: true, align: 'center', valign: 'middle'},
            {title: '提醒类型', field: 'remindtype', visible: true, align: 'center', valign: 'middle'},
            {title: '重要程度', field: 'importantstatus', visible: true, align: 'center', valign: 'middle'},
            {title: '是否全天', field: 'isWholeday', visible: true, align: 'center', valign: 'middle'},
            {title: '是否重复', field: 'isRepeat', visible: true, align: 'center', valign: 'middle'},
            {title: '重复次数', field: 'repeatcount', visible: true, align: 'center', valign: 'middle'},
            {title: '是否展示进度', field: 'isProgress', visible: true, align: 'center', valign: 'middle'},
            {title: '完成情况', field: 'waitStatus', visible: true, align: 'center', valign: 'middle'},
            {title: '当前进度', field: 'nowprogress', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createtime', visible: true, align: 'center', valign: 'middle'},
            {title: '更新时间', field: 'updatetime', visible: true, align: 'center', valign: 'middle'},
   /*         {title: '保留字段', field: 'version', visible: true, align: 'center', valign: 'middle'}*/
    ];
};

/**
 * 检查是否选中
 */
Plan.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Plan.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加计划管理
 */
Plan.openAddPlan = function () {
    var index = layer.open({
        type: 2,
        title: '添加计划管理',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/plan/plan_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看计划管理详情
 */
Plan.openPlanDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '计划管理详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/plan/plan_update/' + Plan.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除计划管理
 */
Plan.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/plan/delete", function (data) {
            Feng.success("删除成功!");
            Plan.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("planId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询计划管理列表
 */
Plan.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Plan.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Plan.initColumn();
    var table = new BSTable(Plan.id, "/plan/list", defaultColunms);
    table.setPaginationType("server");
    Plan.table = table.init();
});
