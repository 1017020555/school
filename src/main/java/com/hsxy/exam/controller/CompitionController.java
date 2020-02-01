package com.hsxy.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.exam.pojo.Compition;
import com.hsxy.exam.service.CompitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/compition")
public class CompitionController {
    @Autowired
    private CompitionService compitionService;



    //学科竞赛信息管理---发布
    @RequestMapping("/fb")
    public ModelAndView fb(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/adminexamadd");
        return mv;
    }

// 学科竞赛信息管理-- 点击左侧显示所有
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="2") Integer pageSize
    ){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);
        List<Compition> compitions = compitionService.show();

        PageInfo<Compition> pageInfo=new PageInfo<>(compitions);
        mv.addObject("compitions",compitions);
        mv.setViewName("admin/adminexam");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

}
