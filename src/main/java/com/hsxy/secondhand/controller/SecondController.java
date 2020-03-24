package com.hsxy.secondhand.controller;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.exam.pojo.Compition;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import com.hsxy.secondhand.service.SecondService;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/second")
public class SecondController {
    @Autowired
    private SecondService secondService;

    //    首页--显示--（index）
    @RequestMapping("/index")
    @ResponseBody
    public List<Second> index(){
        List<Second> seconds= secondService.index();
        return seconds;
    }

//前台--跳转到--发布二手申请
    @RequestMapping("/tosecond")
    public String tosecond(){
        return "seconffb";
    }

//    前端--用户中心--自己发布的二手交易
    @RequestMapping("/my")
    public ModelAndView my(HttpSession session,
                           @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                           @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView mv=new ModelAndView();
        User user=(User) session.getAttribute("user1");
        PageHelper.startPage(pageNum,pageSize);
        List<Second> seconds= secondService.my(user.getId());
        PageInfo<Second> pageInfo=new PageInfo<>(seconds);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("seconds",seconds);
        mv.setViewName("usermessagemysecond");
        return mv;
    }

//前端--二手交易--发布评论
    @RequestMapping(value = "/fb2/{secondid}")
    public ModelAndView fb2(@PathVariable("secondid") String secondid,String context,
                            HttpSession session,RedirectAttributes model){
        ModelAndView mv=new ModelAndView();
        User user =(User) session.getAttribute("user1");
        if (user==null) {
            model.addFlashAttribute("msg", "未登录！！！");
            mv.setViewName("redirect:/second/look/" + secondid);
            return mv;
        }else {
            model.addFlashAttribute("msg", "发布成功！！！");
            secondService.fb2(user.getId(),context,secondid,new Date());
            mv.setViewName("redirect:/second/look/" + secondid);
        }
        return mv;
    }
//前台--二手交易--删除评论
    @RequestMapping("/de/{userid}/{secondid}/{id}")
    public ModelAndView de(@PathVariable("userid") String userid, @PathVariable("secondid") String secondid,
                           @PathVariable("id") String id, HttpSession session, RedirectAttributes model){
        User user=(User) session.getAttribute("user1");
        ModelAndView mv=new ModelAndView();
        if (user==null){
            model.addFlashAttribute("msg","未登录！！！");
            mv.setViewName("redirect:/second/look/"+secondid);
            return mv;
        }else if (user.getId()!=Integer.parseInt(userid)){
            model.addFlashAttribute("msg","只能删除自己的评论！！！");
            mv.setViewName("redirect:/second/look/"+secondid);
            return mv;
        }else {
            secondService.de(id);
            model.addFlashAttribute("msg", "删除成功！！！");
            mv.setViewName("redirect:/second/look/"+secondid);
            return mv;
        }
    }
//前台--二手交易--显示评论(加载所有)
    @RequestMapping("/pl/{secondid}")
    @ResponseBody
    public List<Message> pl(@PathVariable("secondid") String secondid){
        List<Message> list=secondService.pl(secondid);
        return list;
    }
//前台--点击后显示详细信息--look
    @RequestMapping("/look/{id}")
    public ModelAndView look(@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        Second second= secondService.look(id);
        mv.addObject("second",second);
        mv.setViewName("second3");
        return mv;
    }
//   前台--用户中心--发布二手交易
    @RequestMapping(value = "/fb",method = RequestMethod.POST)
    public ModelAndView fb(String categoryid, String name, String price, String context,
                     @RequestParam MultipartFile photo, HttpSession session)throws IOException {
        ModelAndView mv=new ModelAndView();
        User user=(User) session.getAttribute("user1");
        if (user==null){
            mv.setViewName("seconffb");
            mv.addObject("msg","未登录，请先登录！！！");
            return mv;
        }else {
            String realPath = "F:\\schoolimages";
            File f=new File(realPath);
            if (!f.exists()) {
                f.mkdirs();
            }
String fileName= UUID.randomUUID().toString().replaceAll("-", "")+photo.getOriginalFilename();
            Date time=new Date();
            secondService.fb(name,categoryid,context,user.getId(),time,price,fileName);
            photo.transferTo(new File(realPath+"/"+fileName));
            mv.addObject("filePath",fileName);
            mv.addObject("msg","发布成功,点击上方二手交易导航栏查看！！！");
            mv.setViewName("seconffb");
            return mv;
        }
    }
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
    mv.setViewName("second");
    return mv;
}
//前台--二手交易信息展示--根据分类显示
    @RequestMapping("/getMessage2/{categoryid}")
    public ModelAndView getMessage(@PathVariable("categoryid") String categoryid,
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);
        List<Second> seconds= secondService.getMessage2(categoryid);
        PageInfo<Second> pageInfo=new PageInfo<>(seconds);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("seconds",seconds);
        mv.addObject("categoryid",categoryid);
        mv.setViewName("second2");
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
