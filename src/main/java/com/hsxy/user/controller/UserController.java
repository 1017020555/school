package com.hsxy.user.controller;

import com.hsxy.user.pojo.User;
import com.hsxy.user.service.UserService;
import com.hsxy.user.utils.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
   private UserService userService;

//前台--studentmessage
    @RequestMapping("/studentmessage")
    public String studentmessage(){
        return "studentmessage";
    }
    //前台--studentpass
    @RequestMapping("/studentpass")
    public String studentpass(){
        return "studentpass";
    }

//    前台--点击跳转首页
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

// 前台--head.jsp--用户中心
@RequestMapping("/pd")
    public String pd(HttpSession session){
        User user=(User) session.getAttribute("user1");
        if (user==null){
            return "user";
        }else {
            return "redirect:/usermessage.jsp";
        }
    }
// 前台--生成二维码
    @RequestMapping(value="getCode")
    public void getCode(@RequestParam(value = "time") String time, HttpServletRequest request, HttpServletResponse response) {
        ValidateCode code = new ValidateCode(100, 30, 4, 30, 25, "validateCode");
        code.getCode(request, response);
    }
//前台--用户中心--修改个人信息
    @RequestMapping("/changemess")
    public ModelAndView changemess(String email,String phone,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user=(User) session.getAttribute("user1");
        userService.changemess(email,phone,user.getId());
        mv.addObject("msg","个人信息修改成功！！！");
        mv.setViewName("studentmessage");
        return mv;
    }
    //用户中心-修改密码
    @RequestMapping(value = "/changepass",method = RequestMethod.POST)
    public String changepass(String p2,HttpSession session,Model model){
        User user1 = (User) session.getAttribute("user1");
        Integer id = user1.getId();
        Integer i= userService.changepass(id,p2);
        model.addAttribute("msg","密码修改成功！！！");
        return "redirect:/studentpass.jsp";
    }


    @RequestMapping(value = "/load",method = RequestMethod.POST)
    public String login(HttpSession session, User user, String path,String rem,HttpServletResponse response){
        String code=(String) session.getAttribute("validateCode");

        User user1=userService.up(user);
        if ("1".equals(rem)){
            String loginInfo = user.getUsername()+ "," + user.getPassword();
            Cookie userCookie = new Cookie("loginInfo", loginInfo);
            userCookie.setMaxAge(1 * 24 * 60 * 60); // 存活期为一天 1*24*60*60
            userCookie.setPath("/");
            response.addCookie(userCookie);
        }
        if ((path.equals(code)) && (user1!=null) && (user1.getManager()==1)){
            session.removeAttribute("validateCode");
            session.setAttribute("user1",user1);
            return "redirect:/usermessage.jsp";
        }else if((path.equals(code)) && (user1!=null) && (user1.getManager()==0)){
            session.removeAttribute("validateCode");
            session.setAttribute("user1",user1);
            return "redirect:/admin/index.jsp";
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/unload")
    public String unload(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user1");
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
