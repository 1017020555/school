package com.hsxy.secondhand.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import com.hsxy.secondhand.service.SecondService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/second")
public class SecondController {
    @Autowired
    private SecondService secondService;

//    前台--二手交易--展示
@RequestMapping("/getMessage")
public ModelAndView getMessage(
        @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
        @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
    ModelAndView mv=new ModelAndView();
    PageHelper.startPage(pageNum, pageSize);

    List<Second> seconds= secondService.getMessage();
    PageInfo<Second> pageInfo=new PageInfo<>(seconds);
    mv.addObject("pageInfo",pageInfo);
    mv.addObject("seconds",seconds);

    mv.setViewName("lose");
    return mv;
}




//    后台--二手交易--留言管理
    @RequestMapping("/messages")
    public ModelAndView messages(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
    ){
        PageHelper.startPage(pageNum, pageSize);
        ModelAndView mv=new ModelAndView();
        List<Message>messages = secondService.messages();
        mv.addObject("messages",messages);
        PageInfo<Message> pageInfo=new PageInfo<>(messages);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/adminsecondhandcomment");
        return mv;
    }

//    后台--二手交易--查询
@RequestMapping(value = "/search1",method = RequestMethod.GET)
public ModelAndView search1(String name,String time, String categoryid,
                           @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                           @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
    PageHelper.startPage(pageNum, pageSize);
    ModelAndView mv=new ModelAndView();
    mv.addObject("name",name);
    mv.addObject("time",time);
    mv.addObject("categoryid",categoryid);

        List<Second> seconds= secondService.search1(name,time,categoryid);
        PageInfo<Second> pageInfo=new PageInfo<>(seconds);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("seconds",seconds);
        mv.setViewName("admin/adminsecondhand2");
        return mv;

}
//    后台--二手交易信息--显示所有
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
    ){
        PageHelper.startPage(pageNum, pageSize);
        ModelAndView mv=new ModelAndView();
        Integer count= secondService.message();
        List<Second> seconds= secondService.show();
        PageInfo<Second> pageInfo=new PageInfo<>(seconds);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("seconds",seconds);
        mv.addObject("count",count);
        mv.setViewName("admin/adminsecondhand");
         return mv;
    }



}
