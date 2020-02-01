package com.hsxy.exam.pojo;

import java.util.Date;

public class Compition {
    private Integer id;
    private String title;
    private String context;
    private Integer count;
    private Date time;
    private Integer userid;

    @Override
    public String toString() {
        return "Compition{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", count=" + count +
                ", time=" + time +
                ", userid=" + userid +
                '}';
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

    public Compition(String title, String context, Integer count, Date time, Integer userid) {
        this.title = title;
        this.context = context;
        this.count = count;
        this.time = time;
        this.userid = userid;
    }
}
