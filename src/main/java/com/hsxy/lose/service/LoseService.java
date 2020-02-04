package com.hsxy.lose.service;

import com.hsxy.lose.mapper.LoseMapper;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LoseService {

    @Autowired
    private LoseMapper loseMapper;


    public List<Apply> getMessage() {
        return loseMapper.getMessage();
    }

    public List getAllTypes() {
        return loseMapper.getAllTypes();
    }

    public List<Apply> search(String typeid, String name, String applytime) {
        if (name == "" && applytime == "") {
            return loseMapper.search2(typeid);
        } else if (name == "" && applytime != "") {
            return loseMapper.search3(typeid,applytime);
        } else if (name != "" && applytime == "") {
            return loseMapper.search4(typeid,name);
        }else {
            return loseMapper.search(typeid, name, applytime);
        }
    }

}
