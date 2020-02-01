package com.hsxy.exam.mapper;

import com.hsxy.exam.pojo.Compition;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompitionMapper {

    List<Compition> show();

}
