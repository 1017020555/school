<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/8
  Time: 19:15
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

    <link rel="stylesheet" href="css/page.css" />
    <script type="text/javascript" src="js/index.js" ></script>

</head>
<body>

<div class="left">
    <div class="bigTitle">校园服务平台管理系统</div>
    <div class="lines">
        <div onclick="pageClick(this)"  class="active" datasrc="adminsecondhand.jsp">
            <img src="img/icon-1.png" />二手交易模块管理
        </div>
        <div onclick="pageClick(this)" datasrc="adminlose.jsp">
            <img src="img/icon-2.png" />失物招领模块管理
        </div>
        <div onclick="pageClick(this)" datasrc="adminexam.jsp">
            <img src="img/icon-4.png" />学科竞赛信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="adminnews.jsp">
            <img src="img/icon-5.png" />新闻咨询信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="adminuser.jsp">
            <img src="img/icon-3.png" />个人信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="admin.jsp">
            <img src="img/icon-3.png" />用户管理
        </div>
    </div>
</div>

<div class="top">
    <div class="leftTiyle" id="flTitle">欢迎使用本平台，点击左侧操作</div>
    <div class="thisUser">
        当前用户：
        <span style="font-size:25px;color:#e38d13;font-weight: bold;">
            ${user1.name}
        </span>
        <button type="button" class="btn btn-warning"
                onclick="window.location.href='${pageContext.request.contextPath}/user/unload'">登出</button>
    </div>
</div>


<!-- 右侧内容 -->
<div style="margin-left: 270px">
    <iframe frameborder="0" scrolling="yes" style="width:100%;height:80%" src="adminsecondhand.jsp"></iframe>
</div>


<script>
    $(function(){
        $(".lines div").on("click",function(){
            var address =$(this).attr("datasrc");
            $("iframe").attr("src",address);
        });
    });
</script>


</body>
</html>
