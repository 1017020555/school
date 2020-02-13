package com.hsxy.lose.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
import com.hsxy.lose.service.LoseService;
import com.hsxy.secondhand.pojo.Second;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/lose")
public class LoseController {
    @Autowired
    private LoseService loseService;
//    后台--失物招领--显示所有
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);
        List<Apply> applys= loseService.getMessage();
        PageInfo<Apply> pageInfo=new PageInfo<>(applys);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("applys",applys);
        mv.setViewName("admin/adminlose");
        return mv;
    }
//后台--失物招领--查询
@RequestMapping(value = "/search2",method = RequestMethod.GET)
public ModelAndView search2(String type,String goodname, String time,
                           @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                           @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize){
    ModelAndView mv=new ModelAndView();
    mv.addObject("type",type);
    mv.addObject("goodname",goodname);
    mv.addObject("time",time);
    PageHelper.startPage(pageNum, pageSize);
    if ("lose".equals(type)){
        String name=goodname;
        String applytime=time;
        List<Apply> applys= loseService.htsearch(name,applytime);
        PageInfo<Apply> pageInfo=new PageInfo<>(applys);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("applys",applys);
        mv.setViewName("admin/adminlose2");
        return mv;
    }else {
        List<Good> goods= loseService.htsearchgoods(goodname,time);
        PageInfo<Good> pageInfo=new PageInfo<>(goods);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("goods",goods);
        mv.setViewName("admin/adminlose2");
        return mv;
    }
}
    //后台--失物招领（丢失）--修改编辑页面
    @RequestMapping(value = "/modify3/{id}",method = RequestMethod.POST)
    public ModelAndView modify3(String name, String applyexplain,String place,String typeid,@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        loseService.modify3(name,applyexplain,place,typeid,id);
        mv.setViewName("redirect:/lose/show");
        return mv;
    }
    //后台--失物招领（丢失） -- 点击编辑（进入编辑页面adminlosechange）
    @RequestMapping("/modify1/{id}")
    public String modify1(Model model,@PathVariable Integer id){
        List types = loseService.getAllTypes();
        model.addAttribute("types",types);
        Apply apply= loseService.modify2(id);
        model.addAttribute("apply",apply);
        return "admin/adminlosechange";
    }
    // 后台--失物招领（丢失） -- 删除新闻
    @RequestMapping("/delete/{id}")
    public ModelAndView delete(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        loseService.delete(id);
        mv.setViewName("redirect:/lose/show");
        return mv;
    }

    //后台--失物招领（找到）--修改编辑页面
    @RequestMapping(value = "/modify5/{id}",method = RequestMethod.POST)
    public ModelAndView modify5(String goodname, String goodexplain,String place,String typeid,@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        loseService.modify5(goodname,goodexplain,place,typeid,id);
        mv.setViewName("redirect:/lose/show");
        return mv;
    }
    //后台--失物招领（找到） -- 点击编辑（进入编辑页面adminlosechange）
    @RequestMapping("/modify4/{id}")
    public String modify4(Model model,@PathVariable Integer id){
        List types = loseService.getAllTypes();
        model.addAttribute("types",types);
        Good good= loseService.modify4(id);
        model.addAttribute("good",good);
        return "admin/adminlosechange2";
    }
    // 后台--失物招领（找到） -- 删除新闻
    @RequestMapping("/delete2/{id}")
    public ModelAndView delete2(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        loseService.delete2(id);
        mv.setViewName("redirect:/lose/show");
        return mv;
    }



//    前台--失物招领--用户中心--我的失物申请
    @RequestMapping("/my")
    public ModelAndView my(HttpSession session,
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        User user=(User) session.getAttribute("user1");
        ModelAndView mv=new ModelAndView();
        List<Apply> applys= loseService.my(user.getId());
        PageInfo<Apply> pageInfo=new PageInfo<>(applys);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("applys",applys);
        mv.setViewName("usermessagemylost");
        return mv;
    }

//    前台--失物招领--进入发布失物页面
@RequestMapping(value = "/loselose")
public ModelAndView loselose(){
    ModelAndView mv=new ModelAndView();
    List types=loseService.getAllTypes();
    mv.addObject("types",types);
    mv.setViewName("loselose");
    return mv;
}
//前台--失物招领--发布失物
    @RequestMapping(value = "/loselose2",method = RequestMethod.POST)
