<%@ page import="com.hsxy.user.pojo.User" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		 
		 <!--引入主页css文件-->
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css"/>

	</head>
	<body>
		<div>
			<img id="head" src="${pageContext.request.contextPath}/img/head.jpg" />
		</div>
		<div id="banner">
			<ul id="lists">
				<li>
					<a href="index.jsp">首页</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/second/getMessage">二手交易</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/lose/getMessage">失物招领</a>
				</li>
				<li>
						<a href="exam.jsp">学科竞赛</a>
				</li>
				<li>
					    <a href="news.jsp">新闻资讯</a>
				</li>
				<li>
					    <a href="usermessage.jsp">用户中心</a>
				</li>
			</ul>
		</div>

		<div style="float: right;margin-top: 0px;margin-right: 100px;font-weight: bold;">
			当前用户：
			<span style="font-size:25px;color:#e38d13;font-weight: bold;">
				${user1.name}
			</span>
			<button type="button" class="btn btn-warning"
					onclick="window.location.href='${pageContext.request.contextPath}/user.jsp'">登陆</button>
			<button type="button" class="btn btn-warning"
					onclick="window.location.href='${pageContext.request.contextPath}/user/unload'">登出</button>
		</div>

	</body>
</html>
