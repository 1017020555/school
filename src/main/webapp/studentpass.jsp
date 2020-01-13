<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/11
  Time: 19:28
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

</head>
<body>

        <ul class="list-group nav nav-pills nav-stacked" id="u1">
            <li role="presentation" class="active">
                <a href="javascript:void(0)">修改密码：</a>
            </li>
            <li class="list-group-item">
                新密码：<input type="text" class="form-control">
            </li>
            <li class="list-group-item">
                确认新密码：<input type="text" class="form-control">
            </li>
            <li class="list-group-item">
                --->> <input type="submit" value="修改" class="form-control">
            </li>
        </ul>

</body>
</html>
