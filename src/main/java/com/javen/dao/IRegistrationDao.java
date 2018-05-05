package com.javen.dao;


import com.javen.model.User;

import java.util.HashMap;
import java.util.List;

public interface IRegistrationDao {
   void addRestration(HashMap<String,Integer> map);

   HashMap<String,Integer> getRegNum(Integer sno);

   void updateRegNum(HashMap<String,Integer> map);

   void delRestration(HashMap<String,Integer> map);

   List<User> getRegUser(Integer sno);



}
