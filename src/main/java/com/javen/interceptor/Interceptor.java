package com.javen.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Interceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        // TODO Auto-generated method stub
        //判断用户是否登陆  如果没有登陆  重定向到登陆页面   不放行   如果登陆了  就放行了
//        String requestURI = request.getRequestURI();
//        if(requestURI.contains("/pri")){
//            String isLogin = (String) request.getSession().getAttribute("isLogin");
//            if(null == isLogin){
//                response.sendRedirect(request.getContextPath() + "/login.action");
//                return false;
//            }
//        }
        return true;
    }

    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        // TODO Auto-generated method stub
        //System.out.println("方法后 1");
    }
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub
        //System.out.println("页面渲染后 1");
    }
}
