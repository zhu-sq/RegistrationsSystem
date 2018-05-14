package com.javen.controller;

import com.javen.model.User;
import com.javen.service.IDepartmentService;
import com.javen.service.IShiftService;
import com.javen.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController{
    private static Logger log= LoggerFactory.getLogger(ShiftController.class);
    @Resource
    private IUserService userService;

    /**
     * @MethodName : updateUser
     * @Description : 修改用户个人信息
     *                1.数据不合法，返回错误信息
     *                2.合法，将表单数据更新到数据库中并存入session
     * @param param :客户端传来的json数据，含有账号密码等信息
     * @return :返回是否正确
     */
    @RequestMapping(value = "/user/updateUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateUser(@RequestBody Map<String, String> param, HttpServletRequest httpServletRequest){
        log.info("-------------UpdateUser-------");


        Map<String,Object> resMap=new HashMap<String, Object>();

        User user = new User();

        if(httpServletRequest.getSession().getAttribute("uno")==null){
            resMap.put("code",1);//1缺少用户编号
            resMap.put("msg","请登录");
            return  resMap;
        }
        log.info(param.get("phone"));
        if(param.get("phone")!=null && !param.get("phone").equals("") && param.get("phone").length()!=11){
            resMap.put("code",2);//输入信息不合法
            resMap.put("msg","输入的手机号不合法");
            return resMap;
        }

        user.setUno(Integer.valueOf(httpServletRequest.getSession().getAttribute("uno").toString()));
        user.setName(param.get("name"));
        user.setPwd(param.get("pwd"));
        user.setBirthday(param.get("birthday"));
        user.setPhone(param.get("phone"));
        user.setIntro(param.get("intro"));
//        if(httpServletRequest.getSession().getAttribute("role")=="2" &&
//                param.get("title")!=null && !param.get("name").equals(null)){
//            user.setTitle(param.get("title"));
//        }
        userService.updateUser(user);
        resMap.put("code",0);
        resMap.put("msg","修改信息成功");
        return resMap;
    }
}