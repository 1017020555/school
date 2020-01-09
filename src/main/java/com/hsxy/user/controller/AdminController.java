package com.hsxy.user.controller;
import com.alibaba.fastjson.JSON;
import com.hsxy.user.pojo.User;
import com.hsxy.user.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/xy")
    public ModelAndView xy(){
        ModelAndView mv=new ModelAndView();
        List list= adminService.xy();
        mv.setViewName("admin/adminuser");
        mv.addObject("list",list);
        return mv;
    }
    @RequestMapping("/modify")
    public String modify(){

        return "";
    }

}
