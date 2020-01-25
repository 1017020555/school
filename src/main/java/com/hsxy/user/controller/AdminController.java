package com.hsxy.user.controller;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.user.mapper.AdminMapper;
import com.hsxy.user.pojo.Params;
import com.hsxy.user.pojo.User;
import com.hsxy.user.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;;

    @RequestMapping("/xy")
    public ModelAndView xy(){
        ModelAndView mv=new ModelAndView();
        List list= adminService.xy();
        mv.setViewName("admin/adminuser");
        mv.addObject("list",list);
        return mv;
    }
    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    public String modify(User user, HttpSession session){
        User user1 =(User)session.getAttribute("user1");

        System.out.println(user);

        Boolean b= adminService.modify(user,user1.getId());
        if (b){
            session.removeAttribute("user1");
            session.invalidate();
           return "admin/adminuser";
        }
        return "admin/adminuser";
    }

    @RequestMapping("/user")
    public ModelAndView user(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="2") Integer pageSize
            ){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);

        List<User> users = adminService.user();
        PageInfo<User> pageInfo=new PageInfo<>(users);

        mv.addObject("users",users);
        mv.setViewName("admin/admin");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
}
