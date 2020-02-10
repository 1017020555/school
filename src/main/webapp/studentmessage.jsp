<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div >
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
            性别：<input type="text" readonly="readonly" class="form-control" value="${user1.gender}">
        </li>
        <li class="list-group-item">
            Email：<input type="text" class="form-control" value="${user1.email}">
        </li>
        <li class="list-group-item">
            phone：<input type="text"  class="form-control" value="${user1.phone}">
        </li>
        <li class="list-group-item">
            学院：<input type="text" readonly="readonly" class="form-control" value="${user1.departmentid}">
        </li>
        <li class="list-group-item">
           --->> <input type="submit" value="修改" class="form-control"
                        >
        </li>
    </ul>
</div>
</body>
</html>
