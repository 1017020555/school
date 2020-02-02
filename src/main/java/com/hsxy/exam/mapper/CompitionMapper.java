package com.hsxy.exam.mapper;

import com.hsxy.exam.pojo.Compition;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CompitionMapper {

    List<Compition> show();

    void add(@Param("title") String title, @Param("context") String context,
             @Param("time") Date time,@Param("userid") Integer userid);

    void delete(@Param("id") Integer id);

    Compition modify1(Integer id);

    void modify2(@Param("title")String title, @Param("context") String context,@Param("id") String id);

}
