<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2019/12/30
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/user.css"/>

</head>
<body>

    <jsp:include page="head.jsp"></jsp:include>



<form class="form-horizontal">

        <img id="img"  src="img/banner.jpg" class="img-thumbnail">

    <div class="form-group">
        <label id="e1" for="inputEmail3" class="col-sm-2 control-label">学号:</label>
        <div class="col-sm-10">
            <input type="email" style="width: 210px;" class="form-control" id="inputEmail3" placeholder="请输入学号：">
        </div>
    </div>

    <div class="form-group">
        <label id="e2" for="inputPassword3" class="col-sm-2 control-label">密码：</label>
        <div class="col-sm-10">
            <input type="password" style="width: 210px;" class="form-control" id="inputPassword3" placeholder="请输入密码：">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox" id="e3">
                <label>
                    <input  type="checkbox"> 记住密码
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10" id="e4">
            <button  type="submit" class="btn btn-default">登陆</button>
        </div>
    </div>

</form>

</body>
</html>
