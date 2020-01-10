<%@ page import="com.hsxy.user.pojo.User" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
	     <!--引入css-->
		 <link rel="stylesheet" href="css/bootstrap.min.css">
		 <!--引入js-->
		 <script src="js/jquery-3.4.1.min.js"></script>
		 <script src="js/bootstrap.min.js"></script>
		 
		 <!--引入主页css文件-->
		 <link rel="stylesheet" href="css/head.css"/>

	</head>
	<body>
		<div>
			<img id="head" src="img/head.jpg"/>
		</div>
		<div id="banner">
			<ul id="lists">
				<li>
					<a href="head.jsp">首页</a>
				</li>
				<li>
					<a >二手交易</a>
				</li>
				<li>
<%--					<a href="${pageContext.request.contextPath}/lose/getMessage">失物招领</a>--%>
						<a href="lose.jsp">失物招领</a>
				</li>
				<li>
					<a>学科竞赛</a>
				</li>
				<li>
					<a>新闻资讯</a>
				</li>
				<li>
					<a href="user.jsp">用户中心</a>
				</li>
			</ul>
		</div>

		<div style="float: right;margin-top: 0px;margin-right: 100px;font-weight: bold;">
			当前用户：
			<span style="font-size:25px;color:#e38d13;font-weight: bold;">
				${user1.name}
			</span>
			<button type="button" class="btn btn-warning"
					onclick="window.location.href='${pageContext.request.contextPath}/user/unload'">登出</button>
		</div>

	</body>
</html>
