package com.javen.dao;

import com.javen.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;


public interface IUserDao {
    User selectByAccountInfo(Map<String,String> queryMap);
    Integer selectRoleByUno(Integer uno);
    User getUserByBirth(String birthday);
    User selectUserByUno(Integer uno);
    void addUser(User user);
    void defineRole(Map<String,String> queryMap);
    void updateUser(User user);
}