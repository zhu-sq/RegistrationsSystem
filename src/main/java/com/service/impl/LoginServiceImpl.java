package com.service.impl;

import com.dao.TbUserMapper;
import com.pojo.TbUser;
import com.pojo.TbUserExample;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class LoginServiceImpl {

    @Autowired
    TbUserMapper tbUserMapper;


    public List<TbUser> findUserByName(String tmName, String tmPass) throws Exception {
        //添加查询条件
        TbUserExample example = new TbUserExample();
        TbUserExample.Criteria criteria = example.or();
        criteria.andNameEqualTo(tmName);
        criteria.andPasswordEqualTo(tmPass);
        return tbUserMapper.selectByExample(example);
    }
}
