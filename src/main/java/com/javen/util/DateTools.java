package com.javen.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTools {

    /**
     * @MethodName : GetNowDate
     * @Description : 获取今天的日期
     * @return :返回今天的日期，格式为 "yyyy-MM-dd HH:mm:ss"
     */
    public static String GetNowDate(){
        String temp_str="";
        Date dt = new Date();
        // HH表示24小时制    如果换成hh表示12小时制
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        temp_str=sdf.format(dt);
        return temp_str;
    }


    /**
     * @MethodName : GetNowDate
     * @Description : 获取今天的日期
     * @return :返回今天的日期，格式为 "yyyy-MM-dd HH:mm:ss"
     */
    public static String GetFutureDate(int past){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);
        Date today = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String result = format.format(today);
        return result;
    }




    /**
     * @MethodName : isVaildDate
     * @Description : 判断传来的日期是否符合格式
     * @param  date:要判断的日期
     * @return :返回是否符合格式
     */
    public static Boolean IsVaildDate(String date){
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
