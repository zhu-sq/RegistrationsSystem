package com.javen.service.impl;

import com.javen.dao.IRegistrationDao;
import com.javen.model.Shift;
import com.javen.model.User;
import com.javen.service.IRegistrationService;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("registrationService")
public class IRegistrationServiceImpl implements IRegistrationService {
    @Resource
    private IRegistrationDao registrationDao;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class,isolation = Isolation.SERIALIZABLE)
    public Boolean addRestration(HashMap<String,Integer> map) {

        //查询当前预约是否还有位置
        HashMap<String,Integer> hashMap= this.registrationDao.getRegNum(map.get("sno"));

        if(hashMap.get("num")>=hashMap.get("max_num")){
            return false;
        }

        //往预约表(registration)添加预约信息（sno，uno）
        this.registrationDao.addRestration(map);

        hashMap.put("num",hashMap.get("num")+1);
        hashMap.put("sno",map.get("sno"));

        //更新排班表里面的已预约数量
        registrationDao.updateRegNum(hashMap);
        return true;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class,isolation = Isolation.SERIALIZABLE)
    public Boolean delRestration(HashMap<String,Integer> map){

        //查询当前预约号的个数
        HashMap<String,Integer> hashMap= this.registrationDao.getRegNum(map.get("sno"));

        //往删除预约表的信息（sno，uno）
        this.registrationDao.delRestration(map);

        hashMap.put("num",hashMap.get("num")-1);
        hashMap.put("sno",map.get("sno"));

        //更新排班表里面的已预约数量
        registrationDao.updateRegNum(hashMap);
        return true;
    }

    public List<User> getRegUser(Integer sno){
        return this.registrationDao.getRegUser(sno);
    }



}
