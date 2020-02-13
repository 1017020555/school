package com.hsxy.news.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.exam.pojo.Compition;
import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import com.hsxy.news.service.NewsService;
import com.hsxy.user.pojo.User;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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


//    首页新闻-----新闻资讯管理(index)
    @RequestMapping("/index")
    @ResponseBody
    public List<News> index(HttpServletRequest request){
        return newsService.index();
    }

//前台---新闻咨询管理--显示所有
    @RequestMapping("/getMessage")
    public ModelAndView getMessage(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
    ){
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView mv=new ModelAndView();
        List<News> news= newsService.index();
        PageInfo<News> pageInfo=new PageInfo<>(news);
        mv.addObject("news",news);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("news");
        return mv;
    }
//前台--新闻咨询管理--按分类显示
    @RequestMapping("/getMessage2/{newstypeid}")
    public ModelAndView getMessage2(@PathVariable("newstypeid") String newstypeid,
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
    ){
        PageHelper.startPage(pageNum,pageSize);
        ModelAndView mv=new ModelAndView();
        List<News> news= newsService.getMessage2(newstypeid);
        PageInfo<News> pageInfo=new PageInfo<>(news);
        mv.addObject("news",news);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("newstypeid",newstypeid);
        mv.setViewName("news2");
        return mv;
    }
//前台--新闻咨询--look具体的某一个
    @RequestMapping("/look/{id}")
    public ModelAndView look(@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        News news= newsService.look(id);
        mv.addObject("news",news);
        mv.setViewName("news3");
        return mv;
    }
//前台--look某一个--下载附件
    @RequestMapping(value = "/download2", method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(HttpServletRequest request, String filename) throws IOException {
        String realPath = "F:\\schoolimages";//获取下载文件的路径
        File file = new File(realPath, filename);//把下载文件构成一个文件处理   filename:前台传过来的文件名称

        HttpHeaders headers = new HttpHeaders();//设置头信息
        String downloadFileName = new String(filename.getBytes("UTF-8"), "iso-8859-1");//设置响应的文件名

        headers.setContentDispositionFormData("attachment", downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        // MediaType:互联网媒介类型 contentType：具体请求中的媒体类型信息
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
//    新闻咨询管理--查询
    @RequestMapping("/search")
    public ModelAndView search(String title,String time){
        ModelAndView mv=new ModelAndView();
        List<News> news =newsService.search(title,time);
        mv.addObject("news",news);
        mv.setViewName("admin/adminnews");
        return mv;
    }
//新闻咨询管理--修改编辑页面
    @RequestMapping(value = "/modify2/{id}",method = RequestMethod.POST)
    public ModelAndView modify2(String title, String context,String newstypeid,@PathVariable("id") String id){
        ModelAndView mv=new ModelAndView();
        newsService.modify2(title,context,newstypeid,id);
        mv.setViewName("redirect:/news/show");
        return mv;
    }
//新闻咨询管理--点击编辑（进入编辑页面adminnewschange）
@RequestMapping("/modify1/{id}")
public String modify1(Model model,@PathVariable Integer id){
      News news= newsService.modify1(id);
    model.addAttribute("news",news);
    return "admin/adminnewschange";
}

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
                                   String title, String context,String newstypeid, HttpServletRequest request) throws IllegalStateException, IOException {
        ModelAndView mv=new ModelAndView();
        String realPath = "F:\\schoolimages";
        File f=new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }
        String fileName= UUID.randomUUID().toString().replaceAll("-", "")+file.getOriginalFilename();
        User user=(User) session.getAttribute("user1");
        int newstypename = Integer.parseInt(newstypeid);

        newsService.upload(title,context,new Date(),user.getId(),newstypename,fileName);

        file.transferTo(new File(realPath+"/"+fileName));
        mv.addObject("filePath",fileName);
        mv.setViewName("redirect:/news/show");
        return mv;
    }


//    新闻咨询管理--显示所有新闻
    @RequestMapping("/show")
    public ModelAndView show(
            @RequestParam(required=true,value="pageNum",defaultValue="1") Integer pageNum,
            @RequestParam(required=true,value="pageSize",defaultValue="5") Integer pageSize
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
