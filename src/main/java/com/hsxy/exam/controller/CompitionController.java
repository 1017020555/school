package com.hsxy.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.exam.pojo.Compition;
import com.hsxy.exam.service.CompitionService;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.news.pojo.News;
import com.hsxy.secondhand.pojo.Second;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/compition")
public class CompitionController {
    @Autowired
    private CompitionService compitionService;

    //    首页--显示--（index）
    @RequestMapping("/index")
    @ResponseBody
    public List<Compition> index(){
        List<Compition> compitions= compitionService.index();
        return compitions;
    }

//    前台--新闻信息--look
@RequestMapping("/look/{id}/{count}")
public ModelAndView look(@PathVariable("id") String id,@PathVariable("count") String count){
    ModelAndView mv=new ModelAndView();
    Compition compition= compitionService.look(id);
    int c=Integer.parseInt(count);
    c++;
    compitionService.look2(c,id);
    mv.addObject("compition",compition);
    mv.setViewName("exam3");
    return mv;
}
//    前台--新闻信息--首页根据分类显示
@RequestMapping("/getMessage2/{typeid}")
public ModelAndView getMessage2(@PathVariable String typeid,
                          @RequestParam(required=true,value="pageNum",defaultValue="0") Integer pageNum,
                          @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize
                          ){
    ModelAndView mv=new ModelAndView();
    PageHelper.startPage(pageNum, pageSize);
    List<Compition> compitions= compitionService.getMessage2(typeid);
    PageInfo<Compition> pageInfo=new PageInfo<>(compitions);
    mv.addObject("pageInfo",pageInfo);
    mv.addObject("compitions",compitions);
    mv.addObject("typeid",typeid);
    mv.setViewName("exam2");
    return mv;
}
//    前台--新闻信息--显示所有
@RequestMapping("/getMessage")
public ModelAndView getMessage(
        @RequestParam(required=true,value="pageNum",defaultValue="0") Integer pageNum,
        @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
    ModelAndView mv=new ModelAndView();
    PageHelper.startPage(pageNum, pageSize);
    List<Compition> compitions= compitionService.getMessage();
    PageInfo<Compition> pageInfo=new PageInfo<>(compitions);
    mv.addObject("pageInfo",pageInfo);
    mv.addObject("compitions",compitions);
    mv.setViewName("exam");
    return mv;
}

//    新闻咨询管理--搜索
    @RequestMapping("/search")
    public ModelAndView search(String title,String time){
        ModelAndView mv=new ModelAndView();
        if (title=="" && time ==""){
            mv.setViewName("redirect:/compition/show");
            return mv;
        }else {
            List<Compition> compitions =compitionService.search(title,time);
            mv.addObject("compitions",compitions);
            mv.setViewName("admin/adminexam");
            return mv;
        }
    }
    //新闻咨询管理--修改编辑页面
    @RequestMapping(value = "/modify2/{id}",method = RequestMethod.POST)
    public ModelAndView modify2(String title, String context,String typeid,@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        compitionService.modify2(title,context,typeid,id);
        mv.setViewName("redirect:/compition/show");
        return mv;
    }

    //新闻咨询管理--点击编辑（进入编辑页面adminnewschange）
    @RequestMapping("/modify1/{id}")
    public String modify1(Model model, @PathVariable Integer id){
        Compition compition = compitionService.modify1(id);
        model.addAttribute("compition",compition);
        return "admin/adminexamchange";
    }
    //    新闻咨询管理--删除新闻
    @RequestMapping("/delete/{id}")
    public ModelAndView delete(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        compitionService.delete(id);
        mv.setViewName("redirect:/compition/show");
        return mv;
    }

//学科竞赛信息管理--发布（发布后跳转至学科竞赛信息首页）
    @RequestMapping("/add")
    public ModelAndView add(String title, String context,String typeid, HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user1 =(User)session.getAttribute("user1");
        compitionService.add(title,context,user1.getId(),typeid);
        mv.setViewName("redirect:/compition/show");
        return mv;
    }
    //学科竞赛信息管理---发布按钮（跳转至adminexamadd）
    @RequestMapping("/fb")
    public ModelAndView fb(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/adminexamadd");
        return mv;
    }

// 学科竞赛信息管理-- 点击左侧显示所有
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="0") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
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
