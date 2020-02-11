package com.hsxy.exam.service;

import com.hsxy.exam.mapper.CompitionMapper;
import com.hsxy.exam.pojo.Compition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CompitionService {
    @Autowired
    private CompitionMapper compitionMapper;

    public List<Compition> show() {
        return compitionMapper.show();
    }

    public void add(String title, String context, Integer userid, String typeid) {
        Date time=new Date();
        compitionMapper.add(title,context,time,userid,typeid);
    }

    public void delete(Integer id) {
        compitionMapper.delete(id);
    }

    public Compition modify1(Integer id) {
        return compitionMapper.modify1(id);
    }

    public void modify2(String title, String context,String typeid, String id) {
        compitionMapper.modify2(title,context,typeid,id);
    }

    public List<Compition> search(String title, String time) {
        return compitionMapper.search(title,time);
    }

    public List<Compition> getMessage() {
        return compitionMapper.getMessage();
    }
    public List<Compition> getMessage2(String typeid) {
        return compitionMapper.getMessage2(typeid);
    }

    public Compition look(String id) {
        return compitionMapper.look(id);
    }

    public void look2(int c, String id) {
        compitionMapper.look2(c,id);
    }
}
