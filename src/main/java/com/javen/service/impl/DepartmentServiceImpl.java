package com.javen.service.impl;

import com.javen.dao.IDepartmentDao;
import com.javen.dao.IShiftDao;
import com.javen.model.Department;
import com.javen.service.IDepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;

@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {

    @Resource
    private IDepartmentDao departmentDao;
    public Department getDeparByDno(HashMap<String,Object> map){
        return this.departmentDao.selectByDno(map);
    }

    public void addDnoUno(HashMap<String,String> map){
         this.departmentDao.addDnoUno(map);
    }
}
