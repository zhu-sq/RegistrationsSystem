package com.javen.controller;

import com.javen.model.Department;
import com.javen.model.Registration;
import com.javen.model.Shift;
import com.javen.model.User;
import com.javen.model.Registration;
import com.javen.service.IDepartmentService;
import com.javen.service.IShiftService;
import com.javen.service.IUserService;
import com.javen.util.DateTools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.HTMLDocument;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ShiftController {
    private static Logger log= LoggerFactory.getLogger(ShiftController.class);

    @Resource
    private IShiftService shiftService;

    @Resource
    private IDepartmentService departmentService;

    @Resource
    private IUserService userService;

    /**
     * @MethodName : GetShiftByDate
     * @Description : 根据时间段获取挂号信息 包含开始和结束时间
     * @param  startDate:开始的时间
     * @param  endDate:结束时间
     * @return :返回挂号信息集合
     */
    @RequestMapping(value = "/shift/getByDate",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> GetShiftByDate(@RequestParam(value="startDate") String startDate,
                                            @RequestParam(value="endDate") String endDate) {
        log.info("-------------getByDate-------");
        log.info(startDate);
        log.info(endDate);
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(startDate==null || endDate==null
                || !isValidDate(startDate)  || !isValidDate(endDate)
                || !DateTools.IsVaildDate(startDate)  || !DateTools.IsVaildDate(endDate)){

            resMap.put("code",1);
            resMap.put("msg","查询日期不正确");
            log.info("查询日期不正确");
            return resMap;
        }

        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("startDate",startDate);
        map.put("endDate",endDate);

        LinkedList<Shift> list = shiftService.getShiftByDate(map);

        resMap.put("code","0");
        resMap.put("msg","操作成功");
        resMap.put("count",list.size());
        resMap.put("shifts",list);
        return resMap;
    }

    /**
     * @MethodName : GetShiftByDnoUno
     * @Description : 根据科室或者医生获取排班表信息
     * @param  dno:科室编号
     * @param  uno:医生编号
     * @return :返回排班表信息集合
     */
        @RequestMapping(value = "/shift/getByDnoUno",method = RequestMethod.GET)
        @ResponseBody
    public Map<String,Object> GetShiftByDnoUno(@RequestParam(value="uno",required = false) Integer uno,
                                              @RequestParam(value="dno",required = false) Integer dno) {
        log.info("-------------getByDate-------");
        log.info(uno+"");
        log.info(dno+"");
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(uno==null && dno==null){
            resMap.put("code",1);
            resMap.put("msg","医生或者科室编号为空");
            log.info("医生或者科室编号为空");
            return resMap;
        }

        if(uno!=null && dno!=null){
            resMap.put("code",2);
            resMap.put("msg","条件多余，医生和科室编号都存在");
            log.info("条件多余，医生和科室编号都存在");
            return resMap;
        }

        /**
         * 单独根据uno或者dno来查询获得排班表的信息
         * 但是考虑到实际情况，查询的同时要添加时间限制
         * 查找的数据是从今天开始7天内的排班表
         */
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("uno",uno);
        map.put("dno",dno);
        map.put("startDate",DateTools.GetTimesmorning());
        map.put("endDate",DateTools.GetFutureDate(7));

        log.info(DateTools.GetNowDate()+" "+DateTools.GetFutureDate(7));

        Department department = new Department();
        User user=new User();

        LinkedList<Shift> list = shiftService.getShiftByDnoUno(map);

        if(dno!=null){
            department = departmentService.getDeparByDno(map);
        }

        if(uno!=null){
            user = userService.getUserByUno(uno);
            user.setPwd("");
        }

        resMap.put("code","0");
        resMap.put("msg","操作成功");
        resMap.put("user",user);
        resMap.put("depar",department);
        resMap.put("shifts",list);
        return resMap;
    }


    /**
     * @MethodName : AddShift
     * @Description : 批量添加挂号信息
     * @param  msgMap:包含一个或者多个排班表信息
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/pri/shift/addShift",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> AddShift(@RequestBody Map<String, List<Shift>> msgMap) {
        log.info("-------------SetShift-------");
        log.info(msgMap.toString());

        Map<String,Object> resMap=new HashMap<String, Object>();

        List<Shift> list = msgMap.get("shifts");

        if(list==null || list.size()==0){
            resMap.put("code","1");
            resMap.put("msg","错误:排班表数据为空");
            return resMap;
        }
        shiftService.addShift(list);
        resMap.put("code","0");
        resMap.put("msg","操作成功");
        return resMap;
    }

    /**
     * @MethodName : UpdateShift
     * @Description : 修改挂号信息
     * @param  msgMap:包含一个排班表信息
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/pri/shift/updateShift",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> UpdateShift(@RequestBody Map<String, Shift> msgMap) {
        log.info("-------------UpdateShift-------");
        log.info(msgMap.toString());

        Map<String,Object> resMap=new HashMap<String, Object>();

        Shift shift = msgMap.get("shift");

        if(shift==null || shift.getSno() == null){
            resMap.put("code","1");
            resMap.put("msg","错误:排班表数据为空");
            return resMap;
        }
        shiftService.updateShift(shift);
        resMap.put("code","0");
        resMap.put("msg","操作成功");
        return resMap;
    }


    /**
     * @MethodName : isValidDate
     * @Description : 判断传来的日期是否符合格式
     * @param  date:要判断的日期
     * @return :返回是否符合格式
     */
    private Boolean isValidDate(String date){
        Boolean isValid=true;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
            format.setLenient(false);
            format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            isValid=false;
        }
        return isValid;
    }

    /**
     * @MethodName : GetShiftByUno
     * @Description : 根据用户编号获取挂号信息
     * @param  uno：用户的编号
     * @return :返回排班表信息集合
     */
    @RequestMapping(value = "/shift/getShiftByUno",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> GetShiftByUno(@RequestParam(value="uno") Integer uno){
        log.info("-------------getByDate-------");
        log.info(uno.toString());
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(uno==null || userService.getRoleByUno(uno)!=3){
            resMap.put("code",1);
            resMap.put("msg","该编号不是普通用户");
            log.info("该编号不是普通用户");
            return resMap;
        }

        Registration reg = null;
        Shift shift = null;
        HashMap<String,Object> map = new HashMap<String, Object>();
        reg = shiftService.getRegByUno(uno);
        log.info("-----"+reg);
        if(reg==null){
            resMap.put("code","10");
            resMap.put("msg","没有挂号信息");
            return  resMap;
        }
        log.info("-----"+reg.getSno()+"");
        shift = shiftService.getShiftBySno(reg.getSno());
        log.info(shift+"");

        HashMap<String,String> queryMap = new HashMap<String, String>();
        queryMap.put("uno",shift.getUno()+"");
        User doctor = userService.getUserByAccountInfo(queryMap);

        HashMap<String,Object> depar_map = new HashMap<String, Object>();
        depar_map.put("dno",shift.getDno());
        Department department = departmentService.getDeparByDno(depar_map);

        resMap.put("code","0");
        resMap.put("msg","操作成功");
        resMap.put("sno",reg.getSno());
        resMap.put("doctName",doctor.getName());
        resMap.put("deparName",department.getName());
        resMap.put("startDate",shift.getStartDate());
        resMap.put("endDate",shift.getEndDate());
        resMap.put("detail",shift.getDetail());
        return resMap;
}
}
