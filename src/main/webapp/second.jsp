<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/15
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>second</title>

    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div style="width: 300px;margin-left: 140px;margin-top: 50px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#">商品分类：</a></li>
        <li role="presentation"><a href="#">Profile</a></li>
        <li role="presentation"><a href="#">Messages</a></li>
        <li role="presentation"><a href="#">Profile</a></li>
        <li role="presentation"><a href="#">Messages</a></li>
        <li role="presentation"><a href="#">Profile</a></li>
        <li role="presentation"><a href="#">Messages</a></li>
    </ul>
</div>

<div style="width: 600px;margin-left: 570px;margin-top: -296px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#">二手物品信息：</a></li>

        <span>title</span><br>
        <span>context</span>

    </ul>
</div>

<div style="width: 300px;margin-left: 140px;margin-top: 230px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#">最新二手：</a></li>

        <div style="width: 200px;height: 200px;">
            <img src="img/one.jpg" alt="is" class="img-thumbnail">
            <span>name</span><br>
            <span>price</span>
        </div>
        <div style="width: 200px;height: 200px;">
            <img src="img/one.jpg" alt="is" class="img-thumbnail">
            <span>name</span><br>
            <span>price</span>
        </div>
    </ul>
</div>

</body>
</html>
