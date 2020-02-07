package com.hsxy.lose.pojo;
import com.hsxy.user.pojo.User;
import java.util.Date;
public class Apply {
    private Integer applyid;
    private Date applytime;
    private String applyexplain;

    private User user;
    private Integer userid;

    private String picture;
    private String place;
    private String name;

    private Integer typeid;
    private Type type;


    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getApplyid() {
        return applyid;
    }

    public void setApplyid(Integer applyid) {
        this.applyid = applyid;
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public String getApplyexplain() {
        return applyexplain;
    }

    public void setApplyexplain(String applyexplain) {
        this.applyexplain = applyexplain;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Apply() {
    }

    @Override
    public String toString() {
        return "Apply{" +
                "applyid=" + applyid +
                ", applytime=" + applytime +
                ", applyexplain='" + applyexplain + '\'' +
                ", user=" + user +
                ", userid=" + userid +
                ", picture='" + picture + '\'' +
                ", place='" + place + '\'' +
                ", name='" + name + '\'' +
                ", typeid=" + typeid +
                ", type=" + type +
                '}';
    }
}
