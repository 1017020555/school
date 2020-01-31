<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminnews</title>
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
    <div id="d1">
        <label>查询条件：</label><br>
        <label style="margin-left: 100px;">新闻标题</label><input type="text" class="form-control" placeholder="请输入文章标题：">
        <label>新闻发布时间</label><input type="date" class="form-control">
        <button type="button" class="form-control" >查询</button>

        <input type="button" class="form-control" value="点击发布新闻！"
               onclick="window.location.href='${pageContext.request.contextPath}/news/fb'">
    </div>

    <br>

    <div>
        <table class="table table-bordered table-striped" style="text-align: center;">
            <tr>
                <td>序号</td>
                <td>标题</td>
                <td>内容</td>
                <td>时间</td>
                <td>新闻类型</td>
                <td colspan="2">操作</td>
            </tr>

            <c:forEach items="${news}" var="n">
            <tr>
                <td>
                    1
                    <input type="checkbox">
                </td>
                <td>${n.title}</td>
                <td>
                    <c:if test="${fn:length(n.context)>10}">
                        ${fn:substring(n.context, 1, 11)}.....
                    </c:if>
                </td>
                <td>
                    <fmt:formatDate value="${n.time}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <c:if test="${n.newstypeid=='1'}" > 教务管理</c:if>
                    <c:if test="${n.newstypeid=='2'}" > 教育科研</c:if>
                    <c:if test="${n.newstypeid=='3'}" > 教育动态</c:if>
                    <c:if test="${n.newstypeid=='4'}" > 对外交流</c:if>
                    <c:if test="${n.newstypeid=='5'}" > 校友历史</c:if>
                    <c:if test="${n.newstypeid=='6'}" > 财务管理</c:if>
                    <c:if test="${n.newstypeid=='7'}" > 校务公开</c:if>
                    <c:if test="${n.newstypeid=='8'}" > 办事指南</c:if>
                    <c:if test="${n.newstypeid=='9'}" > 工会之家</c:if>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/">编辑</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/news/delete/${n.id}">删除</a>
                </td>
            </tr>
            </c:forEach>
        </table>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">

            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/news/show?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums  }" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/news/show?pageNum=${page}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/news/show?pageNum=${page}">${page}</a></li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/news/show?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
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
