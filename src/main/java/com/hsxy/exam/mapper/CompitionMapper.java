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
             @Param("time") Date time, @Param("userid") Integer userid,@Param("typeid") String typeid);

    void delete(@Param("id") Integer id);

    Compition modify1(Integer id);

    void modify2(@Param("title") String title, @Param("context") String context,@Param("typeid") String typeid ,@Param("id") String id);

    List<Compition> search(@Param("title")String title,@Param("time") String time);

    List<Compition> getMessage();
    List<Compition> getMessage2(@Param("typeid") String typeid);

    Compition look(@Param("id") String id);
    void look2(@Param("count") int count,@Param("id") String id);

    List<Compition> index();

}
