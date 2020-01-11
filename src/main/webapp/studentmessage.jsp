<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/11
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <style type="text/css">
        #u1 input{
            width: 200px;
            margin-left: 90px;
            margin-top: -23px;
        }
    </style>
</head>
<body>

    <ul class="list-group nav nav-pills nav-stacked" id="u1">
        <li role="presentation" class="active">
            <a href="javascript:void(0)">个人资料：</a>
        </li>
        <li class="list-group-item">
            学号：<input type="text" readonly="readonly" class="form-control">
        </li>
        <li class="list-group-item">
            姓名：<input type="text" readonly="readonly" class="form-control">
        </li>
        <li class="list-group-item">
            性别：<input type="text" readonly="readonly" class="form-control">
        </li>
        <li class="list-group-item">
            Email：<input type="text" class="form-control">
        </li>
        <li class="list-group-item">
            phone：<input type="text"  class="form-control">
        </li>
        <li class="list-group-item">
            学院：<input type="text" readonly="readonly" class="form-control">
        </li>
        <li class="list-group-item">
           --->> <input type="submit" value="修改" class="form-control">
        </li>
    </ul>

</body>
</html>
