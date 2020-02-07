package com.hsxy.secondhand.service;

import com.hsxy.secondhand.mapper.SecondMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecondService {
    @Autowired
    private SecondMapper secondMapper;


}
