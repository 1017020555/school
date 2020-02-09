<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminsecondhandcomment2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
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
<div id="d1">
    <form method="get" action="${pageContext.request.contextPath}/second/searchcomment">
        <label>查询条件：</label><br>
        <label style="margin-left: 100px;">留言人id</label>
            <input name="userid" type="text" class="form-control" placeholder="请输入留言人id：">
        <label>新闻发布时间</label>
            <input name="time" type="date" class="form-control">
        <button type="submit" class="form-control" >查询</button>
    </form>
</div>
<br>
<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>留言人id</td>
            <td>评论内容</td>
            <td>评论时间</td>
            <td colspan="2">操作</td>
        </tr>
        <c:forEach items="${messages}" varStatus="i" var="m">
            <tr>
                <td>${i.index+1}
                </td>
                <td>${m.userid}</td>
                <td>
                    <c:if test="${fn:length(m.context)>5}">
                        ${fn:substring(m.context, 0, 6)}.....
                    </c:if>
                </td>
                <td>
                    <fmt:formatDate value="${m.time}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/second/modify3/${m.id}">编辑</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/second/delete2/${m.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/second/messages?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/second/messages?pageNum=${page}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/second/messages?pageNum=${page}">${page}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/second/messages?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
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
