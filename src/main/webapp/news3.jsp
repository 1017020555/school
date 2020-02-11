<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>news</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>

    <div style="width: 300px;margin-left: 140px;margin-top: 50px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">新闻列表：</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/1">教务管理</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/2">教育科研</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/3">教育动态</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/4">对外交流</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/5">校友历史</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/6">财务管理</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/7">校务公开</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/8">办事指南</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/news/getMessage2/9">工会之家</a></li>
        </ul>
    </div>

    <div style="width: 600px;margin-left: 570px;margin-top: -420px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">文章内容：</a></li>
        </ul>
    </div>
    <div class="panel panel-default" style="width: 600px;margin-left: 570px;">
        <div class="panel-heading">
            <h3 class="panel-title">标题： ${news.title}</h3>
        </div>
        <div class="panel-body">
            发布日期：<fmt:formatDate value="${news.time}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            ${news.context}<br>
            附件：<a href="${pageContext.request.contextPath}/news/download2?filename=${news.file}">点击下载</a>
        </div>
    </div>
</body>
</html>
