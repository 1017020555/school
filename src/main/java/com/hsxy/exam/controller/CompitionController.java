package com.hsxy.exam.controller;

import com.hsxy.exam.service.CompitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/compition")
public class CompitionController {
    @Autowired
    private CompitionService compitionService;

// 学科竞赛信息管理-- 点击左侧显示所有
    @RequestMapping("/show")
    public ModelAndView show(){
        ModelAndView mv=new ModelAndView();


        mv.setViewName("admin/adminexam");
        return mv;
    }

}
