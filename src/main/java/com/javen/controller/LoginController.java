package com.javen.controller;

import com.javen.model.User;
import com.javen.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    private static Logger log= LoggerFactory.getLogger(UserController.class);
    @Resource
    private IUserService userService;
    
    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView LoginPage(){
        log.debug("login");
        System.out.println("login");
        return new ModelAndView("login");
    }


    /**
     * @MethodName : LoginOpt
     * @Description : 处理登录的函数，主要判断用户名密码是否正确
     *                1.账户密码不正确，返回错误信息
     *                2.正确，在session处标记此连接的用户已登录
     * @param param :客户端传来的json数据，含有账号密码等信息
     * @return :返回是否正确
     */

    @RequestMapping(value = "/loginOpt",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> LoginOpt(@RequestBody Map<String, String> param, HttpServletRequest httpServletRequest) {
        System.out.println("loginOpt");
        System.out.println(param.get("account")+param.get("userPwd"));
        Map<String,Object> resMap=new HashMap<String, Object>();

        User user = this.userService.getUserByName(param.get("account"));
        if(user!=null){
            log.info(user.toString());
        }
        if(user == null || !user.getPassword().equals(param.get("userPwd"))){
            resMap.put("code",1);
            resMap.put("msg","账户密码不正确");
            log.info("账号密码不正确");
            return resMap;
        }

        resMap.put("code",0);
        resMap.put("msg","登录成功");
        httpServletRequest.getSession().setAttribute("login",1);
        return resMap;
    }
}
