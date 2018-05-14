package com.javen.service;  

import com.javen.model.User;

import java.util.Map;


public interface IUserService {
     User getUserByAccountInfo(Integer uno,Integer phone,String idcard);
     Integer getRoleByUno(Integer uno);
     User getUserByBirth(String birthday);
     User getUserByUno(Integer uno);
     void addUser(User user);
     void defineRole(Map<String,String> queryMap);
     void updateUser(User user);
}