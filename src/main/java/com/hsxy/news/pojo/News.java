package com.hsxy.news.pojo;

import com.hsxy.user.pojo.User;

import java.util.Date;

public class News {
    private Integer id;
    private String title;
    private String context;
    private Date time;

    private User user;
    private Integer userid;

    private Integer state;
    private Integer newstypeid;
    private Newtype newtype;

    private String file;

    private String path;

    public News() {
    }

    public News(String title, String context, Date time, User user, Integer userid, Integer state, Integer newstypeid, Newtype newtype, String file, String path) {
        this.title = title;
        this.context = context;
        this.time = time;
        this.user = user;
        this.userid = userid;
        this.state = state;
        this.newstypeid = newstypeid;
        this.newtype = newtype;
        this.file = file;
        this.path = path;
    }

    public News(Integer id, String title, String context, Date time, User user, Integer userid, Integer state, Integer newstypeid, Newtype newtype, String file, String path) {
        this.id = id;
        this.title = title;
        this.context = context;
        this.time = time;
        this.user = user;
        this.userid = userid;
        this.state = state;
        this.newstypeid = newstypeid;
        this.newtype = newtype;
        this.file = file;
        this.path = path;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", time=" + time +
                ", user=" + user +
                ", userid=" + userid +
                ", state=" + state +
                ", newstypeid=" + newstypeid +
                ", newtype=" + newtype +
                ", file='" + file + '\'' +
                '}';
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getNewstypeid() {
        return newstypeid;
    }

    public void setNewstypeid(Integer newstypeid) {
        this.newstypeid = newstypeid;
    }

    public Newtype getNewtype() {
        return newtype;
    }

    public void setNewtype(Newtype newtype) {
        this.newtype = newtype;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
}
