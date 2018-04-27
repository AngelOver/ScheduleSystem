/**
 * 初始化便签详情对话框
 */
var NoteInfoDlg = {
    noteInfoData : {}
};

/**
 * 清除数据
 */
NoteInfoDlg.clearData = function() {
    this.noteInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
NoteInfoDlg.set = function(key, val) {
    this.noteInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
NoteInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
NoteInfoDlg.close = function() {
    parent.layer.close(window.parent.Note.layerIndex);
}



/**
 * 收集数据
 */
NoteInfoDlg.collectData = function() {
	 this.noticeInfoData['content'] = NoteInfoDlg.editor.txt.html();
    this
    .set('id')
    .set('pid')
    .set('type')
    .set('userid')
    .set('title')
    .set('text')
    .set('isShow')
    .set('isTop')
    .set('isWait')
    .set('waitStatus')
    .set('createtime')
    .set('updatetime')
    .set('version');
}

/**
 * 提交添加
 */
NoteInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/note/add", function(data){
        Feng.success("添加成功!");
        window.parent.Note.table.refresh();
        NoteInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.noteInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
NoteInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/note/update", function(data){
        Feng.success("修改成功!");
        window.parent.Note.table.refresh();
        NoteInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.noteInfoData);
    ajax.start();
}

//Checkbox绑定点击事件
function initCheckboxClick(){
/*	console.log(1);
    $("#waitStatus").on('click', function () {
    	console.log(1);
    	if( $("#waitStatus").is(":checked")){
    		if( !$("#isWait").is(":checked")){
        		$("#isWait").attr("checked",true);
        	}
    	}
    });*/
}
/*layui.use('form');

form.on('checkbox(filter)', function(data){
	  console.log(data.elem); //得到checkbox原始DOM对象
	  console.log(data.elem.checked); //是否被选中，true或者false
	  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
	  console.log(data.othis); //得到美化后的DOM对象
	}); */



layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
		$("#waitStatus").next().hide();
	  form.on('checkbox(isWait)', function(data){
		  if(!data.elem.checked){
			  $("#waitStatus").next().hide();
			  if($("#waitStatus").is(":checked")){
				  console.log("完成选中");
				  //刷新方式 
				/*  $("#waitStatus").attr("checked",false);
				  form.render();
				  $("#waitStatus").hide();*/
				  //点击方式
				  $("#waitStatus").next().click();
			  }
		  }else{
			  $("#waitStatus").next().show();
		  }
	  });
	});
$(function() {
	initCheckboxClick();
/*	console.log("ok")
	layui.use('form', function(){
		console.log("ok")
		  var form = layui.form;
		  
		  //各种基于事件的操作，下面会有进一步介绍
		});*/
	
    Feng.initValidator("noteInfoForm", NoteInfoDlg.validateFields);

    //初始化编辑器
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();
    editor.txt.html($("#contentVal").val());
    NoteInfoDlg.editor = editor;

});
