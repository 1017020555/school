<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>usermessagemylost</title>
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

        <li role="presentation"><a href="#">我的失物申请</a></li>

        <li role="presentation"><a href="#" class="seconffb.jsp">发布二手申请</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/my">我的二手申请</a></li>

        <li role="presentation"><a href="${pageContext.request.contextPath}/user/unload">安全退出</a></li>
    </ul>
</div>


<div id="title4" class="alert alert-info" role="alert" style="width: 600px;margin-left: 550px;margin-top: -325px;">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>查询结果：</label>
</div>

<div id="title5" style="margin-left: 550px;width: 600px;">
    <ul class="nav nav-pills nav-stacked">
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

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/lose/my?pageNum=${pageInfo.pageNum-1}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/lose/my?pageNum=${page}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/lose/my?pageNum=${page}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}">${page}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/lose/my?pageNum=${pageInfo.pageNum+1 }&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}" aria-label="Next">
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
