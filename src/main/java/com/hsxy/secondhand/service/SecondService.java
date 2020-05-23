package com.hsxy.secondhand.service;

import com.hsxy.secondhand.mapper.SecondMapper;
import com.hsxy.secondhand.pojo.Message;
import com.hsxy.secondhand.pojo.Second;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SecondService {
    @Autowired
    private SecondMapper secondMapper;


    public List<Second> show() {
       return secondMapper.show();
    }
    public Integer message() {
       return secondMapper.message();
    }
    public List<Message> messages() {
       return secondMapper.messages();
    }

    public List<Second> getMessage() {
        return secondMapper.getMessage();
    }
    public List<Second> getMessage2(String categoryid) {
        return secondMapper.getMessage2(categoryid);
    }


    public List<Second> search1(String name, String time, String categoryid) {
        if (name!="" && time !=""){
           return secondMapper.search1(name,time,categoryid);
        }else if(name!="" && time==""){
            return secondMapper.search2(name,categoryid);
        }else if (name=="" && time!=""){
            return secondMapper.search3(time,categoryid);
        }else {
            return secondMapper.search4(categoryid);
        }
    }

    public List<Message> searchcomment1(String time, String userid) {
        if (userid!="" && time!=""){
           return secondMapper.searchcomment1(userid,time);
        }else if (userid!="" && time==""){
           return secondMapper.searchcomment2(userid);
        }else if (userid=="" && time!=""){
            return secondMapper.searchcomment3(time);
        }else {
            return secondMapper.searchcomment4();
        }
    }

    public void delete(Integer id) {
        secondMapper.delete(id);
    }
    public Second modify(Integer id) {
        return secondMapper.modify(id);
    }
    public void modify2(String name, String context, String price, String categoryid,String id) {
        secondMapper.modify2(name,context,price,categoryid,id);
    }

    public void delete2(Integer id) {
        secondMapper.delete2(id);
    }
    public Message modify3(Integer id) {
        return secondMapper.modify3(id);
    }
    public void modify4(String context, String id) {
        secondMapper.modify4(context,id);
    }


    public void fb(String name, String categoryid, String context, Integer userid, Date time, String price, String fileName) {
        secondMapper.fb(name,categoryid,context,userid,time,price,fileName);
    }

    public Second look(String id) {
        return secondMapper.look(id);
    }

    public List<Message> pl(String secondid) {
        return secondMapper.pl(secondid);
    }

    public void de(String id) {
        secondMapper.de(id);
    }

    public void fb2(Integer userid, String context, String secondid, Date time) {
        secondMapper.fb2(userid,context,secondid,time);
    }

    public List<Second> my(Integer userid) {
        return secondMapper.my(userid);
    }

    public List<Second> index() {
        return secondMapper.index();
    }

    public Map<String,Object> count2() {
        return secondMapper.count2();
    }
}
