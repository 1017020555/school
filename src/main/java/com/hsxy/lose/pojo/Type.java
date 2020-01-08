package com.hsxy.lose.pojo;

public class Type {
    private Integer typeid;
    private String typename;

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Type() {
    }

    public Type(Integer typeid, String typename) {
        this.typeid = typeid;
        this.typename = typename;
    }

    public Type(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "Type{" +
                "typeid=" + typeid +
                ", typename='" + typename + '\'' +
                '}';
    }
}
