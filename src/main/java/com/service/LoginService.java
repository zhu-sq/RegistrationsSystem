package com.service;

import com.pojo.TbUser;

import java.util.List;

public interface LoginService {
    /**
     * 根据用户名 密码查询数据库
     *
     * @param tmName 用户名
     * @param tmPass 密码
     * @throws Exception
     */
    List<TbUser> findUserByName(String tmName, String tmPass) throws Exception;
}
