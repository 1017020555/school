package com.hsxy.lose.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
import com.hsxy.lose.pojo.Type;
import com.hsxy.lose.service.LoseService;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
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
//            ServletContext context = request.getServletContext();
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



}
