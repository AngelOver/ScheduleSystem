/**
 * 初始化组织机构详情对话框
 */
var SetupInfoDlg = {
    setupInfoData : {}
};

/**
 * 清除数据
 */
SetupInfoDlg.clearData = function() {
    this.setupInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
SetupInfoDlg.set = function(key, val) {
    this.setupInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
SetupInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
SetupInfoDlg.close = function() {
    parent.layer.close(window.parent.Setup.layerIndex);
}

/**
 * 收集数据
 */
SetupInfoDlg.collectData = function() {
    this
    .set('id')
    .set('websiteName')
    .set('websiteCode')
    .set('websiteUrl')
    .set('logo')
    .set('toptitle')
    .set('keyword')
    .set('describe')
    .set('username')
    .set('tel')
    .set('hotline')
    .set('address')
    .set('email')
    .set('about');
}

/**
 * 提交添加
 */
SetupInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/setup/add", function(data){
        Feng.success("添加成功!");
        window.parent.Setup.table.refresh();
        SetupInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.setupInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
SetupInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/setup/update", function(data){
        Feng.success("修改成功!");
        window.parent.Setup.table.refresh();
        SetupInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.setupInfoData);
    ajax.start();
}

$(function() {

});
