package com.hsxy.news.controller;
import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import com.hsxy.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

//新闻咨询信息管理--发布新闻按钮(进入发布界面)
    @RequestMapping("/fb")
    public ModelAndView fb(){
        ModelAndView mv=new ModelAndView();
        List list= newsService.fb();
        mv.addObject("list",list);
        mv.setViewName("admin/adminnewsadd");
        return mv;
    }
//新闻咨询管理--发布新闻按钮（发布新闻）
    @RequestMapping(value="/upload",method= RequestMethod.POST)
    public ModelAndView uploadFile(@RequestParam MultipartFile file,
                                   String title,String content,Integer newtypeid, HttpServletRequest request) throws IllegalStateException, IOException {
        ModelAndView mv=new ModelAndView("admin/adminnews");

        ServletContext context = request.getServletContext();
        String realPath = context.getRealPath("/upload");

        File f=new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }
        String fileName= UUID.randomUUID().toString().replaceAll("-", "")+file.getOriginalFilename();

        file.transferTo(new File(realPath+"/"+fileName));
        mv.addObject("filePath",fileName);
        return mv;
    }


}
