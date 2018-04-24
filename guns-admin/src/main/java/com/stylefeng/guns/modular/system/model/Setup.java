package com.stylefeng.guns.modular.system.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 组织机构
 * </p>
 *
 * @author stylefeng123
 * @since 2018-04-24
 */
@TableName("sys_setup")
public class Setup extends Model<Setup> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 网站名称
     */
    @TableField("website_name")
    private String websiteName;
    /**
     * 网站英文简称
     */
    @TableField("website_code")
    private String websiteCode;
    /**
     * 网站地址
     */
    @TableField("website_url")
    private String websiteUrl;
    /**
     * LOGO
     */
    private String logo;
    /**
     * 顶端标题
     */
    private String toptitle;
    /**
     * 关键字
     */
    private String keyword;
    /**
     * 描述
     */
    private String describe;
    /**
     * 主办方
     */
    private String username;
    /**
     * 联系电话
     */
    private String tel;
    /**
     * 服务热线
     */
    private String hotline;
    /**
     * 地址
     */
    private String address;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 关于系统
     */
    private String about;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWebsiteName() {
        return websiteName;
    }

    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    public String getWebsiteCode() {
        return websiteCode;
    }

    public void setWebsiteCode(String websiteCode) {
        this.websiteCode = websiteCode;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getToptitle() {
        return toptitle;
    }

    public void setToptitle(String toptitle) {
        this.toptitle = toptitle;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Setup{" +
        "id=" + id +
        ", websiteName=" + websiteName +
        ", websiteCode=" + websiteCode +
        ", websiteUrl=" + websiteUrl +
        ", logo=" + logo +
        ", toptitle=" + toptitle +
        ", keyword=" + keyword +
        ", describe=" + describe +
        ", username=" + username +
        ", tel=" + tel +
        ", hotline=" + hotline +
        ", address=" + address +
        ", email=" + email +
        ", about=" + about +
        "}";
    }
}
