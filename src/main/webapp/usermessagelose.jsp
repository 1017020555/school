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
            <a href="#">新增失物招领：</a>
        </li>

        <label>物品名称：goodname</label>
        <input type="text" class="form-control" style="width: 300px;">
        <label>捡到时间：goodfindtime</label>
        <input type="date" class="form-control" style="width: 300px;">
            <label>捡到地点：place</label>
        <input class="form-control" style="width: 300px;">
            <label>所属类型：typename</label>

        <select class="form-control" style="width: 200px;">
            <%--                <c:forEach items="${list}" var="l">--%>
            <option name="xueyuan" id="xueyuan"
            >${l}
            </option>
            <%--                </c:forEach>--%>
        </select>

            <label>物品描述：applyexplain</label>
        <textarea style="width: 400px;height: 200px" class="form-control"></textarea>

        <label> 图片：picture</label>
        <input type="file" class="form-control" >

    </ul>




</body>
</html>
