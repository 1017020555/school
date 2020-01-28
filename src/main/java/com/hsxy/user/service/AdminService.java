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

    public List<User> look(String name, String username) {
        return adminMapper.look(name,username);
    }

    public User adminmessagechange(Integer id) {
        return adminMapper.adminmessagechange(id);
    }

    public Integer adminmessagechange2(User user) {
        return adminMapper.adminmessagechange2(user);
    }

    public void admindelete(Integer id) {
        adminMapper.admindelete(id);
    }
}
