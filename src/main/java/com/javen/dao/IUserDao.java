package com.javen.dao;

import com.javen.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;


public interface IUserDao {
    User selectByAccountInfo(@Param("uno")Integer uno, @Param("phone")Integer phone, @Param("idcard")String idcard);
    Integer selectRoleByUno(Integer uno);
    User getUserByBirth(String birthday);
    void addUser(User user);
    void defineRole(Map<String,String> queryMap);
}