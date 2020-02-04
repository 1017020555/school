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
    <a href="#" class="list-group-item active">
        丢失物品：
    </a>
    <a href="#" class="list-group-item">捡到物品：</a>
    <a href="#" class="list-group-item">失物招领流程：</a>
</div>


</body>
</html>
