package com.hsxy.exam.service;

import com.hsxy.exam.mapper.CompitionMapper;
import com.hsxy.exam.pojo.Compition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompitionService {
    @Autowired
    private CompitionMapper compitionMapper;

    public List<Compition> show() {
        return compitionMapper.show();
    }

}
