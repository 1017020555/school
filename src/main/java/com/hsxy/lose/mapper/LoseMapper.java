package com.hsxy.lose.mapper;

import com.hsxy.lose.pojo.Apply;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoseMapper {

    List<Apply> getMessage();

}
