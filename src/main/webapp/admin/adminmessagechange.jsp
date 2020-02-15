<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/28
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>adminmessagechange</title>
</head>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<body>

<form method="post" action="${pageContext.request.contextPath}/admin/adminmessagechange2">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>id</td>
            <td>
                <input id="id" name="id" type="text" value="${user.id}" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td>学号</td>
            <td>
                <input id="username" name="username" type="text" value="${user.username}">
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td>
                <input id="password" name="password" type="text" value="${user.password}">
            </td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input id="name" name="name" type="text" value="${user.name}"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <c:if test="${user.gender==1}">
                    <input type="radio" name="gender" checked="checked" value="1">&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="0">&nbsp;&nbsp;&nbsp;女
                </c:if>
                <c:if test="${user.gender==0}">
                    <input type="radio" name="gender" value="1">&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" checked="checked" value="0">&nbsp;&nbsp;&nbsp;女
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input id="email" name="email" type="email" value="${user.email}">
            </td>
        </tr>
        <tr>
            <td>电话</td>
            <td>
                <input id="phone" name="phone" type="tel" value="${user.phone}">
            </td>
        </tr>
        <tr>
            <td>所属学院</td>
            <td>
                <select class="form-control" style="width: 200px;margin-left: 370px;" name="departmentid" id="departmentid">
                    <c:forEach items="${list}" var="l">
                        <option  value="${l}"
                                 <c:if test="${user.departmentid==l}">selected</c:if>
                        >
                                ${l}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"  value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
