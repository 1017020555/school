<%@ page import="com.hsxy.user.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>adminuser</title>

    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style rel="stylesheet" type="text/css">
        #d1 label{
            margin-left: 20px;
        }
        #d1 input{
            width: 200px;
            margin-left: 20px;
            display: inline;
        }
        #d1 select{
            width: 200px;
            display: inline;
        }
    </style>

</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<form id="d1" method="post" action="${pageContext.request.contextPath}/admin/modify">
    <table class="table table-bordered" style="text-align: center;">
        <tr>
            <td>学号</td>
            <td>
                <input id="username" name="username" type="text" value="${user1.username}">
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td>
                <input class="form-control" id="password" name="password" type="text" value="${user1.password}">
            </td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input class="form-control" id="name" name="name" type="text" value="${user1.name}"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <c:if test="${user1.gender==1}">
                    <input type="radio" name="gender" checked="checked" value="1">男
                    <input type="radio" name="gender" value="0">女
                </c:if>
                <c:if test="${user1.gender==0}">
                    <input type="radio" name="gender" value="1">男
                    <input type="radio" name="gender" checked="checked" value="0">女
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input class="form-control" id="email" name="email" type="email" value="${user1.email}">
            </td>
        </tr>
        <tr>
            <td>电话</td>
            <td>
                <input class="form-control" id="phone" name="phone" type="tel" value="${user1.phone}">
            </td>
        </tr>
        <tr>
            <td>所属学院</td>
            <td>
                <select class="form-control" style="width: 200px;" name="departmentid" id="departmentid">
                    <c:forEach items="${list}" var="l">
                        <option  value="${l}"
                                <c:if test="${user1.departmentid==l}">selected</c:if>
                        >
                                ${l}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" style="margin-left: 150px;" class="form-control"  value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
