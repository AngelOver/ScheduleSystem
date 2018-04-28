package com.stylefeng.guns.modular.system.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.util.ToolUtil;

import java.io.Serializable;

/**
 * <p>
 * 计划表
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-28
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
     * 计划时间
     */
    private String thedate;
    /**
     * 时间范围
     */
    private String range;
    
    /**
     * 时间长度
     */
    private String rangelength;
    
    /**
     * 时间段(0 自定义 1 10分钟)
     */
    private Integer rangetype;
    /**
     * 开始时间(存储)
     */
    private Date starttime;
    /**
     * 结束时间(存储)
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
     * 重复类型(0：不重复  1：自定义 2重复一次）
     */
    @TableField("repeat_type")
    private Integer repeatType;
    /**
     * 重复间隔
     */
    @TableField("repeat_space")
    private Integer repeatSpace;
    
    
    /**
     * 重复次数
     */
    @TableField("repeat_count")
    private Integer repeatCount;
    /**
     * 是否展示进度(0：否  1：是）
     */
    @TableField("is_progress")
    private Integer isProgress;
    
    /**
     * 进度数量(0：否  1：是）
     */
    @TableField("progress_count")
    private Integer progressCount;
    
    /**
     * 进度单位(0：否  1：是）
     */
    @TableField("progress_unit")
    private String progressUnit;
    
      
    
    
    /**
     * 完成情况(0 未完成 1 完成)
     */
    @TableField("wait_status")
    private Integer waitStatus;
    /**
     * 当前进度(当前重复次数)
     */
    private Integer nowprogress;
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

    public String getThedate() {
        return thedate;
    }

    public void setThedate(String thedate) {
        this.thedate = thedate;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    public Integer getRangetype() {
        return rangetype;
    }

    public void setRangetype(Integer rangetype) {
        this.rangetype = rangetype;
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

    public String getRangelength() {
		return rangelength;
	}

	public void setRangelength(String rangelength) {
		this.rangelength = rangelength;
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

    public Integer getRepeatCount() {
        return repeatCount;
    }

    public void setRepeatCount(Integer repeatCount) {
        this.repeatCount = repeatCount;
    }

    public Integer getIsProgress() {
        return isProgress;
    }

    public void setIsProgress(Integer isProgress) {
        this.isProgress = isProgress;
    }

    public Integer getWaitStatus() {
        return waitStatus;
    }

    public void setWaitStatus(Integer waitStatus) {
        this.waitStatus = waitStatus;
    }

    public Integer getNowprogress() {
        return nowprogress;
    }

    public void setNowprogress(Integer nowprogress) {
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
    

    public Integer getRepeatType() {
		return repeatType;
	}

	public void setRepeatType(Integer repeatType) {
		this.repeatType = repeatType;
	}

	public Integer getRepeatSpace() {
		return repeatSpace;
	}

	public void setRepeatSpace(Integer repeatSpace) {
		this.repeatSpace = repeatSpace;
	}

	public Integer getProgressCount() {
		return progressCount;
	}

	public void setProgressCount(Integer progressCount) {
		this.progressCount = progressCount;
	}

	public String getProgressUnit() {
		return progressUnit;
	}

	public void setProgressUnit(String progressUnit) {
		this.progressUnit = progressUnit;
	}

    public void create() {
    	this.createtime =  new Date();
    	this.userid=ShiroKit.getUser().getId();
	}
    
    public void update() {
    	this.updatetime =  new Date();
	}
	
	@Override
    public String toString() {
        return "Plan{" +
        "id=" + id +
        ", userid=" + userid +
        ", title=" + title +
        ", remark=" + remark +
        ", address=" + address +
        ", thedate=" + thedate +
        ", range=" + range +
        ", rangetype=" + rangetype +
        ", starttime=" + starttime +
        ", endtime=" + endtime +
        ", remindtime=" + remindtime +
        ", remindtype=" + remindtype +
        ", importantstatus=" + importantstatus +
        ", isWholeday=" + isWholeday +
        ", isRepeat=" + isRepeat +
        ", repeatcount=" + repeatCount +
        ", isProgress=" + isProgress +
        ", waitStatus=" + waitStatus +
        ", nowprogress=" + nowprogress +
        ", createtime=" + createtime +
        ", updatetime=" + updatetime +
        ", version=" + version +
        "}";
    }
}
