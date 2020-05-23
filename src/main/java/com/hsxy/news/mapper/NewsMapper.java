package com.hsxy.news.mapper;

import com.hsxy.news.pojo.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface NewsMapper {

    List fb();

    void upload(@Param("title") String title, @Param("context") String context, @Param("time") Date date,
                @Param("userid") Integer id, @Param("newstypeid") int newstypename, @Param("file") String fileName,@Param("path") String pathName);

    void upload2(@Param("id") Integer id, @Param("title") String title, @Param("context") String context, @Param("time") Date date,
                 @Param("userid") Integer userid, @Param("newstypeid") int newstypename, @Param("file") String fileName,@Param("path") String pathName);

    List<News> show();

    void delete(@Param("id") Integer id);

    News modify1(@Param("id") Integer id);

    void modify2(@Param("title") String title, @Param("context") String context,
                 @Param("newstypeid") String newstypeid,@Param("id") String id);

    List<News> search(@Param("title") String title, @Param("time") String time);

    List<News> index();

    List<News> getMessage2(@Param("newstypeid") String newstypeid);

    News look(String id);

    List<News> search1(@Param("time") String time);
    List<News> search2(@Param("title") String title);


}
