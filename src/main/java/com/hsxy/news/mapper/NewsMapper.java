package com.hsxy.news.mapper;

import com.hsxy.news.pojo.News;
import com.hsxy.news.pojo.Newtype;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface NewsMapper {

    List fb();

    void upload(@Param("title") String title,@Param("context") String context,@Param("time") Date date,
                @Param("userid") Integer id,@Param("newstypeid")int newstypename, @Param("file") String fileName);

    List<News> show();

}
