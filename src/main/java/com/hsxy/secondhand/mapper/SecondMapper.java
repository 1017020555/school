package com.hsxy.secondhand.mapper;

import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface SecondMapper {

    List<Second> show();

    Integer message();

    List<Message> messages();

    List<Second> getMessage();
    List<Second> getMessage2(@Param("categoryid") String categoryid);

    List<Second> search1(@Param("name") String name,@Param("time") String time,@Param("categoryid") String categoryid);
    List<Second> search2(@Param("name") String name,@Param("categoryid") String categoryid);
    List<Second> search3(@Param("time") String time,@Param("categoryid") String categoryid);
    List<Second> search4(@Param("categoryid") String categoryid);


    List<Message> searchcomment1(@Param("userid") String userid,@Param("time") String time);
    List<Message> searchcomment2(@Param("userid") String userid);
    List<Message> searchcomment3(@Param("time") String time);
    List<Message> searchcomment4();

    void delete(@Param("id") Integer id);
    Second modify(@Param("id") Integer id);
    void modify2(@Param("name") String name, @Param("context") String context,
                 @Param("price") String price, @Param("categoryid") String categoryid,@Param("id") String id);

    void delete2(@Param("id") Integer id);
    Message modify3(@Param("id")Integer id);
    void modify4(@Param("context") String context,@Param("id") String id);

    void fb(@Param("name") String name,@Param("categoryid") String categoryid, @Param("context") String context,
            @Param("userid") Integer userid,@Param("time") Date time,@Param("price") String price,
            @Param("photo") String photo);

}
