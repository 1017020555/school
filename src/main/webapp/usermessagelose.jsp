<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/10
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>


    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active">
            <a href="#">Home</a>
        </li>

        物品名称：goodname
        <input class="form-control" style="width: 100px;">
        捡到时间：goodfindtime
        <input class="form-control" style="width: 100px;">
        捡到地点：place
        <input class="form-control" style="width: 100px;">
        所属类型：typename
        <select class="form-control" style="width: 200px;margin-left: 370px;">
            <%--                <c:forEach items="${list}" var="l">--%>
            <option name="xueyuan" id="xueyuan"
            <%--                            <c:if test="${user1.xueyuan==l}">selected</c:if>--%>
            >${l}
            </option>
            <%--                </c:forEach>--%>
        </select>
        物品描述：applyexplain
        <input class="form-control" style="width: 100px;">
        图片：picture
        <input class="form-control" style="width: 100px;">

    </ul>




</body>
</html>
