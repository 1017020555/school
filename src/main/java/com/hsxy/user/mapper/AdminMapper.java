package com.hsxy.user.mapper;

import com.hsxy.user.pojo.Params;
import com.hsxy.user.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    List xy();

    List<User> user();

    Integer modify(@Param("user") User user, @Param("id") Integer id);

    List<User> look(String name, String username);

}
