package com.hsxy.user.service;
import com.hsxy.user.mapper.UserMapper;
import com.hsxy.user.pojo.User;
import com.hsxy.user.utils.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class ExcelServiceImpl implements ExcelService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) {

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("upfile");

        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<List<Object>> listob = null;
        try {
            listob = new ExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            User vo = new User();

            vo.setUsername(String.valueOf(lo.get(0)));     // 表格的第一列   注意数据格式需要对应实体类属性
            vo.setPassword(String.valueOf(lo.get(1)));    // 表格的第二列
            vo.setName(String.valueOf(lo.get(2)));
            if (lo.get(3).equals("男")){
                vo.setGender(1);
            }else {
                vo.setGender(0);
            }
            vo.setEmail(String.valueOf(lo.get(4)));
            vo.setPhone(String.valueOf(lo.get(5)));
            vo.setDepartmentid(String.valueOf(lo.get(6)));

            userMapper.insert(vo);
        }
        System.out.println("文件导入成功！");
        return "文件导入成功！";
    }
}
