package com.hsxy.secondhand.service;

import com.hsxy.secondhand.mapper.SecondMapper;
import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SecondService {
    @Autowired
    private SecondMapper secondMapper;


    public List<Second> show() {
       return secondMapper.show();
    }
    public Integer message() {
       return secondMapper.message();
    }
    public List<Message> messages() {
       return secondMapper.messages();
    }

    public List<Second> getMessage() {
        return secondMapper.getMessage();
    }
}
