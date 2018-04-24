package com.controller;


import com.pojo.TbUser;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.LoginService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class LoginController {
    public final Logger logger = LogManager.getLogger(getClass());


//    @RequestMapping("/hello")
//    @ResponseBody
//    public String index(){
//        return "index.jsp";
//    }

    /**
     * 添加这个映射 这样输入 localhost:8080/login 就可以直接访问我们的登录页面
     *
     * @return 返回文件的路径
     */
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(){
        return "index";
    }


    @RequestMapping(value = "/hello",method = RequestMethod.GET)
    public ModelAndView test() {
        String message = "Welcome to Spring 4.0 !";
        return new ModelAndView("hello", "message", message);
    }

}
