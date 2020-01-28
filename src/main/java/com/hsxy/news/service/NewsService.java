package com.hsxy.news.service;

import com.hsxy.news.mapper.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsService {
    @Autowired
    private NewsMapper newsMapper;


}
