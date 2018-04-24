/**
 * 组织机构管理初始化
 */
var Setup = {
    id: "SetupTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Setup.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},
            {title: '网站名称', field: 'websiteName', visible: true, align: 'center', valign: 'middle'},
            {title: '网站英文简称', field: 'websiteCode', visible: true, align: 'center', valign: 'middle'},
            {title: '网站地址', field: 'websiteUrl', visible: true, align: 'center', valign: 'middle'},
            {title: 'LOGO', field: 'logo', visible: true, align: 'center', valign: 'middle'},
            {title: '顶端标题', field: 'toptitle', visible: true, align: 'center', valign: 'middle'},
            {title: '关键字', field: 'keyword', visible: true, align: 'center', valign: 'middle'},
            {title: '描述', field: 'describe', visible: true, align: 'center', valign: 'middle'},
            {title: '主办方', field: 'username', visible: true, align: 'center', valign: 'middle'},
            {title: '联系电话', field: 'tel', visible: true, align: 'center', valign: 'middle'},
            {title: '服务热线', field: 'hotline', visible: true, align: 'center', valign: 'middle'},
            {title: '地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
            {title: '邮箱', field: 'email', visible: true, align: 'center', valign: 'middle'},
            {title: '关于系统', field: 'about', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Setup.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Setup.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加组织机构
 */
Setup.openAddSetup = function () {
    var index = layer.open({
        type: 2,
        title: '添加组织机构',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/setup/setup_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看组织机构详情
 */
Setup.openSetupDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '组织机构详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/setup/setup_update/' + Setup.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除组织机构
 */
Setup.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/setup/delete", function (data) {
            Feng.success("删除成功!");
            Setup.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("setupId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询组织机构列表
 */
Setup.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Setup.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Setup.initColumn();
    var table = new BSTable(Setup.id, "/setup/list", defaultColunms);
    table.setPaginationType("server");
    Setup.table = table.init();
});
