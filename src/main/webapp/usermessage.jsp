<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/8
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>usermessage</title>
    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>

    <div style="margin-left: 170px;margin-top:50px;width: 200px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#">用户中心</a></li>
            <li role="presentation"><a href="#">个人资料</a></li>
            <li role="presentation"><a href="#">修改密码</a></li>
            <li role="presentation"><a href="#">发布失物申请</a></li>
            <li role="presentation"><a href="#">发布二手申请</a></li>
            <li role="presentation"><a href="#">安全退出</a></li>
        </ul>
    </div>

    <div style="margin-left: 550px;margin-top:-300px;width: 600px;">

        <iframe frameborder="0" scrolling="yes" style="width:100%;height:100%" src="usermessagelose.jsp"></iframe>
    </div>
</body>
</html>
