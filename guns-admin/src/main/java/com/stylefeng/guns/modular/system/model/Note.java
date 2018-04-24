package com.stylefeng.guns.modular.system.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 便签表
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
@TableName("note")
public class Note extends Model<Note> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 父级id(备忘录归档)
     */
    private Integer pid;
    /**
     * 便签类型(0 便签 1 文件夹)
     */
    private Integer type;
    /**
     * 用户id
     */
    private Integer userid;
    /**
     * 标题(标题自动生成 前10个字)
     */
    private String title;
    /**
     * 便签
     */
    private String text;
    /**
     * 是否展示(0：否  1：是）
     */
    @TableField("is_show")
    private Integer isShow;
    /**
     * 是否置顶(0：否  1：是）
     */
    @TableField("is_top")
    private Integer isTop;
    /**
     * 是否待办(0：否  1：是）
     */
    @TableField("is_wait")
    private Integer isWait;
    /**
     * 代办状态(0：待办  1：完成)
     */
    @TableField("wait_status")
    private Integer waitStatus;
    /**
     * 创建时间
     */
    private Date createtime;
    /**
     * 更新时间
     */
    private Date updatetime;
    /**
     * 保留字段
     */
    private Integer version;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getIsWait() {
        return isWait;
    }

    public void setIsWait(Integer isWait) {
        this.isWait = isWait;
    }

    public Integer getWaitStatus() {
        return waitStatus;
    }

    public void setWaitStatus(Integer waitStatus) {
        this.waitStatus = waitStatus;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Note{" +
        "id=" + id +
        ", pid=" + pid +
        ", type=" + type +
        ", userid=" + userid +
        ", title=" + title +
        ", text=" + text +
        ", isShow=" + isShow +
        ", isTop=" + isTop +
        ", isWait=" + isWait +
        ", waitStatus=" + waitStatus +
        ", createtime=" + createtime +
        ", updatetime=" + updatetime +
        ", version=" + version +
        "}";
    }
}
