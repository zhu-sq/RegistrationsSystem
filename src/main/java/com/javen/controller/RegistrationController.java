package com.javen.controller;


import com.javen.util.RoleConfig;
import com.javen.model.User;
import com.javen.service.IRegistrationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pri/reg")
public class RegistrationController {
    private static Logger log= LoggerFactory.getLogger(ShiftController.class);

    @Resource
    private IRegistrationService registrationService;


    @Autowired(required=false)
    private RoleConfig roleConfig;

    /**
     * @MethodName : AddReg
     * @Description : 根据排班表编号和用户编号进行预约
     * @param  sno:排班表编号
     * @param  uno:用户编号
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/addReg",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> AddReg(@RequestParam(value="sno") Integer sno,
                                     @RequestParam(value="uno") Integer uno) {
        log.info("-------------AddReg-------");
        log.info(sno+"");
        log.info(uno+"");
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(sno==null || uno==null){
            resMap.put("code",1);
            resMap.put("msg","用户或排班编号为空");
            log.info("用户或排班编号为空");
            return resMap;
        }

        HashMap<String,Integer> map = new HashMap<String, Integer>();
        map.put("sno",sno);
        map.put("uno",uno);

        Boolean isOk = registrationService.addRestration(map);

        if(!isOk){
            resMap.put("code",2);
            resMap.put("msg","此时段预约已满");
            log.info("此时段预约已满");
            return resMap;
        }

        resMap.put("code","0");
        resMap.put("msg","预约成功");
        return resMap;
    }


    /**
     * @MethodName : UpdateReg
     * @Description : 根据排班表编号和用户编号取消预约
     * @param  sno:排班表编号
     * @param  uno:用户编号
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/delReg",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> UpdateReg(@RequestParam(value="sno") Integer sno,
                                     @RequestParam(value="uno") Integer uno,
                                     HttpServletRequest httpServletRequest) {
        log.info("-------------UpdateReg-------");
        log.info(sno+"");
        log.info(uno+"");

        Map<String,Object> resMap=new HashMap<String, Object>();
        //判断参数是否有传进来
        if(sno==null || uno==null){
            resMap.put("code",2);
            resMap.put("msg","用户或排班编号为空");
            log.info("用户或排班编号为空");
            return resMap;
        }

        //判断此连接是否登录
        if(httpServletRequest.getSession().getAttribute("uno")==null){
            resMap.put("code",1);
            resMap.put("msg","请登录");
            log.info("请登录");
            return resMap;
        }

        Integer sessionUno = Integer.parseInt(httpServletRequest.getSession().getAttribute("uno").toString());

        //判断操作的对象是否是自己
        if(sessionUno!=uno){
            resMap.put("code",3);
            resMap.put("msg","权限不足");
            log.info("权限不足");
            return resMap;
        }

        HashMap<String,Integer> map = new HashMap<String, Integer>();
        map.put("sno",sno);
        map.put("uno",uno);
        registrationService.delRestration(map);

        resMap.put("code","0");
        resMap.put("msg","取消成功");
        return resMap;
    }


    /**
     * @MethodName : GetReg
     * @Description : 根据排班表编号获取当前排班表的预约病人的信息
     * @param  sno:排班表编号
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/getReg",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> GetReg(@RequestParam(value="sno") Integer sno,
                                     HttpServletRequest httpServletRequest) {
        log.info("-------------GetReg-------");
        log.info(sno+"");

        Map<String,Object> resMap=new HashMap<String, Object>();
        //判断参数是否有传进来
        if(sno==null){
            resMap.put("code",2);
            resMap.put("msg","排班编号为空");
            log.info("排班编号为空");
            return resMap;
        }

        //判断此连接是否登录
        if(httpServletRequest.getSession().getAttribute("role")==null){
            resMap.put("code",1);
            resMap.put("msg","请登录");
            log.info("请登录");
            return resMap;
        }

        Integer role = Integer.parseInt(httpServletRequest.getSession().getAttribute("role").toString());

        //判断操作的对象是否是医生
        if(roleConfig.getUser()==null || role.equals(Integer.parseInt(roleConfig.getUser()))){
            resMap.put("code",3);
            resMap.put("msg","权限不足");
            log.info("权限不足");
            return resMap;
        }

        List<User> list = registrationService.getRegUser(sno);

        resMap.put("code","0");
        resMap.put("msg","获取成功");
        resMap.put("users",list);
        return resMap;
    }






}
