package com.javen.controller;

import com.javen.model.User;
import com.javen.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
@RequestMapping("/reg")
public class RegisterController {
    private static Logger log= LoggerFactory.getLogger(RegisterController.class);
    @Resource
    private IUserService userService;

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView RegistPage(HttpServletRequest httpServletRequest){
        String role = null;
        if(httpServletRequest.getSession().getAttribute("role") !=null){
            role = httpServletRequest.getSession().getAttribute("role").toString();
        }
        if(role==null || !role.equals("1")){
            return new ModelAndView("regist");
        }
        log.debug("regist");
        System.out.println("regist");
        return new ModelAndView("regist");
    }


    /**
     * @MethodName : RegistOpt
     * @Description : 处理注册的函数，主要获取表单数据并判断数据是否合法
     *                1.数据不合法，返回错误信息
     *                2.合法，将表单数据封装到对象中并存入session
     * @param param :客户端传来的json数据，含有账号密码等信息
     * @return :返回是否正确
     */
    @RequestMapping(value = "/RegistOpt",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> RegistOpt(@RequestBody Map<String, String> param, HttpServletRequest httpServletRequest) {
        System.out.println("RegistOpt");


        Map<String,Object> resMap=new HashMap<String, Object>();

        //检查数据完整性
        if(param.get("name")==null || param.get("pwd")==null || param.get("phone")==null || param.get("idcard")==null){
            resMap.put("code","1");
            resMap.put("msg","数据不完整");
            return resMap;//返回给前端页面提示
        }

        String opt = param.get("opt");
        String role="";
        String sessionRole = "";
        User user = new User();
        if(httpServletRequest.getSession().getAttribute("role")!=null){//1管理员2医生3普通用户
            sessionRole = httpServletRequest.getSession().getAttribute("role").toString();
        }
        if(opt==null || !opt.equals("1")){
            role="3";
        }else if(sessionRole.equals("1")){
            role="1";
        }else{
            resMap.put("code","3");
            resMap.put("msg","不是管理员，无权限注册医生账号");
            return resMap;
        }


        synchronized(this){
            user.setName(param.get("name"));
            user.setPwd(param.get("pwd"));
            user.setPhone(param.get("phone"));
            user.setIdcard(param.get("idcard"));
            user.setBirthday(param.get("birthday"));
            user.setSex(param.get("sex"));
            user.setIntro(param.get("intro"));
            user.setRole(Integer.valueOf(role));

            userService.addUser(user);

            Map<String,String> queryMap=new HashMap<String, String>();
            queryMap.put("idcard","441702199606031720");
            queryMap.put("rno",role);

            userService.defineRole(queryMap);
        }

        //添加defineRole

        resMap.put("code","0");
        resMap.put("msg","操作成功");
        return resMap;



    }
}
