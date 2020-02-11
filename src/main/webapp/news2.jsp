<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>news</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
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

            <c:forEach items="${news}" var="n">
                <li role="presentation">
                    <a href="${pageContext.request.contextPath}/news/look/${n.id}/" style="font-weight: bold;font-size: 10px;color: black;">
                        <fmt:formatDate value="${n.time}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
                            ${n.title}
                    </a>
                </li>
            </c:forEach>

        </ul>

        <nav aria-label="Page navigation" style="margin-left: 300px;">
            <ul class="pagination">
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/news/getMessage2/${newstypeid}?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                    <c:if test="${page==pageInfo.pageNum }">
                        <li class="active"><a href="${pageContext.request.contextPath}/news/getMessage2/${newstypeid}?pageNum=${page}">${page}</a></li>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/news/getMessage2/${newstypeid}?pageNum=${page}">${page}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="${pageContext.request.contextPath}/news/getMessage2/${newstypeid}?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
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
