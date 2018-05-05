package com.javen.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("roleConfig")
public class RoleConfig {

    @Value("${role_admin}")
    private String admin;

    @Value("${role_doctor}")
    private String doctor;

    @Value("${role_user}")
    private String user;

//    public RoleConfig(String admin,String doctor,String user){
//        this.admin=admin;
//        this.doctor=doctor;
//        this.user=user;
//    }

    public String getAdmin() {
        return admin;
    }

    public String getDoctor() {
        return doctor;
    }

    public String getUser() {
        return user;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
