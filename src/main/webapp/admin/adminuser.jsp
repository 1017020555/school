<%@ page import="com.hsxy.user.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>adminuser</title>

    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


</head>
<body>

<table class="table table-bordered table-striped" style="text-align: center;">
    <tr>
        <td>学号</td>
        <td>
            <input type="text" value="${user1.username}">
        </td>
    </tr>
    <tr>
        <td>密码</td>
        <td>
            <input type="text" value="${user1.password}">
        </td>
    </tr>
    <tr>
        <td>姓名</td>
        <td><input type="text" value="${user1.name}"></td>
    </tr>
    <tr>
        <td>性别</td>
        <td>
            <c:if test="${user1.gender==1}">
                <input type="radio" name="gender" checked="checked">&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender">&nbsp;&nbsp;&nbsp;女
            </c:if>
            <c:if test="${user1.gender==0}">
                <input type="radio" name="gender">&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="gender" checked="checked">&nbsp;&nbsp;&nbsp;女
            </c:if>
        </td>
    </tr>
    <tr>
        <td>Email</td>
        <td>
            <input type="text" value="${user1.email}">
        </td>
    </tr>
    <tr>
        <td>电话</td>
        <td>
            <input type="text" value="${user1.phone}">
        </td>
    </tr>
    <tr>
        <td>所属学院</td>
        <td>
            <select class="form-control" style="width: 200px;margin-left: 370px;">
                <c:forEach items="${list}" var="l">
                        <option
                                <c:if test="${user1.xueyuan==l}">selected</c:if>
                        >${l}
                        </option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="button" value="修改">
        </td>
    </tr>
</table>

</body>
</html>
