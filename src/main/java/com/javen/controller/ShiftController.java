package com.javen.controller;

import com.javen.model.Shift;
import com.javen.model.User;
import com.javen.service.IShiftService;
import com.javen.service.IUserService;
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
@RequestMapping("/pri/shift")
public class ShiftController {
    private static Logger log= LoggerFactory.getLogger(ShiftController.class);

    @Resource
    private IShiftService shiftService;

    /**
     * @MethodName : GetShifByDate
     * @Description : 根据时间段获取挂号信息 包含开始和结束时间
     * @param  startDate:开始的时间
     * @param  endDate:结束时间
     * @return :返回挂号信息集合
     */
    @RequestMapping(value = "/getByDate",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> GetShifByDate(@RequestParam(value="startDate") String startDate,
                                            @RequestParam(value="endDate") String endDate) {
        log.info("-------------getByDate-------");
        log.info(startDate);
        log.info(endDate);
        Map<String,Object> resMap=new HashMap<String, Object>();
        if(startDate==null || endDate==null
                || !isVaildDate(startDate)  || !isVaildDate(endDate)){
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
     * @MethodName : AddShift
     * @Description : 批量添加挂号信息
     * @param  msgMap:包含一个或者多个排班表信息
     * @return :返回是否操作成功
     */
    @RequestMapping(value = "/addShift",method = RequestMethod.POST)
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
    @RequestMapping(value = "/updateShift",method = RequestMethod.POST)
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
     * @MethodName : isVaildDate
     * @Description : 判断传来的日期是否符合格式
     * @param  date:要判断的日期
     * @return :返回是否符合格式
     */
    private Boolean isVaildDate(String date){
        Boolean isVail=true;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
            format.setLenient(false);
            format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            isVail=false;
        }
        return isVail;
    }



}
