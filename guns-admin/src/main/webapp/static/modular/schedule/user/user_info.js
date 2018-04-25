/**
 * 初始化普通用户详情对话框
 */
var UserInfoDlg = {
    userInfoData : {}
};

/**
 * 清除数据
 */
UserInfoDlg.clearData = function() {
    this.userInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
UserInfoDlg.set = function(key, val) {
    this.userInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
UserInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
UserInfoDlg.close = function() {
    parent.layer.close(window.parent.User.layerIndex);
}

/**
 * 收集数据
 */
UserInfoDlg.collectData = function() {
    this
    .set('id')
    .set('avatar')
    .set('account')
    .set('password')
    .set('salt')
    .set('name')
    .set('birthday')
    .set('sex')
    .set('email')
    .set('phone')
    .set('roleid')
    .set('deptid')
    .set('status')
    .set('createtime')
    .set('version');
}

/**
 * 提交添加
 */
UserInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/scheduleUser/add", function(data){
        Feng.success("添加成功!");
        window.parent.User.table.refresh();
        UserInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.userInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
UserInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/scheduleUser/update", function(data){
        Feng.success("修改成功!");
        window.parent.User.table.refresh();
        UserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.userInfoData);
    ajax.start();
}

$(function() {

});
