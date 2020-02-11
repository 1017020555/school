<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminnewschange</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        #f1 input{
            width: 200px;
            margin-left: 300px;
        }
        #f1 textarea{
            width: 500px;
            height: 300px;
            margin-left: 200px;
        }
    </style>
</head>
<body>

<form id="f1" method="post" action="${pageContext.request.contextPath}/compition/modify2/${compition.id}">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>学院：</td>
            <td>
                <select class="form-control" style="width: 120px;" name="typeid">
                    <option value="1" <c:if test="${compition.typeid=='1'}">selected</c:if>>文学院</option>
                    <option value="2" <c:if test="${compition.typeid=='2'}">selected</c:if>>生命与环境科学学院</option>
                    <option value="3" <c:if test="${compition.typeid=='3'}">selected</c:if>>旅游学院</option>
                    <option value="4" <c:if test="${compition.typeid=='4'}">selected</c:if>>信息工程学院</option>
                    <option value="5" <c:if test="${compition.typeid=='5'}">selected</c:if>>经济管理学院</option>
                    <option value="6" <c:if test="${compition.typeid=='6'}">selected</c:if>>艺术学院</option>
                    <option value="7" <c:if test="${compition.typeid=='7'}">selected</c:if>>外国语学院</option>
                    <option value="8" <c:if test="${compition.typeid=='8'}">selected</c:if>>数学与统计学院</option>
                    <option value="9" <c:if test="${compition.typeid=='9'}">selected</c:if>>化学化工学院</option>
                    <option value="10" <c:if test="${compition.typeid=='10'}">selected</c:if>>体育学院</option>
                    <option value="11" <c:if test="${compition.typeid=='11'}">selected</c:if>>教育科学学院</option>
                    <option value="12" <c:if test="${compition.typeid=='12'}">selected</c:if>>建筑工程学院</option>
                    <option value="13" <c:if test="${compition.typeid=='13'}">selected</c:if>>马克思主义学院</option>
                    <option value="14" <c:if test="${compition.typeid=='14'}">selected</c:if>>文化与传播学院</option>
                    <option value="15" <c:if test="${compition.typeid=='15'}">selected</c:if>>机电工程学院</option>
                    <option value="16" <c:if test="${compition.typeid=='16'}">selected</c:if>>国际教育学院（继续教育学院）</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>标题</td>
            <td>
                <input class="form-control" name="title" type="text" value="${compition.title}">
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td>
                <textarea class="form-control" name="context">${compition.context}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" style="margin-left: 400px;" class="form-control" value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
