package com.javen.controller;

import com.javen.model.User;
import com.javen.service.IDepartmentService;
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
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/reg")
public class RegisterController {
    private static Logger log= LoggerFactory.getLogger(RegisterController.class);
    @Resource
    private IUserService userService;
 @Resource
    private IDepartmentService departmentService;

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView RegistPage(HttpServletRequest httpServletRequest){
        String role = null;

        Enumeration em = httpServletRequest.getSession().getAttributeNames();
        log.debug("em lsit---");
        while(em.hasMoreElements()){
            String str = em.nextElement().toString();
            log.info(""+str + " " + httpServletRequest.getSession().getAttribute(str));
        }
        if(httpServletRequest.getSession().getAttribute("role")!=null){
            role = httpServletRequest.getSession().getAttribute("role").toString();
        }
        log.info("getRegPag----"+role);
        if(role==null || !role.equals("1")){
            return new ModelAndView("regist");
        }
        log.info("doctor regist");
        return new ModelAndView("regist","role",1);
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

        if(!(param.get("sex").equals("男") || param.get("sex").equals("女"))){
            resMap.put("code","3");
            resMap.put("msg","性别必须为男或者女");
            return resMap;
        }

        if(param.get("phone").length()!=11){
            resMap.put("code","3");
            resMap.put("msg","非法手机号");
            return resMap;
        }

        if(!(param.get("idcard").length()==15 || param.get("idcard").length()==18)){
            resMap.put("code","3");
            resMap.put("msg","非法身份证号");
            return resMap;
        }

        HashMap<String,String> queryMap = new HashMap<String, String>();
        queryMap.put("idcard",param.get("idcard"));
        User u = userService.getUserByAccountInfo(queryMap);

        if(u!=null){
            resMap.put("code","4");
            resMap.put("msg","身份证号已存在");
            return resMap;
        }

        u=null;
        queryMap.clear();
        queryMap.put("phone",param.get("phone"));
        u = userService.getUserByAccountInfo(queryMap);
        if(u!=null){
            resMap.put("code","4");
            resMap.put("msg","手机号已存在");
            return resMap;
        }

        String role="";
        User user = new User();
        if(httpServletRequest.getSession().getAttribute("role")!=null && httpServletRequest.getSession().getAttribute("role").toString().equals("1")){//1管理员2医生3普通用户
           role="2";
        }else{
            role="3";
        }

        user.setName(param.get("name"));
        user.setPwd(param.get("pwd"));
        user.setPhone(param.get("phone"));
        user.setIdcard(param.get("idcard"));
        user.setBirthday(param.get("birthday"));
        user.setSex(param.get("sex"));
        user.setIntro(param.get("intro"));
        user.setRole(Integer.valueOf(role));
        if(role.equals(("2"))){
            user.setTitle(param.get("title"));
        }
        log.info(user.toString());
        userService.addUser(user);

        queryMap.clear();
        queryMap.put("idcard",param.get("idcard"));
        queryMap.put("rno",role);

        userService.defineRole(queryMap);


        //如果注册医生，添加科室-医生关联
        if(role.equals("2")){
            queryMap.clear();
            queryMap.put("idcard",param.get("idcard"));
            queryMap.put("dno",param.get("dno"));
            departmentService.addDnoUno(queryMap);
        }

        httpServletRequest.getSession().setAttribute("isLogin",1);
        httpServletRequest.getSession().setAttribute("name",user.getName());
        httpServletRequest.getSession().setAttribute("uno",user.getUno());
        httpServletRequest.getSession().setAttribute("role",role);

        //添加defineRole
        resMap.put("code","0");
        resMap.put("msg","操作成功");

        return resMap;
    }
}
