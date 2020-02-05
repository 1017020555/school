<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>lose</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lose.css"/>


</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div id="title" style="margin-left: 90px;margin-top: 50px;" class="alert alert-info" role="alert">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>失物招领请注意：</label>
</div>

<div class="list-group" id="lists" style="margin-left: 90px;">
    <a href="${pageContext.request.contextPath}/lose/loselose" class="list-group-item">
        发布丢失物品通告：
    </a>
    <a href="${pageContext.request.contextPath}/lose/losefound" class="list-group-item">
        发布捡到物品通告：
    </a>
    <a href="${pageContext.request.contextPath}/lose/loseadvice" class="list-group-item active">
        失物招领流程：
    </a>
</div>

<div id="title2" class="alert alert-info" role="alert" style="margin-top: -200px;">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>失物招领须知：</label>
</div>

<div style="margin-left: 500px;width: 600px;">
    保卫处24h电话：<br>
    南校区：	2549110<br>
    北校区：	2549119
</div>

</body>
</html>
