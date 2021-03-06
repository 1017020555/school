package com.hsxy.user.controller;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.user.mapper.AdminMapper;
import com.hsxy.user.pojo.Params;
import com.hsxy.user.pojo.User;
import com.hsxy.user.service.AdminService;
import com.hsxy.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

//    个人信息管理--点击进入
   @RequestMapping(value = "/adminuser")
   public ModelAndView adminuser(){
       ModelAndView mv=new ModelAndView();
       List xy = adminService.xy();
       mv.addObject("list",xy);
       mv.setViewName("admin/adminuser");
       return mv;
   }
    //个人信息管理--修改个人信息
    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    public String modify(User user, HttpSession session){
        User user1 =(User)session.getAttribute("user1");
        Boolean b= adminService.modify(user,user1.getId());
        if (b){
            session.removeAttribute("user1");
            session.invalidate();
        }
        return "admin/adminuser";
    }


//    用户管理--查出所有用户
    @RequestMapping("/user")
    public ModelAndView user(
            @RequestParam(required=true,value="pageNum",defaultValue="0") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
            ){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);

        List<User> users = adminService.user();
        PageInfo<User> pageInfo=new PageInfo<>(users);

        List xy = adminService.xy();
        mv.addObject("list",xy);

        mv.addObject("users",users);
        mv.setViewName("admin/admin");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
//    用户管理--查询具体的用户
    @RequestMapping("/look")
    public ModelAndView look(String name,String username,
                             @RequestParam(required=true,value="pageNum",defaultValue="0") Integer pageNum,
                             @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum,pageSize);
        if (name=="" && username==""){
            mv.setViewName("redirect:/admin/user");
            return mv;
        }else {
            List<User> users= adminService.look(name,username);
            mv.addObject("users",users);
            mv.setViewName("admin/admin");
            return mv;
        }
    }
//用户管理--编辑某一个用户信息(查询)
    @RequestMapping("/adminmessagechange/{id}")
    public ModelAndView adminmessagechange(@PathVariable(value = "id") Integer id){
        ModelAndView mv=new ModelAndView();
        User user=adminService.adminmessagechange(id);
        List xy = adminService.xy();
        mv.setViewName("admin/adminmessagechange");
        mv.addObject("user",user);
        mv.addObject("list",xy);
        return mv;
    }
//用户管理--编辑某一个用户信息（修改）
    @RequestMapping("/adminmessagechange2")
    public ModelAndView adminmessagechange2(User user){
        ModelAndView mv=new ModelAndView();
        Integer i=adminService.adminmessagechange2(user);
        if (i>0){
            mv.setViewName("redirect:/admin/user");
        }
        return mv;
    }
//用户管理--删除某一用户
@RequestMapping("/admindelete/{id}")
    public String admindelete(@PathVariable(value = "id") Integer id){
        adminService.admindelete(id);
        return "redirect:/admin/user";
    }

}
