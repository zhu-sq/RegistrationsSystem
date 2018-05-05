package com.javen.service;

import com.javen.model.Department;

import java.util.HashMap;

public interface IDepartmentService {
    Department getDeparByDno(HashMap<String,Object> map);
}
