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

    public void upload(String title, String content, Date date, Integer id, int newstypename, String fileName) {
        String context=content;
        newsMapper.upload(title,context,date,id,newstypename,fileName);
    }

    public List<News> show() {
        return newsMapper.show();
    }

    public void delete(Integer id) {
        newsMapper.delete(id);
    }
}
