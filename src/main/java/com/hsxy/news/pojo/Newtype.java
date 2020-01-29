package com.hsxy.news.pojo;

public class Newtype {
    private Integer id;
    private String name;

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

    public Newtype() {
    }

    public Newtype(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Newtype(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Newtype{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
