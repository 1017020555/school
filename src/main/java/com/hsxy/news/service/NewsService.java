package com.hsxy.news.service;

import com.hsxy.news.mapper.NewsMapper;
import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NewsService {
    @Autowired
    private NewsMapper newsMapper;

    public List fb() {

        return newsMapper.fb();
    }

    public void upload(String title, String context, Date date, Integer id, int newstypename, String fileName) {
        newsMapper.upload(title,context,date,id,newstypename,fileName);
    }

    public List<News> show() {
        return newsMapper.show();
    }

    public void delete(Integer id) {
        newsMapper.delete(id);
    }

    public News modify1(Integer id) {
       return newsMapper.modify1(id);
    }

    public void modify2(String title, String context, String newstypeid,String id) {
         newsMapper.modify2(title,context,newstypeid,id);
    }

    public List<News> search(String title, String time) {
        return newsMapper.search(title,time);
    }

    public List<News> index() {
        return newsMapper.index();
    }

    public List<News> getMessage2(String newstypeid) {
        return newsMapper.getMessage2(newstypeid);
    }
    public News look(String id) {
       return newsMapper.look(id);
    }

}
