package com.javen.controller;

import com.javen.model.User;
import com.javen.service.IUserService;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    private static Logger log= LoggerFactory.getLogger(LoginController.class);
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
        log.info("login11");
        log.debug("login22s");
        Map<String,Object> resMap=new HashMap<String, Object>();

        if(param.get("account")==null || param.get("account").equals("")
                || param.get("pwd")==null || param.get("pwd").equals("")){
            resMap.put("code",1);
            resMap.put("msg","账号或密码未填写");
            log.info("账号或密码未填写");
            return resMap;
        }

        /**
         * 这里的account可能是手机号、账号、身份证号，接下来根据他们的长度来区分
         * 账号：1-10位
         * 手机号：11位 （中国大陆的手机号为10位，香港的为8位，在此假定只能用中国大陆的手机来登录
         * 身份证：中国的身份证位数为15或18位
         */

        Integer uno=0,phone=0;
        String idcard="",pwd="";

        //小于11位，说明是账号
        if(param.get("account").length()<11){
            uno=Integer.parseInt(param.get("account"));
        }else if(param.get("account").length()==11){
            phone=Integer.parseInt(param.get("account"));
        }else if(param.get("account").length()==15 || param.get("account").length()==18){
            idcard=param.get("account");
        }else{
            resMap.put("code",2);
            resMap.put("msg","账号格式不正确");
            log.info("账号格式不正确");
            return resMap;
        }

        User user =this.userService.getUserByAccountInfo(uno,phone,idcard);
        if(user!=null){
            log.info(user.toString());
        }

        if(user == null || !user.getPwd().equals(param.get("pwd"))){
            resMap.put("code",3);
            resMap.put("msg","账户密码不正确");
            log.info("账号密码不正确");
            return resMap;
        }

        Integer role = userService.getRoleByUno(user.getUno());
        user.setRole(role);
        resMap.put("code",0);
        resMap.put("msg","登录成功");
        resMap.put("user",user);
        httpServletRequest.getSession().setAttribute("isLogin",1);
        httpServletRequest.getSession().setAttribute("name",user.getName());
        httpServletRequest.getSession().setAttribute("uno",user.getUno());
        httpServletRequest.getSession().setAttribute("role",role);
        return resMap;
    }

    /**
     * @MethodName : Logout
     * @Description : 退出当前登录的账号
     * @return :返回是否正确
     */
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> Logout(HttpServletRequest httpServletRequest) {
        System.out.println("Logout");

        Map<String,Object> resMap=new HashMap<String, Object>();

        Enumeration em = httpServletRequest.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            httpServletRequest.getSession().removeAttribute(em.nextElement().toString());
        }

        resMap.put("code",0);
        resMap.put("msg","注销登录成功");
        return resMap;
    }
}
