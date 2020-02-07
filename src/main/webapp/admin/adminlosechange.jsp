<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminlosechange</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        #f1 input{
            width: 150px;
        }
    </style>
</head>

<body>

<form id="f1" method="post" action="${pageContext.request.contextPath}/lose/modify3/${apply.applyid}">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>丢失物品名称：</td>
            <td>
                <input class="form-control" name="name" type="text" value="${apply.name}">
            </td>
        </tr>
        <tr>
            <td>丢失时间：</td>
            <td>
                <fmt:formatDate value="${apply.applytime}" pattern="yyyy-MM-dd"/>
            </td>
        </tr>
        <tr>
            <td>描述：</td>
            <td>
                <textarea class="form-control" name="applyexplain" cols="8" rows="8">${apply.applyexplain}</textarea>
            </td>
        </tr>
        <tr>
            <td>丢失地点</td>
            <td>
                <input class="form-control" name="place" type="text" value="${apply.place}">
            </td>
        </tr>
        <tr>
            <td>类型：</td>
            <td>
                <select class="form-control" style="width: 120px;" name="typeid">
                        <option value="1" <c:if test="${apply.typeid=='1'}">selected</c:if>>校园卡</option>
                        <option value="2" <c:if test="${apply.typeid=='2'}">selected</c:if>>银行卡</option>
                        <option value="3" <c:if test="${apply.typeid=='3'}">selected</c:if>>U盘</option>
                        <option value="4"<c:if test="${apply.typeid=='4'}">selected</c:if>>现金或钱包</option>
                        <option value="5" <c:if test="${apply.typeid=='5'}">selected</c:if>>钥匙</option>
                        <option value="6"<c:if test="${apply.typeid=='6'}">selected</c:if>>手机</option>
                        <option value="7" <c:if test="${apply.typeid=='7'}">selected</c:if>>包包或服饰</option>
                        <option value="8"<c:if test="${apply.typeid=='8'}">selected</c:if>>图书资料</option>
                        <option value="9" <c:if test="${apply.typeid=='9'}">selected</c:if>>生活用品</option>
                        <option value="10"<c:if test="${apply.typeid=='10'}">selected</c:if>>其它物品</option>
                        <option value="11"<c:if test="${apply.typeid=='11'}">selected</c:if>>眼镜</option>
                        <option value="12"<c:if test="${apply.typeid=='12'}">selected</c:if>>身份证</option>
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
