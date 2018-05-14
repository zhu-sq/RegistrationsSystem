package com.javen.service.impl;
import javax.annotation.Resource;  
  



import org.springframework.stereotype.Service;  

import com.javen.dao.IUserDao;
import com.javen.model.User;
import com.javen.service.IUserService;

import java.util.Map;


@Service("userService")  
public class UserServiceImpl implements IUserService {  
    @Resource  
    private IUserDao userDao;  
    
////    public User getUserById(int userId) {
////        // TODO Auto-generated method stub
////        return this.userDao.selectByPrimaryKey(userId);
////    }
//
//  /  public User getUserByName(String name){
//        return this.userDao.selectByName(name);
//    }
//

    public User getUserByAccountInfo(Integer uno,Integer phone,String idcard){
        return this.userDao.selectByAccountInfo(uno,phone,idcard);
    }

    public User getUserByUno(Integer uno){
        return this.userDao.selectUserByUno(uno);
    }

    public Integer getRoleByUno(Integer uno){
        return this.userDao.selectRoleByUno(uno);
    }

    public User getUserByBirth(String birth){
        return this.userDao.getUserByBirth(birth);
    }

    public void addUser(User user){
        this.userDao.addUser(user);
    }

    public void defineRole(Map<String,String> queryMap){
        this.userDao.defineRole(queryMap);
    }

    public void updateUser(User user){this.userDao.updateUser(user);}
}  
