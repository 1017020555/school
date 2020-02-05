package com.hsxy.lose.mapper;

import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
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

    List<Good> searchgoods(@Param("typeid")String typeid,@Param("goodname") String goodname,@Param("time") String time);
    List<Good> searchgoods2(@Param("typeid")String typeid);
    List<Good> searchgoods3(@Param("typeid")String typeid, @Param("time") String time);
    List<Good> searchgoods4(@Param("typeid")String typeid,@Param("goodname") String goodname);

    void loselose2(@Param("applytime") Date applytime,@Param("applyexplain") String applyexplain,
                   @Param("userid") Integer userid,@Param("picture") String fileName,@Param("place") String place,
                   @Param("name") String name,@Param("typeid") String typeid);
    void losefound2(@Param("goodname") String goodname,@Param("typeid") String typeid,@Param("userid") Integer userid,
                   @Param("goodexplain") String goodexplain,@Param("time") Date time,
                    @Param("place") String place, @Param("photo")String photo);

}
