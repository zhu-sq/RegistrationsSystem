package com.javen.dao;

import com.javen.model.Registration;
import com.javen.model.Shift;
import org.apache.ibatis.annotations.Param;

import java.util.*;

public interface IShiftDao {
     LinkedList<Shift> selectByDate(HashMap<String,Object> map);
     LinkedList<Shift> getShiftByDnoUno(HashMap<String,Object> map);
     void addShift(List<Shift> list);
     void updateShift(Shift shift);
     Registration selectRegByUno(Integer uno);
     Shift selectShiftBySno(Integer sno);
}
