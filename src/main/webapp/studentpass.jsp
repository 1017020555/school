<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/11
  Time: 19:28
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

    <style type="text/css">
        #f1 input{
            width: 200px;
        }
    </style>
</head>
<body>

<form id="f1" method="post" action="${pageContext.request.contextPath}/user/changepass" >
    <ul class="list-group nav nav-pills nav-stacked" id="u1">
        <li role="presentation" class="active">
            <a href="javascript:void(0)">修改密码：</a>
        </li>
        <li class="list-group-item">
            新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="p1" name="p1" class="form-control" style="display: inline;">
        </li>
        <li class="list-group-item">
            确认新密码：<input type="text" id="p2" name="p2" class="form-control" style="display: inline;">
            <span style="display: inline;" id="p22"></span>
        </li>
        <li class="list-group-item">
            --->> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="p3" value="修改" class="form-control"style="display: inline;">
        </li>
    </ul>

</form>

<script>
    $(function () {

        $("#p2").blur(function () {
            var p1=$("#p1").val();
            var p2=$("#p2").val();
            if (p1!=p2){
                $("#p22").text("两次密码不一致");
                $("#p3").attr("disabled",true);
            }else {
                $("#p22").text("密码一致");
                $("#p3").attr("disabled",false);
            }
        });
    });
</script>
</body>
</html>
