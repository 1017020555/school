package com.hsxy.exam.pojo;

public class CompitionType {
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

    public CompitionType() {
    }

    @Override
    public String toString() {
        return "CompitionType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