public ModelAndView loselose2(String typeid, String name, String place,
                              String applyexplain, @RequestParam MultipartFile file,
                              HttpServletRequest request, HttpSession session)throws IOException {
        ModelAndView mv=new ModelAndView();
        User user=(User) session.getAttribute("user1");
        if (user==null){
            List types=loseService.getAllTypes();
            mv.addObject("types",types);
            mv.setViewName("loselose");
            mv.addObject("msg","未登录，请先登录！！！");
            return mv;
        }else {
            String realPath = "F:\\schoolimages";
            File f=new File(realPath);
            if (!f.exists()) {
                f.mkdirs();
            }
            String fileName= UUID.randomUUID().toString().replaceAll("-", "")+file.getOriginalFilename();
            Date applytime=new Date();
            loseService.loselose2(applytime,applyexplain,user.getId(),fileName,place,name,typeid);
            file.transferTo(new File(realPath+"/"+fileName));
            mv.addObject("filePath",fileName);
            mv.setViewName("redirect:/lose/getMessage");
            return mv;
        }
}
//前台---失物招领--进入捡到物品页面
@RequestMapping("/losefound")
public String losefound(Model model){
    List types=loseService.getAllTypes();
    model.addAttribute("types",types);
    return "losefound";
}
//前台--失物招领--发布捡到物品
@RequestMapping(value = "/losefound2",method = RequestMethod.POST)
public ModelAndView losefound2(String typeid, String goodname, String place,
                              String goodexplain, @RequestParam MultipartFile photo,
                              HttpServletRequest request, HttpSession session)throws IOException {
    ModelAndView mv=new ModelAndView();
    User user=(User) session.getAttribute("user1");
    if (user==null){
        List types=loseService.getAllTypes();
        mv.addObject("types",types);
        mv.setViewName("loselose");
        mv.addObject("msg","未登录，请先登录！！！");
        return mv;
    }else {
        String realPath = "F:\\schoolimages";
        File f=new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }
        String fileName= UUID.randomUUID().toString().replaceAll("-", "")+photo.getOriginalFilename();
        Date applytime=new Date();
        loseService.losefound2(applytime,goodexplain,user.getId(),fileName,place,goodname,typeid);
        photo.transferTo(new File(realPath+"/"+fileName));
        mv.addObject("filePath",fileName);
        mv.setViewName("redirect:/lose/getMessage");
        return mv;
    }
}

//首页--失物招领--失物招领流程
@RequestMapping("/loseadvice")
public String loseadvice(){
    return "loseadvice";
}

//   首页/导航条-- 失物招领--展示丢失物品
    @RequestMapping("/getMessage")
    public ModelAndView getMessage(
                             @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                             @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);
        List<Apply> applys= loseService.getMessage();
        PageInfo<Apply> pageInfo=new PageInfo<>(applys);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("applys",applys);
        List types=loseService.getAllTypes();
        mv.addObject("types",types);
        mv.setViewName("lose");
        return mv;
    }
//前台-失物招领---搜索丢失物品
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView search(String type,String typeid, String name, String applytime,
                               @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
                               @RequestParam(required=true,value="pageSize",defaultValue="6") Integer pageSize){
        ModelAndView mv=new ModelAndView();
        List types=loseService.getAllTypes();
        mv.addObject("types",types);
        mv.addObject("type",type);
        mv.addObject("typeid",typeid);
        mv.addObject("name",name);
        mv.addObject("applytime",applytime);
        PageHelper.startPage(pageNum, pageSize);
        if ("lose".equals(type)){
            List<Apply> applys= loseService.search(typeid,name,applytime);
            PageInfo<Apply> pageInfo=new PageInfo<>(applys);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("applys",applys);
            mv.setViewName("lose2");
            return mv;
        }else {
            String goodname=name;
            String time=applytime;
            List<Good> goods= loseService.searchgoods(typeid,goodname,time);
            PageInfo<Good> pageInfo=new PageInfo<>(goods);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("goods",goods);
            mv.setViewName("lose2");
            return mv;
        }
    }


    //前台index--点击后显示详细信息--look
    @RequestMapping("/look/{id}")
    public ModelAndView look(@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        Apply apply= loseService.look(id);
        mv.addObject("apply",apply);
        mv.setViewName("lose3");
        return mv;
    }
//前台--失物招领--点击后显示详细信息
    @RequestMapping("/look2/{goodid}")
    public ModelAndView look2(@PathVariable("goodid") String goodid){
        ModelAndView mv=new ModelAndView();
        Good good= loseService.look2(goodid);
        mv.addObject("good",good);
        mv.setViewName("lose4");
        return mv;
    }
//    首页--显示--（index）
    @RequestMapping("/index")
    @ResponseBody
    public List<Apply> index(){
        List<Apply> applies= loseService.index();
        return applies;
    }

}
