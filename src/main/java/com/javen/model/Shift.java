package com.javen.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.Date;

@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class Shift {
    private Integer sno;
    private String startDate;
    private String endDate;
    private String detail;
    private Integer dno;
    private Integer uno;
    private Integer maxNum;
    private Integer num;
    private String name;
    private String sex;
    private String birthday;
    private String phone;
    private String intro;
    private String title;

    public Integer getSno() {
        return sno;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getDetail() {
        return detail;
    }

    public Integer getDno() {
        return dno;
    }

    public Integer getUno() {
        return uno;
    }

    public Integer getMaxNum() {
        return maxNum;
    }

    public Integer getNum() {
        return num;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public String getBirthday() {
        return birthday;
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

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }

    public void setUno(Integer uno) {
        this.uno = uno;
    }

    public void setMaxNum(Integer maxNum) {
        this.maxNum = maxNum;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
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
}
