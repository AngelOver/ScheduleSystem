package com.stylefeng.guns.modular.system.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * <p>
 * 计划表
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
@TableName("plan")
public class Plan extends Model<Plan> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户id
     */
    private Integer userid;
    /**
     * 标题
     */
    private String title;
    /**
     * 备注
     */
    private String remark;
    /**
     * 地址
     */
    private String address;
    /**
     * 开始时间
     */
    private Date starttime;
    /**
     * 结束时间
     */
    private Date endtime;
    /**
     * 提醒时间
     */
    private Date remindtime;
    /**
     * 提醒类型(0：准时  1：准时 2 自定义）
     */
    private Integer remindtype;
    /**
     * 重要程度(A：重要 ，紧急   B：重要 ，不紧急  ）
     */
    private Integer importantstatus;
    /**
     * 是否全天(0：否  1：是）
     */
    @TableField("is_wholeday")
    private Integer isWholeday;
    /**
     * 是否重复(0：否  1：是）
     */
    @TableField("is_repeat")
    private Integer isRepeat;
    /**
     * 重复次数
     */
    private Integer repeatcount;
    /**
     * 是否展示进度(0：否  1：是）
     */
    @TableField("is_progress")
    private Integer isProgress;
    /**
     * 当前进度(当前重复次数)
     */
    private String nowprogress;
    /**
     * 创建时间
     */

    private Date createtime;
    /**
     * 更新时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Date getRemindtime() {
        return remindtime;
    }

    public void setRemindtime(Date remindtime) {
        this.remindtime = remindtime;
    }

    public Integer getRemindtype() {
        return remindtype;
    }

    public void setRemindtype(Integer remindtype) {
        this.remindtype = remindtype;
    }

    public Integer getImportantstatus() {
        return importantstatus;
    }

    public void setImportantstatus(Integer importantstatus) {
        this.importantstatus = importantstatus;
    }

    public Integer getIsWholeday() {
        return isWholeday;
    }

    public void setIsWholeday(Integer isWholeday) {
        this.isWholeday = isWholeday;
    }

    public Integer getIsRepeat() {
        return isRepeat;
    }

    public void setIsRepeat(Integer isRepeat) {
        this.isRepeat = isRepeat;
    }

    public Integer getRepeatcount() {
        return repeatcount;
    }

    public void setRepeatcount(Integer repeatcount) {
        this.repeatcount = repeatcount;
    }

    public Integer getIsProgress() {
        return isProgress;
    }

    public void setIsProgress(Integer isProgress) {
        this.isProgress = isProgress;
    }

    public String getNowprogress() {
        return nowprogress;
    }

    public void setNowprogress(String nowprogress) {
        this.nowprogress = nowprogress;
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
        return "Plan{" +
        "id=" + id +
        ", userid=" + userid +
        ", title=" + title +
        ", remark=" + remark +
        ", address=" + address +
        ", starttime=" + starttime +
        ", endtime=" + endtime +
        ", remindtime=" + remindtime +
        ", remindtype=" + remindtype +
        ", importantstatus=" + importantstatus +
        ", isWholeday=" + isWholeday +
        ", isRepeat=" + isRepeat +
        ", repeatcount=" + repeatcount +
        ", isProgress=" + isProgress +
        ", nowprogress=" + nowprogress +
        ", createtime=" + createtime +
        ", updatetime=" + updatetime +
        ", version=" + version +
        "}";
    }
    public void create() {
    	this.createtime =  new Date();
	}
    
    public void update() {
    	this.updatetime =  new Date();
	}
}
