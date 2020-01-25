package com.hsxy.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hsxy.user.mapper.AdminMapper;
import com.hsxy.user.pojo.Params;
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


    public List<User> user() {

        return adminMapper.user();
    }

    public Boolean modify(User user, Integer id) {
        Integer i= adminMapper.modify(user,id);
        if (i>0){
          return true;
        }else {
            return false;
        }
    }
}
