/**
 * 便签管理初始化
 */
var Note = {
    id: "NoteTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Note.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
/*            {title: '主键id', field: 'id', visible: true, align: 'center', valign: 'middle'},*/
/*            {title: '父级id(备忘录归档)', field: 'pid', visible: true, align: 'center', valign: 'middle'},*/
 /*           {title: '便签类型(0 便签 1 文件夹)', field: 'type', visible: true, align: 'center', valign: 'middle'},*/
/*            {title: '用户id', field: 'userid', visible: true, align: 'center', valign: 'middle'},*/
            {title: '标题', field: 'title', visible: true, align: 'center', valign: 'middle'},
            {title: '便签', field: 'text', visible: true, align: 'center', valign: 'middle'},
            {title: '展示', field: 'isShow', visible: true, align: 'center', valign: 'middle',formatter:function (value,row,index) {
        		if(value ==0){
         			 return "<span class='badge badge-info'>否</span>";
         		}else if (value ==1){
         			 return "<span class='badge badge-success'>是</span>";
         		} 
         }},
            {title: '置顶', field: 'isTop', visible: true, align: 'center', valign: 'middle',formatter:function (value,row,index) {
        		if(value ==0){
         			 return "<span class='badge badge-info'>否</span>";
         		}else if (value ==1){
         			 return "<span class='badge badge-success'>是</span>";
         		} 
         }},
         	{title: '待办', field: 'isWait', visible: true, align: 'center', valign: 'middle',formatter:function (value,row,index) {
        		if(value ==0){
         			 return "<span class='badge badge-info'>否</span>";
         		}else if (value ==1){
         			 return "<span class='badge badge-success'>是</span>";
         		} 
         }},
            {title: '完成', field: 'waitStatus', visible: true, align: 'center', valign: 'middle',formatter:function (value,row,index) {
            	if(row.isWait==0){
            		return "-";
            	}else{
        		if(value ==0){
         			 return "<span class='badge badge-info'>否</span>";
         		}else if (value ==1){
         			 return "<span class='badge badge-success'>是</span>";
         		} 
            	}
         }},
     		{title: '创建人', field: 'username', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createtime', visible: true, align: 'center', valign: 'middle' },
            {title: '更新时间', field: 'updatetime', visible: true, align: 'center', valign: 'middle'},
         /*   {title: '保留字段', field: 'version', visible: true, align: 'center', valign: 'middle'}*/
    ];
};

/**
 * 检查是否选中
 */
Note.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Note.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加便签
 */
Note.openAddNote = function () {
    var index = layer.open({
        type: 2,
        title: '添加便签',
        area: ['1000px', '490px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/note/note_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看便签详情
 */
Note.openNoteDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '便签详情',
            area: ['1000px', '490px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/note/note_update/' + Note.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除便签
 */
Note.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/note/delete", function (data) {
            Feng.success("删除成功!");
            Note.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("noteId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询便签列表
 */
Note.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    queryData['onlyOwn'] = $("#onlyOwn").is(":checked")?'1':'0';
    Note.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Note.initColumn();
    var table = new BSTable(Note.id, "/note/list", defaultColunms);
    table.setPaginationType("server");
    Note.table = table.init();
});
