package com.javen.model;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include= JsonSerialize.Inclusion.NON_NULL)
public class Department {
    private Integer dno;
    private String name;
    private String detail;

    public Integer getDno() {
        return dno;
    }

    public String getName() {
        return name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDno(Integer dno) {
        this.dno = dno;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
