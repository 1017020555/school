package com.hsxy.secondhand.mapper;

import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecondMapper {

    List<Second> show();

    Integer message();

    List<Message> messages();

    List<Second> getMessage();

    List<Second> search1(@Param("name") String name,@Param("time") String time,@Param("categoryid") String categoryid);
    List<Second> search2(@Param("name") String name,@Param("categoryid") String categoryid);
    List<Second> search3(@Param("time") String time,@Param("categoryid") String categoryid);
    List<Second> search4(@Param("categoryid") String categoryid);


}
