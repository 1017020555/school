<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/2/1
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminexamadd</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <style type="text/css">
        #f1 input{
            width: 200px;
            margin-left: 300px;
        }
        #f1 textarea{
            width: 500px;
            height: 300px;
            margin-left: 200px;
        }
    </style>
</head>
<body>

    <form id="f1" method="post" action="${pageContext.request.contextPath}/compition/add">
        <table class="table table-bordered table-striped" style="text-align: center;">
            <tr>
                <td>学院：</td>
                <td>
                    <select class="form-control" style="width: 120px;" name="typeid">
                        <option value="1" >文学院</option>
                        <option value="2" >生命与环境科学学院</option>
                        <option value="3" >旅游学院</option>
                        <option value="4" >信息工程学院</option>
                        <option value="5" >经济管理学院</option>
                        <option value="6" >艺术学院</option>
                        <option value="7" >外国语学院</option>
                        <option value="8" >数学与统计学院</option>
                        <option value="9" >化学化工学院</option>
                        <option value="10">体育学院</option>
                        <option value="11">教育科学学院</option>
                        <option value="12">建筑工程学院</option>
                        <option value="13">马克思主义学院</option>
                        <option value="14">文化与传播学院</option>
                        <option value="15">机电工程学院</option>
                        <option value="16">国际教育学院（继续教育学院）</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>标题：</td>
                <td>
                    <input class="form-control" name="title" type="text">
                </td>
            </tr>
            <tr>
                <td>内容：</td>
                <td>
                    <textarea class="form-control" name="context"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" style="margin-left: 400px;" class="form-control" value="发布" id="change">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
