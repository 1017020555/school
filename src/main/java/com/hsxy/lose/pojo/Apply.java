package com.hsxy.lose.pojo;
import com.hsxy.user.pojo.User;
import java.util.Date;
public class Apply {
    private Integer applyid;
    private Date applytime;
    private String applyexplain;
    private String applystate;

    private Good good;

    private User user;

    private String picture;


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

    public String getApplystate() {
        return applystate;
    }

    public void setApplystate(String applystate) {
        this.applystate = applystate;
    }

    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Apply() {
    }

    public Apply(Date applytime, String applyexplain, String applystate, Good good, User user, String picture) {
        this.applytime = applytime;
        this.applyexplain = applyexplain;
        this.applystate = applystate;
        this.good = good;
        this.user = user;
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "Apply{" +
                "applyid=" + applyid +
                ", applytime=" + applytime +
                ", applyexplain='" + applyexplain + '\'' +
                ", applystate='" + applystate + '\'' +
                ", good=" + good +
                ", user=" + user +
                ", picture='" + picture + '\'' +
                '}';
    }
}
