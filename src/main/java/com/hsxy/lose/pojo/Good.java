package com.hsxy.lose.pojo;

import com.hsxy.user.pojo.User;

import java.util.Date;

public class Good {
    private Integer goodid;
    private String goodname;
    private Type type;
    private Integer typeid;

    private User user;
    private Integer userid;

    private String goodexplain;
    private Date time;
    private String place;
    private String photo;


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

    public String getGoodexplain() {
        return goodexplain;
    }

    public void setGoodexplain(String goodexplain) {
        this.goodexplain = goodexplain;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

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

    public Good() {
    }


    @Override
    public String toString() {
        return "Good{" +
                "goodid=" + goodid +
                ", goodname='" + goodname + '\'' +
                ", type=" + type +
                ", typeid=" + typeid +
                ", user=" + user +
                ", userid=" + userid +
                ", goodexplain='" + goodexplain + '\'' +
                ", time=" + time +
                ", place='" + place + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
}
