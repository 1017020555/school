package com.hsxy.user.pojo;
public class User {
    private Integer id;
    private Integer studentNo;
    private String password;
    private String studentName;

    public User() {
    }
    public User(Integer id, Integer studentNo, String password, String studentName) {
        this.id = id;
        this.studentNo = studentNo;
        this.password = password;
        this.studentName = studentName;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(Integer studentNo) {
        this.studentNo = studentNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", studentNo=" + studentNo +
                ", password='" + password + '\'' +
                ", studentName='" + studentName + '\'' +
                '}';
    }
}
