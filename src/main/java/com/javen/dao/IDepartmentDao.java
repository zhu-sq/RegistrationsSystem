package com.javen.dao;

import com.javen.model.Department;

import java.util.HashMap;
import java.util.List;

public interface IDepartmentDao {
    Department selectByDno(HashMap<String,Object> map);
}
