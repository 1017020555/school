<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li role="presentation" class="active"><a href="#">新闻列表：</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
        </ul>
    </div>

    <div style="width: 600px;margin-left: 570px;margin-top: -380px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active"><a href="#">文章内容：</a></li>

            <span>title</span>
            <span>context</span>

        </ul>
    </div>
</body>
</html>
