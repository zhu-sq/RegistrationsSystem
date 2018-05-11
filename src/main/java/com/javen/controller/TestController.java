package com.javen.controller;

import com.javen.model.Shift;
import com.javen.model.User;
import com.javen.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/test",method= RequestMethod.GET)
public class TestController {
    private static Logger log= LoggerFactory.getLogger(TestController.class);

    @Resource
    private IUserService userService;

    @RequestMapping(value="/userInfo")
    public ModelAndView TestPage(){
        System.out.println("login");
        return new ModelAndView("userInfo");
    }

    @RequestMapping(value = "/getUserByBirth",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> GetShiftByDate(@RequestParam(value="birthday") String birthday) {
        System.out.println("sdfsfsdfssfdsd");
        log.info(birthday);
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(birthday==null){
            resMap.put("code",1);
            resMap.put("msg","查询日期不正确");
            log.info("查询日期不正确");
            return resMap;
        }

        User user = userService.getUserByBirth(birthday);
        log.info(user.toString());
        resMap.put("code","0");
        resMap.put("msg","操作成功");
        resMap.put("data",user);
        return resMap;
    }
}
