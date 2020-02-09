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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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




    //后台--二手交易(评论)--提交修改
    @RequestMapping(value = "/modify4/{id}",method = RequestMethod.POST)
    public ModelAndView modify4(String context, @PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        secondService.modify4(context,id);
        mv.setViewName("redirect:/second/show");
        return mv;
    }
    //后台--二手交易(评论)--进入修改页面
    @RequestMapping("/modify3/{id}")
    public String modify3(Model model, @PathVariable Integer id){
        Message message= secondService.modify3(id);
        model.addAttribute("message",message);
        return "admin/adminsecondhandcommentchange";
    }
    // 后台--二手交易(评论)--删除
    @RequestMapping("/delete2/{id}")
    public ModelAndView delete2(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        secondService.delete2(id);
        mv.setViewName("redirect:/second/show");
        return mv;
    }

//后台--二手交易--留言管理（条件查询）
    @RequestMapping(value = "/searchcomment",method = RequestMethod.GET)
    public ModelAndView searchcomment(String userid,String time,
                                @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                                @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        ModelAndView mv=new ModelAndView();
        mv.addObject("userid",userid);
        mv.addObject("time",time);
        List<Message> messages= secondService.searchcomment1(time,userid);
        PageInfo<Message> pageInfo=new PageInfo<>(messages);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("messages",messages);
        mv.setViewName("admin/adminsecondhandcomment2");
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


//后台--二手交易--提交修改
    @RequestMapping(value = "/modify2/{id}",method = RequestMethod.POST)
    public ModelAndView modify2(String name,String context,String price,String categoryid,
            @PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        secondService.modify2(name,context,price,categoryid,id);
        mv.setViewName("redirect:/second/show");
        return mv;
    }
//后台--二手交易--进入修改页面
    @RequestMapping("/modify/{id}")
    public String modify1(Model model, @PathVariable Integer id){
        Second second= secondService.modify(id);
        model.addAttribute("second",second);
        return "admin/adminsecondhandchange";
    }
// 后台--二手交易--删除
    @RequestMapping("/delete/{id}")
    public ModelAndView delete(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        secondService.delete(id);
        mv.setViewName("redirect:/second/show");
        return mv;
}

//    后台--二手交易--所有（条件查询）
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
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView mv=new ModelAndView();
        List<Second> seconds= secondService.show();
        mv.addObject("seconds",seconds);
        PageInfo<Second> pageInfo=new PageInfo<>(seconds);
        mv.addObject("pageInfo",pageInfo);
        Integer count= secondService.message();
        mv.addObject("count",count);
        mv.setViewName("admin/adminsecondhand");
         return mv;
    }



}
