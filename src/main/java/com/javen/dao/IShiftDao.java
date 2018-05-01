package com.javen.dao;

import com.javen.model.Shift;
import org.apache.ibatis.annotations.Param;

import java.util.*;

public interface IShiftDao {
     LinkedList<Shift> selectByDate(HashMap<String,Object> map);
     void addShift(List<Shift> list);
}