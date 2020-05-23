<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminlosechange</title>
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
<form id="f1" method="post" action="${pageContext.request.contextPath}/second/modify2/${second.id}">
    <table class="table table-hover" style="text-align: center;">
        <tr>
            <td>物品名称：</td>
            <td>
                <input class="form-control" name="name" type="text" value="${second.name}">
            </td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td>
                <fmt:formatDate value="${second.time}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td>描述：</td>
            <td>
                <textarea class="form-control" name="context" cols="8" rows="8">${second.context}</textarea>
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input class="form-control" name="price" type="text" value="${second.price}">
            </td>
        </tr>
        <tr>
            <td>类型：</td>
            <td>
                <select class="form-control" style="width: 120px;" name="categoryid">
                        <option value="1" <c:if test="${second.categoryid=='1'}">selected</c:if>>手机数码</option>
                        <option value="2" <c:if test="${second.categoryid=='2'}">selected</c:if>>智能设备及3C配件</option>
                        <option value="3" <c:if test="${second.categoryid=='3'}">selected</c:if>>服饰配件</option>
                        <option value="4"<c:if test="${second.categoryid=='4'}">selected</c:if>>书籍</option>
                        <option value="5" <c:if test="${second.categoryid=='5'}">selected</c:if>>食品</option>
                        <option value="6"<c:if test="${second.categoryid=='6'}">selected</c:if>>运动户外</option>
                        <option value="7" <c:if test="${second.categoryid=='7'}">selected</c:if>>生活用品</option>
                        <option value="8"<c:if test="${second.categoryid=='8'}">selected</c:if>>游戏设备</option>
                        <option value="9" <c:if test="${second.categoryid=='9'}">selected</c:if>>健身器材</option>
                        <option value="10"<c:if test="${second.categoryid=='10'}">selected</c:if>>其它物品</option>
                </select>
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
