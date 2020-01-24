package com.hsxy.user.service;

import com.hsxy.user.mapper.UserMapper;
import com.hsxy.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {
    @Autowired
   private UserMapper userMapper;


    public User up(User user) {
        return userMapper.up(user);
    }

    public Integer changepass(Integer id, String p2) {
        String password=p2;
        return userMapper.changepass(id,password);
    }
}
