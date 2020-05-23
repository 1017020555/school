package com.hsxy.user.service;
import com.hsxy.user.pojo.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ExcelService {

    public boolean insert(User user);

    String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response);

}
