package com.hsxy.user.controller;

import com.hsxy.user.pojo.User;
import com.hsxy.user.service.UserService;
import com.hsxy.user.utils.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
   private UserService userService;


    @RequestMapping(value="getCode")
    public void getCode(@RequestParam(value = "time") String time, HttpServletRequest request, HttpServletResponse response) {
        ValidateCode code = new ValidateCode(100, 30, 4, 30, 25, "validateCode");
        code.getCode(request, response);
    }

    @RequestMapping(value = "/load",method = RequestMethod.GET)
    public String login(HttpSession session, User user, String path){
        String code=(String) session.getAttribute("validateCode");
        User user1=userService.load(user);

        if ((path.equals(session.getAttribute("validateCode"))) && (user1!=null)){

            session.removeAttribute("validateCode");
            session.setAttribute("user1",user1);

            System.out.println("111");
            return "redirect:/index.jsp";
        }
        System.out.println("222");

        return "redirect:/index.jsp";
    }

}
