package com.hsxy.secondhand.mapper;

import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecondMapper {

    List<Second> show();

    Integer message();

    List<Message> messages();

    List<Second> getMessage();
}
