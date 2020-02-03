package com.hsxy.lose.service;

import com.hsxy.lose.mapper.LoseMapper;
import com.hsxy.lose.pojo.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoseService {

    @Autowired
    private LoseMapper loseMapper;


    public List<Apply> getMessage() {
        return loseMapper.getMessage();
    }
}
