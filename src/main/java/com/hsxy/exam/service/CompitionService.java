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

    public void add(String title, String context, Integer userid) {
        Date time=new Date();
        compitionMapper.add(title,context,time,userid);
    }

    public void delete(Integer id) {
        compitionMapper.delete(id);
    }

    public Compition modify1(Integer id) {
        return compitionMapper.modify1(id);
    }

    public void modify2(String title, String context, String id) {
        compitionMapper.modify2(title,context,id);
    }

    public List<Compition> search(String title, String time) {
        return compitionMapper.search(title,time);
    }
}
