package com.javen.service;  

import com.javen.model.User;
  
  
public interface IUserService {
     User getUserByAccountInfo(Integer uno,Integer phone,String idcard);
     Integer getRoleByUno(Integer uno);
     User getUserByBirth(String birthday);
}