<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        #u1 input{
            width: 200px;
            margin-left: 90px;
            margin-top: -23px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div id="d1" style="margin-left: 170px;margin-top:50px;width: 200px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">用户中心</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/user/studentmessage">个人资料</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/user/studentpass">修改密码</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/lose/loselose">发布失物申请</a></li>

        <li role="presentation"><a href="${pageContext.request.contextPath}/lose/my">我的失物申请</a></li>

        <li role="presentation"><a href="${pageContext.request.contextPath}/second/tosecond">发布二手申请</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/my">我的二手申请</a></li>

        <li role="presentation"><a href="${pageContext.request.contextPath}/user/unload">安全退出</a></li>
    </ul>
</div>


<div style="width: 600px;margin-left: 550px;margin-top: -325px;">
    <form method="post" action="${pageContext.request.contextPath}/user/changemess" >
        <ul class="list-group nav nav-pills nav-stacked" id="u1">
            <li role="presentation" class="active">
                <a href="javascript:void(0)">个人资料：</a>
            </li>
            <li class="list-group-item">
                学号：<input type="text" readonly="readonly" class="form-control" value="${user1.username}">
            </li>
            <li class="list-group-item">
                姓名：<input type="text" readonly="readonly" class="form-control" value="${user1.name}">
            </li>
            <li class="list-group-item">
                性别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:if test="${user1.gender=='1'}">男</c:if>
                <c:if test="${user1.gender=='0'}">女</c:if>
            </li>
            <li class="list-group-item">
                Email：<input type="text" name="email" class="form-control" value="${user1.email}">
            </li>
            <li class="list-group-item">
                phone：<input type="text" name="phone" class="form-control" value="${user1.phone}">
            </li>
            <li class="list-group-item">
                学院：<input type="text" readonly="readonly" class="form-control" value="${user1.departmentid}">
            </li>
            <li class="list-group-item">
                <p style="color: red;font-weight: bold;">${msg}</p>
               --->> <input type="submit" value="修改" class="form-control">
            </li>
        </ul>
    </form>
</div>
</body>
</html>
