<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>second</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div style="width: 300px;margin-left: 140px;margin-top: 50px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">商品分类：</a></li>
        <li role="presentation"><a href="#">手机数码</a></li>
        <li role="presentation"><a href="#">智能设备及3C配件</a></li>
        <li role="presentation"><a href="#">服饰配件</a></li>
        <li role="presentation"><a href="#">书籍</a></li>
        <li role="presentation"><a href="#">食品</a></li>
        <li role="presentation"><a href="#">运动户外</a></li>
        <li role="presentation"><a href="#">生活用品</a></li>
        <li role="presentation"><a href="#">游戏设备</a></li>
        <li role="presentation"><a href="#">健身器材</a></li>
        <li role="presentation"><a href="#">其它物品</a></li>
    </ul>
</div>

<div style="width: 600px;margin-left: 570px;margin-top: -460px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">二手物品信息：</a></li>

        <li style="width: 200px;height: 200px;float: left;">
            <div>
                <img src="/upload/${apply.picture}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                <label>名称：${apply.name}</label><br>
                <label>地点：${apply.place}</label>
            </div>
        </li>
        <li style="width: 200px;height: 200px;float: left;">
            <div>
                <img src="/upload/${apply.picture}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                <label>名称：${apply.name}</label><br>
                <label>地点：${apply.place}</label>
            </div>
        </li>
        <li style="width: 200px;height: 200px;float: left;">
            <div>
                <img src="/upload/${apply.picture}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                <label>名称：${apply.name}</label><br>
                <label>地点：${apply.place}</label>
            </div>
        </li>
        <c:forEach items="${applys}" var="apply">
            <li style="width: 200px;height: 200px;float: left;">
                <div>
                    <img src="/upload/${apply.picture}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                    <label>名称：${apply.name}</label><br>
                    <label>地点：${apply.place}</label>
                </div>
            </li>
        </c:forEach>
    </ul>

</div>

<div style="width: 300px;margin-left: 140px;margin-top: 50px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">最新二手：</a></li>

        <div style="width: 200px;height: 150px;">
            <img src="img/one.jpg" alt="is" class="img-thumbnail">
            <span>name</span><br>
            <span>price</span>
        </div>
        <div style="width: 200px;height: 150px;">
            <img src="img/one.jpg" alt="is" class="img-thumbnail">
            <span>name</span><br>
            <span>price</span>
        </div>
    </ul>


</div>

</body>
</html>
