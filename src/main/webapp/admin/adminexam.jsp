<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminexam</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style rel="stylesheet" type="text/css">
        #d1 label{
            margin-left: 20px;
        }
        #d1 input{
            width: 200px;
            margin-left: 20px;
            display: inline;
        }
        #d1 button{
            width: 100px;
            margin-left: 50px;
            display: inline;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/compition/search" method="post">
<div id="d1">
    <label>查询条件：</label><br>
    <label style="margin-left: 100px;">竞赛文章标题</label>
        <input name="title" type="text" class="form-control" placeholder="请输入文章标题：">
    <label>竞赛文章发布时间</label>
        <input name="time" type="date" class="form-control">
    <button type="submit" class="form-control" >查询</button>

    <input type="button" class="form-control" value="点击发布竞赛信息！"
           onclick="window.location.href='${pageContext.request.contextPath}/compition/fb'">

</div>
</form>
<br>
<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>标题</td>
            <td>内容</td>
            <td>发布时间</td>
            <td>点击次数</td>
            <td>学院</td>
            <td colspan="2">操作</td>
        </tr>


        <c:forEach items="${compitions}" var="c">
            <tr>
                <td>1
                    <input type="checkbox">
                </td>
                <td>${c.title}</td>
                <td>
                    <c:if test="${fn:length(c.context)>10}">
                        ${fn:substring(c.context, 1, 11)}.......
                    </c:if>
                </td>
                <td>
                    <fmt:formatDate value="${c.time}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${c.count}</td>
                <td>
                    <c:if test="${c.typeid=='1'}">文学院 </c:if>
                    <c:if test="${c.typeid=='2'}">生命与环境科学学院 </c:if>
                    <c:if test="${c.typeid=='3'}">旅游学院</c:if>
                    <c:if test="${c.typeid=='4'}">信息工程学院 </c:if>
                    <c:if test="${c.typeid=='5'}">经济管理学院</c:if>
                    <c:if test="${c.typeid=='6'}">艺术学院</c:if>
                    <c:if test="${c.typeid=='7'}">外国语学院</c:if>
                    <c:if test="${c.typeid=='8'}">数学与统计学院</c:if>
                    <c:if test="${c.typeid=='9'}">化学化工学院</c:if>
                    <c:if test="${c.typeid=='10'}">体育学院</c:if>
                    <c:if test="${c.typeid=='11'}">教育科学学院</c:if>
                    <c:if test="${c.typeid=='12'}">建筑工程学院</c:if>
                    <c:if test="${c.typeid=='13'}">马克思主义学院</c:if>
                    <c:if test="${c.typeid=='14'}">文化与传播学院</c:if>
                    <c:if test="${c.typeid=='15'}">机电工程学院</c:if>
                    <c:if test="${c.typeid=='16'}">国际教育学院（继续教育学院）</c:if>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/compition/modify1/${c.id}">编辑</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/compition/delete/${c.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">

            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/compition/show?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums  }" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/compition/show?pageNum=${page}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/compition/show?pageNum=${page}">${page}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/compition/show?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </nav>

    当前${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录

</div>

</body>
</html>
