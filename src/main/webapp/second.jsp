<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/1">手机数码</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/2">智能设备及3C配件</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/3">服饰配件</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/4">书籍</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/5">食品</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/6">运动户外</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/7">生活用品</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/8">游戏设备</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/9">健身器材</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/10">其它物品</a></li>
    </ul>
</div>

<div style="width: 600px;margin-left: 570px;margin-top: -460px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">二手物品信息：</a></li>

        <c:forEach items="${seconds}" var="second">
            <li style="width: 200px;height: 200px;float: left;">
                <div>
                    <img src="/upload/${second.photo}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                    <label>名称：${second.name}</label><br>
                    <label>地点：${second.price}</label>
                </div>
            </li>
        </c:forEach>

    </ul>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/second/getMessage?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/second/getMessage?pageNum=${page}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/second/getMessage?pageNum=${page}">${page}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/second/getMessage?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
                        <span aria-hidden="true">&raquo;&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
    当前${pageInfo.pageNum }页，总共${pageInfo.pages}页，总共${pageInfo.total }条记录

</div>

</body>
</html>
