package com.javen.service;  

import com.javen.model.User;
  
  
public interface IUserService {
    public User getUserByAccountInfo(Integer uno,Integer phone,String idcard);
    public Integer getRoleByUno(Integer uno);
}