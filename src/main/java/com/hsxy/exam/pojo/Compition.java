package com.hsxy.exam.pojo;

import java.util.Date;

public class Compition {
    private Integer id;
    private String title;
    private String context;
    private Integer count;
    private Date time;
    private Integer userid;

    private Integer typeid;
    private CompitionType compitionType;

    @Override
    public String toString() {
        return "Compition{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", count=" + count +
                ", time=" + time +
                ", userid=" + userid +
                ", typeid=" + typeid +
                ", compitionType=" + compitionType +
                '}';
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public CompitionType getCompitionType() {
        return compitionType;
    }

    public void setCompitionType(CompitionType compitionType) {
        this.compitionType = compitionType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Compition() {
    }

    public Compition(String title, String context, Integer count, Date time, Integer userid, Integer typeid, CompitionType compitionType) {
        this.title = title;
        this.context = context;
        this.count = count;
        this.time = time;
        this.userid = userid;
        this.typeid = typeid;
        this.compitionType = compitionType;
    }
}
