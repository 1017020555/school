package com.hsxy.lose.mapper;

import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Type;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface LoseMapper {

    List<Apply> getMessage();

    List getAllTypes();

    List<Apply> search(@Param("typeid") String typeid,@Param("name") String name,@Param("applytime") String applytime);

    List<Apply> search2(@Param("typeid") String typeid);

    List<Apply> search3(@Param("typeid") String typeid, @Param("applytime") String applytime);

    List<Apply> search4(@Param("typeid") String typeid,@Param("name") String name);

}
