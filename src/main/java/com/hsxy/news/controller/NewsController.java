package com.hsxy.news.controller;
import com.hsxy.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

//新闻咨询信息管理--发布新闻按钮
    @RequestMapping("/fb")
    public String fb(){

        return "";
    }

}
