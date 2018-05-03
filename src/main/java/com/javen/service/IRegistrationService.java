package com.javen.service;

import com.javen.model.User;
import org.springframework.dao.DataIntegrityViolationException;

import java.util.HashMap;
import java.util.List;

public interface IRegistrationService {
    Boolean addRestration(HashMap<String,Integer> map);
    Boolean delRestration(HashMap<String,Integer> map);
    List<User> getRegUser(Integer sno);
}
