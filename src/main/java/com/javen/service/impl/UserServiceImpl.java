package com.javen.service.impl;
import javax.annotation.Resource;  
  



import org.springframework.stereotype.Service;  

import com.javen.dao.IUserDao;
import com.javen.model.User;
import com.javen.service.IUserService;
  
  
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

    public Integer getRoleByUno(Integer uno){
        return this.userDao.selectRoleByUno(uno);
    }
}  
