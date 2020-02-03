<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/4
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>lose</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/lose.css"/>


</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div id="title" style="margin-left: 90px;margin-top: 50px;" class="alert alert-info" role="alert">
    <img src="img/img1.png">
    <label>失物招领请注意：</label>
</div>

<div class="list-group" id="lists" style="margin-left: 90px;">
    <a href="#" class="list-group-item active">
        丢失物品：
    </a>
    <a href="#" class="list-group-item">捡到物品：</a>
    <a href="#" class="list-group-item">失物招领流程：</a>
</div>


<div id="title2" class="alert alert-info" role="alert" style="margin-top: -200px;">
    <img src="img/img1.png">
    <label>查询条件：</label>
</div>

<div id="title3">
    <label style="margin-left: 8px;">选择丢失物品类别：</label>
    <label>丢失物品名称：</label>
    <label>丢失地点：</label>&nbsp;&nbsp;
    <label>丢失时间：</label>
    <select class="form-control" style="width: 120px;">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>
    <input id="input1" style="width: 120px;" type="text" class="form-control" placeholder="丢失物品名称：">
    <input id="input2" style="width: 120px;" type="text" class="form-control" placeholder="丢失地点：">

    <input id="input3" style="margin-left: 460px;margin-top: -35px;width: 150px;" class="form-control" type="date">
    <input type="submit" class="form-control" style="margin-left: 640px;width: 50px;margin-top: -35px;" value="搜索">
</div>


<div id="title4" class="alert alert-info" role="alert">
    <img src="img/img1.png">
    <label>查询结果：</label>
</div>

<div id="title5" style="margin-left: 500px;width: 600px;">

        <ul class="nav nav-pills nav-stacked">

                <li style="width: 200px;height: 200px;float: left;">
                    <div>
                        <img src="img/1.jpg" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                        <label>地点：</label><br>
                        <label>时间：</label><br>
                        <label>联系人：</label>
                    </div>
                </li>

        </ul>

</div>

</body>
</html>
