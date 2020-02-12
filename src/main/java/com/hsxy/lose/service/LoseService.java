package com.hsxy.lose.service;

import com.hsxy.lose.mapper.LoseMapper;
import com.hsxy.lose.pojo.Apply;
import com.hsxy.lose.pojo.Good;
import com.hsxy.lose.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LoseService {

    @Autowired
    private LoseMapper loseMapper;


    public List<Apply> getMessage() {
        return loseMapper.getMessage();
    }

    public List getAllTypes() {
        return loseMapper.getAllTypes();
    }

    public List<Apply> search(String typeid, String name, String applytime) {
        if (name == "" && applytime == "") {
            return loseMapper.search2(typeid);
        } else if (name == "" && applytime != "") {
            return loseMapper.search3(typeid,applytime);
        } else if (name != "" && applytime == "") {
            return loseMapper.search4(typeid,name);
        }else {
            return loseMapper.search(typeid, name, applytime);
        }
    }
    public List<Good> searchgoods(String typeid, String goodname, String time) {
        if (goodname == "" && time == "") {
            return loseMapper.searchgoods2(typeid);
        } else if (goodname == "" && time != "") {
            return loseMapper.searchgoods3(typeid,time);
        } else if (goodname != "" && time == "") {
            return loseMapper.searchgoods4(typeid,goodname);
        }else {
            return loseMapper.searchgoods(typeid, goodname, time);
        }
    }

    public void loselose2(Date applytime, String applyexplain, Integer userid, String fileName, String place, String name, String typeid) {
        loseMapper.loselose2(applytime,applyexplain,userid,fileName,place,name,typeid);
    }

    public void losefound2(Date applytime, String goodexplain, Integer userid, String fileName, String place, String goodname, String typeid) {
        loseMapper.losefound2(goodname,typeid,userid,goodexplain,applytime,place,fileName);
    }

    public List<Apply> htsearch(String name, String applytime) {
        if (name!="" && applytime!=""){
            return loseMapper.htsearch2(name,applytime);
        }else if(name=="" && applytime!=""){
            return loseMapper.htsearch3(applytime);
        }else if(name!="" && applytime==""){
            return loseMapper.htsearch4(name);
        }else {
            return loseMapper.htsearch5();
        }
    }
    public List<Good> htsearchgoods(String goodname, String time) {
        if (goodname!="" && time!=""){
            return loseMapper.htsearchgoods2(goodname,time);
        }else if(goodname=="" && time!=""){
            return loseMapper.htsearchgoods3(time);
        }else if(goodname!="" && time==""){
            return loseMapper.htsearchgoods4(goodname);
        }else {
            return loseMapper.htsearchgoods5();
        }
    }

//
    public void delete(Integer id) {
        loseMapper.delete(id);
    }
    public Apply modify2(Integer applyid) {
        return loseMapper.modify2(applyid);
    }
    public void modify3(String name, String applyexplain, String place, String typeid, String id) {
        loseMapper.modify3(name,applyexplain,place,typeid,id);
    }

    public void delete2(Integer id) {
        loseMapper.delete2(id);
    }
    public Good modify4(Integer id) {
        return loseMapper.modify4(id);
    }
    public void modify5(String goodname, String goodexplain, String place, String typeid, String id) {
        loseMapper.modify5(goodname,goodexplain,place,typeid,id);
    }

    //

    public List<Apply> index() {
        return loseMapper.index();
    }


    public List<Apply> my(Integer id) {
        return loseMapper.my(id);
    }
}
