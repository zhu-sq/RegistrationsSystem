package com.javen.service;

import com.javen.model.Registration;
import com.javen.model.Shift;

import java.util.*;

public interface IShiftService {
     LinkedList<Shift> getShiftByDate(HashMap<String,Object> map);
     LinkedList<Shift> getShiftByDnoUno(HashMap<String,Object> map);
     void addShift(List<Shift> list);
     void updateShift(Shift shift);
     Registration getRegByUno(Integer uno);
     Registration getRegByUnoSno(HashMap<String,Integer> map);
     Shift getShiftBySno(Integer uno);

}
