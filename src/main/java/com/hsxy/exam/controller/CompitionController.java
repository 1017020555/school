package com.hsxy.exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.exam.pojo.Compition;
import com.hsxy.exam.service.CompitionService;
import com.hsxy.news.pojo.News;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/compition")
public class CompitionController {
    @Autowired
    private CompitionService compitionService;

//    新闻咨询管理--搜索
    @RequestMapping("/search")
    public ModelAndView search(String title,String time){
        ModelAndView mv=new ModelAndView();
        List<Compition> compitions =compitionService.search(title,time);
        mv.addObject("compitions",compitions);
        mv.setViewName("admin/adminexam");
        return mv;
    }
    //新闻咨询管理--修改编辑页面
    @RequestMapping(value = "/modify2/{id}",method = RequestMethod.POST)
    public ModelAndView modify2(String title, String context,@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        compitionService.modify2(title,context,id);
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
    public ModelAndView add(String title, String context, HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user1 =(User)session.getAttribute("user1");
        compitionService.add(title,context,user1.getId());
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
