package com.javen.service.impl;


import com.javen.dao.IShiftDao;
import com.javen.dao.IUserDao;
import com.javen.model.Shift;
import com.javen.service.IShiftService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@Service("shiftService")
public class ShiftServiceImpl implements IShiftService{
    @Resource
    private IShiftDao shiftDao;

    public LinkedList<Shift> getShiftByDate(HashMap<String,Object> map){
        return this.shiftDao.selectByDate(map);
    }
    public LinkedList<Shift> getShiftByDnoUno(HashMap<String,Object> map){
        return this.shiftDao.getShiftByDnoUno(map);
    }

    public void addShift(List<Shift> list){
        this.shiftDao.addShift(list);
    }

    public void updateShift(Shift shift){
        this.shiftDao.updateShift(shift);
    }
}
