package com.hsxy.news.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import com.hsxy.news.service.NewsService;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

//    新闻咨询管理--删除新闻
    @RequestMapping("/delete/{id}")
    public ModelAndView delete(@PathVariable Integer id){
        ModelAndView mv=new ModelAndView();
        newsService.delete(id);
        mv.setViewName("redirect:/news/show");
        return mv;
    }
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
    public ModelAndView uploadFile(@RequestParam MultipartFile file, HttpSession session,
                                   String title, String content,String newstypeid, HttpServletRequest request) throws IllegalStateException, IOException {
        ModelAndView mv=new ModelAndView();
        ServletContext context = request.getServletContext();
        String realPath = context.getRealPath("/upload");
        File f=new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }
        String fileName= UUID.randomUUID().toString().replaceAll("-", "")+file.getOriginalFilename();
        User user=(User) session.getAttribute("user1");
        int newstypename = Integer.parseInt(newstypeid);

        newsService.upload(title,content,new Date(),user.getId(),newstypename,fileName);

        file.transferTo(new File(realPath+"/"+fileName));
        mv.addObject("filePath",fileName);
        mv.setViewName("redirect:/news/show");
        return mv;
    }


//    新闻咨询管理--显示所有新闻
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="2") Integer pageSize
    ){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(pageNum, pageSize);

        List<News> news = newsService.show();
        PageInfo<News> pageInfo=new PageInfo<>(news);

        mv.addObject("news",news);
        mv.setViewName("admin/adminnews");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

}
