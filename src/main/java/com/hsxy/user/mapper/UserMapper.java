package com.hsxy.user.mapper;

import com.hsxy.user.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    public User up(User user);

    public Integer changepass(@Param("id") Integer id,@Param("password") String password);

    void changemess(@Param("email") String email, @Param("phone") String phone,@Param("id") Integer id);

}
