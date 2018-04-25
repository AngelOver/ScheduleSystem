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

$(function() {

});
