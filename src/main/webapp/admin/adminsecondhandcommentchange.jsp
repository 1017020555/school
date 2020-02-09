<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminsecondhandcommentchange</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        #f1 input{
            width: 150px;
        }
    </style>
</head>
<body>
<form id="f1" method="post" action="${pageContext.request.contextPath}/second/modify4/${message.id}">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>发布时间：</td>
            <td>
                <fmt:formatDate value="${message.time}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td>描述：</td>
            <td>
                <textarea class="form-control" name="context" cols="8" rows="8">${message.context}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input style="margin-left: 400px;" type="submit" class="form-control" value="修改">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
