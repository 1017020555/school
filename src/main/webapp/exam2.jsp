<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>exam</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>


<div style="width: 300px;margin-left: 140px;margin-top: 50px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">各院系竞赛信息：</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/1">文学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/2">生命与环境科学学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/3">旅游学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/4">信息工程学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/5">经济管理学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/6">艺术学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/7">外国语学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/8">数学与统计学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/9">化学化工学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/10">体育学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/11">教育科学学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/12">建筑工程学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/13">马克思主义学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/14">文化与传播学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/15">机电工程学院</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/compition/getMessage2/16">国际教育学院(继续教育学院)</a></li>
    </ul>
</div>

<div style="width: 600px;margin-left: 570px;margin-top: -710px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="javascript:void(0)">列表显示：</a></li>

      <c:forEach items="${compitions}" var="c">
              <li role="presentation">
                  <a href="${pageContext.request.contextPath}/compition/look/${c.id}/${c.count}" style="font-weight: bold;font-size: 10px;color: black;">
                      <fmt:formatDate value="${c.time}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
                          ${c.title}
                  </a>
              </li>
      </c:forEach>

    </ul>


<nav aria-label="Page navigation" style="margin-left: 300px;">
    <ul class="pagination">
        <c:if test="${pageInfo.hasPreviousPage}">
            <li>
                <a href="${pageContext.request.contextPath}/compition/getMessage2/${typeid}?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="page">
            <c:if test="${page==pageInfo.pageNum }">
                <li class="active"><a href="${pageContext.request.contextPath}/compition/getMessage2/${typeid}?pageNum=${page}">${page}</a></li>
            </c:if>
            <c:if test="${page!=pageInfo.pageNum }">
                <li><a href="${pageContext.request.contextPath}/compition/getMessage2/${typeid}?pageNum=${page}">${page}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${pageInfo.hasNextPage }">
            <li>
                <a href="${pageContext.request.contextPath}/compition/getMessage2/${typeid}?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
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
