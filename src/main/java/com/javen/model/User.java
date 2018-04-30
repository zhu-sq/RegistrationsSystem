package com.javen.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class User {

    private Integer uno;

    private String name;

    private String pwd;

    private Integer birthday;

    private String sex;

    private String idcard;

    private String phone;

    private String intro;

    private String title;

    private Integer role;

    public Integer getUno() {
        return uno;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public Integer getBirthday() {
        return birthday;
    }

    public String getSex() {
        return sex;
    }

    public String getIdcard() {
        return idcard;
    }

    public String getPhone() {
        return phone;
    }

    public String getIntro() {
        return intro;
    }

    public String getTitle() {
        return title;
    }

    public Integer getRole() {
        return role;
    }

    public void setUno(Integer uno) {
        this.uno = uno;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setBirthday(Integer birthday) {
        this.birthday = birthday;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setRole(Integer role){
        this.role=role;
    }

    @Override
    public String toString() {
        return "User [uno=" + uno + ", name=" + name + ", pwd="
                + pwd + ", birthday=" + birthday + ", sex=" + sex
                + ", idcard=" + idcard + ", phone=" + phone
                + ", intro=" + intro+ ", title=" + title
                +", role=" + role+"]";
    }


}