package com.hsxy.user.mapper;

import com.hsxy.user.pojo.Params;
import com.hsxy.user.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    List xy();

    List<User> user();
}
