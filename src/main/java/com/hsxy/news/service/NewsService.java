package com.hsxy.news.service;

import com.hsxy.news.mapper.NewsMapper;
import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {
    @Autowired
    private NewsMapper newsMapper;

    public List fb() {

        return newsMapper.fb();
    }
}
