package com.hsxy.user.mapper;

import com.hsxy.user.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    public User up(User user);

}
