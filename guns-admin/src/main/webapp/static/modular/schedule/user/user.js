/**
 * 系统管理--用户管理的单例对象
 */
var MgrUser = {
    id: "managerTable",//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1,
    deptid:29
};

var href =top.window.location.href;
var url = href+"api/link/";

/**
 * 初始化表格的列
 */
MgrUser.initColumn = function () {
    var columns = [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: false, align: 'center', valign: 'middle'},
        {title: '账号', field: 'account', align: 'center', valign: 'middle', sortable: true},
        {title: '姓名', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: '性别', field: 'sexName', align: 'center', valign: 'middle', sortable: true},
        {title: '角色', field: 'roleName', align: 'center', valign: 'middle', sortable: true},
/*        {title: '部门', field: 'deptName', align: 'center', valign: 'middle', sortable: true},*/
        {title: '邮箱', field: 'email', align: 'center', valign: 'middle', sortable: true},
        {title: '电话', field: 'phone', align: 'center', valign: 'middle', sortable: true},
        {title: '专属链接', field: 'linkcode', align: 'center', valign: 'middle', sortable: true,formatter:function (value,row,index) {
        	return "<a href='"+url+value+"'  target='view_window'>"+url+value+"</a>";
      		
      }},
        {title: '创建时间', field: 'createtime', align: 'center', valign: 'middle', sortable: true},
        {title: '状态', field: 'statusName', align: 'center', valign: 'middle', sortable: true}];
    return columns;
};

/**
 * 检查是否选中
 */
MgrUser.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if (selected.length == 0) {
        Feng.info("请先选中表格中的某一记录！");
        return false;
    } else {
        MgrUser.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加管理员
 */
MgrUser.openAddMgr = function () {
    var index = layer.open({
        type: 2,
        title: '添加管理员',
        area: ['800px', '560px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/scheduleUser/user_add'
    });
    this.layerIndex = index;
};

/**
 * 点击修改按钮时
 * @param userId 管理员id
 */
MgrUser.openChangeUser = function () {
	
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '编辑管理员',
            area: ['800px', '480px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/scheduleUser/user_edit/' + this.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 点击角色分配
 * @param
 */
MgrUser.roleAssign = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '角色分配',
            area: ['300px', '400px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/scheduleUser/role_assign/' + this.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除用户
 */
MgrUser.delMgrUser = function () {
    if (this.check()) {

        var operation = function(){
            var userId = MgrUser.seItem.id;
            var ajax = new $ax(Feng.ctxPath + "/scheduleUser/delete", function () {
                Feng.success("删除成功!");
                MgrUser.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("userId", userId);
            ajax.start();
        };

        Feng.confirm("是否删除用户" + MgrUser.seItem.account + "?",operation);
    }
};

/**
 * 冻结用户账户
 * @param userId
 */
MgrUser.freezeAccount = function () {
    if (this.check()) {
        var userId = this.seItem.id;
        var ajax = new $ax(Feng.ctxPath + "/scheduleUser/freeze", function (data) {
            Feng.success("冻结成功!");
            MgrUser.table.refresh();
        }, function (data) {
            Feng.error("冻结失败!" + data.responseJSON.message + "!");
        });
        ajax.set("userId", userId);
        ajax.start();
    }
};

/**
 * 解除冻结用户账户
 * @param userId
 */
MgrUser.unfreeze = function () {
    if (this.check()) {
        var userId = this.seItem.id;
        var ajax = new $ax(Feng.ctxPath + "/scheduleUser/unfreeze", function (data) {
            Feng.success("解除冻结成功!");
            MgrUser.table.refresh();
        }, function (data) {
            Feng.error("解除冻结失败!");
        });
        ajax.set("userId", userId);
        ajax.start();
    }
}

/**
 * 重置密码
 */
MgrUser.resetPwd = function () {
    if (this.check()) {
        var userId = this.seItem.id;
        parent.layer.confirm('是否重置密码为111111？', {
            btn: ['确定', '取消'],
            shade: false //不显示遮罩
        }, function () {
            var ajax = new $ax(Feng.ctxPath + "/scheduleUser/reset", function (data) {
                Feng.success("重置密码成功!");
            }, function (data) {
                Feng.error("重置密码失败!");
            });
            ajax.set("userId", userId);
            ajax.start();
        });
    }
};


/**
 * 重置链接
 */
MgrUser.resetlink = function () {
    if (this.check()) {
        var userId = this.seItem.id+"";
        console.log("ok");
        console.log(userId);
    	$.ajax({
		    type: "post",
			dataType: 'json',
		    url: Feng.ctxPath +"/scheduleUser/updateLinkCode",//请求后台方法
		    data: {id :userId},
		    success: function (date) {
			layer.msg("重置成功");
			MgrUser.table.refresh();
		     },
		    error: function (response) {
		        var r = jQuery.parseJSON(response.responseText);
		        alert("Message: " + r.Message);
		    }
		})
    }
};


MgrUser.resetSearch = function () {
    $("#name").val("");
    $("#beginTime").val("");
    $("#endTime").val("");

    MgrUser.search();
}

MgrUser.search = function () {
    var queryData = {};

    queryData['deptid'] = MgrUser.deptid;
    queryData['name'] = $("#name").val();
    queryData['beginTime'] = $("#beginTime").val();
    queryData['endTime'] = $("#endTime").val();

    MgrUser.table.refresh({query: queryData});
}

MgrUser.onClickDept = function (e, treeId, treeNode) {
    MgrUser.deptid = 29;
    MgrUser.search();
};

$(function () {
    var defaultColunms = MgrUser.initColumn();
    var table = new BSTable("managerTable", "/scheduleUser/list?deptid=29", defaultColunms);
    table.setPaginationType("client");
    MgrUser.table = table.init();
    var ztree = new $ZTree("deptTree", "/dept/tree");
    ztree.bindOnClick(MgrUser.onClickDept);
    ztree.init();
});
