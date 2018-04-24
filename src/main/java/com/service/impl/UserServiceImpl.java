package com.service.impl;

import com.dao.TbUserMapper;
import com.pojo.TbUser;
import com.service.IUserService;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.xml.ws.ServiceMode;

@Service("userService")

public class UserServiceImpl implements IUserService{
    @Resource
    private TbUserMapper userDao;
    public TbUser getUserById(int userId) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userId);
    }
}
