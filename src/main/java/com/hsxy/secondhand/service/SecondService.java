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

    public List<Second> search1(String name, String time, String categoryid) {
        if (name!="" && time !=""){
           return secondMapper.search1(name,time,categoryid);
        }else if(name!="" && time==""){
            return secondMapper.search2(name,categoryid);
        }else if (name=="" && time!=""){
            return secondMapper.search3(time,categoryid);
        }else {
            return secondMapper.search4(categoryid);
        }
    }

}
