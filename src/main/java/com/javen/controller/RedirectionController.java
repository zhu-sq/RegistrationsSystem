package com.javen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedirectionController {
    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView addSchePage(){
        System.out.println("addSchePage");
        return new ModelAndView("add_sche");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView depSchePage(){
        System.out.println("depSchePage");
        return new ModelAndView("dep_sche");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView departmentPage(){
        System.out.println("departmentPage");
        return new ModelAndView("department");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView docResPage(){
        System.out.println("docResPage");
        return new ModelAndView("doc_res");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView docShcePage(){
        System.out.println("docShcePage");
        return new ModelAndView("doc_shce");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView doctorPage(){
        System.out.println("doctorPage");
        return new ModelAndView("doctor");
    }

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView informationPage(){
        System.out.println("informationPage");
        return new ModelAndView("information");
    }
}
