package com.hsxy.user.service;

import com.hsxy.user.mapper.AdminMapper;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List xy() {
      return adminMapper.xy();
    }
}
