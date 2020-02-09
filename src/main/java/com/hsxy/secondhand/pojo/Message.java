package com.hsxy.secondhand.pojo;

import com.hsxy.user.pojo.User;

import java.util.Date;

public class Message {
    private Integer id;

    private Integer userid;
    private User user;

    private String context;

    private Integer secondid;
    private Second second;

    private Date time;

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Integer getSecondid() {
        return secondid;
    }

    public void setSecondid(Integer secondid) {
        this.secondid = secondid;
    }

    public Second getSecond() {
        return second;
    }

    public void setSecond(Second second) {
        this.second = second;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Message() {
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", userid=" + userid +
                ", user=" + user +
                ", context='" + context + '\'' +
                ", secondid=" + secondid +
                ", second=" + second +
                ", time=" + time +
                '}';
    }
}
