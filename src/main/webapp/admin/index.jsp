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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/page.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/index.js" ></script>

</head>
<body>

<div class="left" >
    <div class="bigTitle">校园服务平台管理系统</div>
    <div class="lines" style="height: 530px;">
        <div onclick="pageClick(this)" class="active" datasrc="${pageContext.request.contextPath}/second/show">
            <img src="img/icon-1.png" />二手交易模块管理
        </div>
        <div onclick="pageClick(this)" datasrc="${pageContext.request.contextPath}/lose/show">
            <img src="img/icon-2.png" />失物招领模块管理
        </div>
        <div onclick="pageClick(this)" datasrc="${pageContext.request.contextPath}/compition/show">
            <img src="img/icon-4.png" />学科竞赛信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="${pageContext.request.contextPath}/news/show">
            <img src="img/icon-5.png" />新闻咨询信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="${pageContext.request.contextPath}/admin/adminuser">
            <img src="img/icon-3.png" />个人信息管理
        </div>
        <div onclick="pageClick(this)" datasrc="${pageContext.request.contextPath}/admin/user">
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
<div style="margin-left: 270px;">
    <iframe  frameborder="0" scrolling="yes" style="width:100%;height:85%" src="${pageContext.request.contextPath}/second/show"></iframe>
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
