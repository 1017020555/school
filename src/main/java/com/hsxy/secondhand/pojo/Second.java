package com.hsxy.secondhand.pojo;
import com.hsxy.user.pojo.User;
import java.util.Date;

public class Second {
    private Integer id;
    private String name;

    private Integer categoryid;
    private Category category;

    private String context;

    private Integer userid;
    private User user;

    private Date time;
    private String price;
    private String photo;

    @Override
    public String toString() {
        return "Second{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", categoryid=" + categoryid +
                ", category=" + category +
                ", context='" + context + '\'' +
                ", userid=" + userid +
                ", user=" + user +
                ", time=" + time +
                ", price='" + price + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }

    public Second() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
