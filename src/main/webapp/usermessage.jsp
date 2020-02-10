<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/8
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>usermessage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>

    <div id="d1" style="margin-left: 170px;margin-top:50px;width: 200px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">用户中心</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentpass.jsp">修改密码</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/lose/loselose">发布失物申请</a></li>
            <li role="presentation"><a href="#">发布二手申请</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/user/unload">安全退出</a></li>
        </ul>
    </div>

    <div style="margin-left: 550px;margin-top:-300px;width: 600px;">
        <iframe frameborder="0" scrolling="yes" style="width:100%;height:100%" src="studentmessage.jsp"></iframe>
    </div>

    <script>
        $(function(){
            $("#d1 a").on("click",function(){
                var address =$(this).attr("class");
                $("iframe").attr("src",address);
            });
        });
    </script>

</body>
</html>
