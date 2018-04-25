/**
 * 普通用户管理初始化
 */
var User = {
    id: "UserTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
User.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '头像', field: 'avatar', visible: true, align: 'center', valign: 'middle'},
            {title: '账号', field: 'account', visible: true, align: 'center', valign: 'middle'},
            {title: '名字', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '生日', field: 'birthday', visible: true, align: 'center', valign: 'middle'},
            {title: '性别', field: 'sex', visible: true, align: 'center', valign: 'middle'},
            {title: '电子邮件', field: 'email', visible: true, align: 'center', valign: 'middle'},
            {title: '电话', field: 'phone', visible: true, align: 'center', valign: 'middle'},
            {title: '角色id', field: 'roleid', visible: true, align: 'center', valign: 'middle'},
            {title: '状态(1：启用  2：冻结  3：删除）', field: 'status', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createtime', visible: true, align: 'center', valign: 'middle'},
    ];
};

/**
 * 检查是否选中
 */
User.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        User.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加普通用户
 */
User.openAddUser = function () {
    var index = layer.open({
        type: 2,
        title: '添加普通用户',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/scheduleUser/scheduleUser_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看普通用户详情
 */
User.openUserDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '普通用户详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/scheduleUser/scheduleUser_update/' + User.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除普通用户
 */
User.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/scheduleUser/delete", function (data) {
            Feng.success("删除成功!");
            User.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("userId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询普通用户列表
 */
User.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    User.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = User.initColumn();
    var table = new BSTable(User.id, "/scheduleUser/list", defaultColunms);
    table.setPaginationType("server");
    User.table = table.init();
});
