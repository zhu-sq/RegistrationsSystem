package com.javen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedirectionController {
    @RequestMapping(value="/addSchePage",method= RequestMethod.GET)
    public ModelAndView addSchePage(){
        System.out.println("addSchePage");
        return new ModelAndView("add_sche");
    }

    @RequestMapping(value="/depSchePage",method= RequestMethod.GET)
    public ModelAndView depSchePage(){
        System.out.println("depSchePage");
        return new ModelAndView("dep_sche");
    }

    @RequestMapping(value="/departmentPage",method= RequestMethod.GET)
    public ModelAndView departmentPage(){
        System.out.println("departmentPage");
        return new ModelAndView("department");
    }

    @RequestMapping(value="/docResPage",method= RequestMethod.GET)
    public ModelAndView docResPage(){
        System.out.println("docResPage");
        return new ModelAndView("doc_res");
    }

    @RequestMapping(value="/docSchePage",method= RequestMethod.GET)
    public ModelAndView docShcePage(){
        System.out.println("docSchePage");
        return new ModelAndView("doc_sche");
    }

    @RequestMapping(value="/doctorPage",method= RequestMethod.GET)
    public ModelAndView doctorPage(){
        System.out.println("doctorPage");
        return new ModelAndView("doctor");
    }

    @RequestMapping(value="/informationPage",method= RequestMethod.GET)
    public ModelAndView informationPage(){
        System.out.println("informationPage");
        return new ModelAndView("information");
    }
}
