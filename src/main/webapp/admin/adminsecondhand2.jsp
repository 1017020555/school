<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>adminsecondhand2</title>
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
        #d1 select{
            width: 200px;
            display: inline;
        }
    </style>
</head>
<body>

<div id="d1">
    <label>查询条件：</label><br>
    <label style="margin-left: 80px;">商品留言管理：</label>
            <button class="btn btn-primary" type="button" onclick="window.location.href='${pageContext.request.contextPath}/second/messages'">
                点击跳转 <span class="badge">${count}</span>
            </button>
    <br><br>

    <form method="get" action="${pageContext.request.contextPath}/second/search1">
        <label style="margin-left: 80px;">二手物品名称</label>
            <input name="name" type="text" class="form-control" placeholder="请输入物品名称：">
        <label>发布时间</label>
            <input name="time" type="date" class="form-control">
        <label>所属类型</label>
        <select class="form-control" name="categoryid">
            <option value="1">手机数码</option>
            <option value="2">智能设备及3C配件</option>
            <option value="3">服饰配件</option>
            <option value="4">书籍</option>
            <option value="5">食品</option>
            <option value="6">运动户外</option>
            <option value="7">生活用品</option>
            <option value="8">游戏设备</option>
            <option value="9">健身器材</option>
            <option value="10">其它物品</option>
        </select>
        <button style="display: inline;width: 80px;" type="submit" class="form-control" >查询</button>
    </form>
</div>
<br>
<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>物品名称</td>
            <td>描述</td>
            <td>发布时间</td>
            <td>分类</td>
            <td>价格</td>
            <td colspan="2">操作</td>
        </tr>

        <c:forEach varStatus="i" items="${seconds}" var="s">
            <tr>
                <td>
                    ${i.index+1}
                </td>
                <td>${s.name}</td>
                <td>
                    <c:if test="${fn:length(s.context)>5}">
                        ${fn:substring(s.context, 0, 6)}.....
                    </c:if>
                </td>
                <td>
                    <fmt:formatDate value="${s.time}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <c:if test="${s.categoryid=='1'}">手机数码 </c:if>
                    <c:if test="${s.categoryid=='2'}">智能设备及3C配件 </c:if>
                    <c:if test="${s.categoryid=='3'}">服饰配件</c:if>
                    <c:if test="${s.categoryid=='4'}">书籍 </c:if>
                    <c:if test="${s.categoryid=='5'}">食品</c:if>
                    <c:if test="${s.categoryid=='6'}">运动户外</c:if>
                    <c:if test="${s.categoryid=='7'}">生活用品</c:if>
                    <c:if test="${s.categoryid=='8'}">游戏设备</c:if>
                    <c:if test="${s.categoryid=='9'}">健身器材</c:if>
                    <c:if test="${s.categoryid=='10'}">其它物品</c:if>
                </td>
                <td>${s.price}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/second/modify/${s.id}">编辑</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/second/delete/${s.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/second/search1?pageNum=${pageInfo.pageNum-1}&name=${name}&time=${time}&categoryid=${categoryid}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/second/search1?pageNum=${page}&name=${name}&time=${time}&categoryid=${categoryid}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/second/search1?pageNum=${page}&name=${name}&time=${time}&categoryid=${categoryid}">${page}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/second/search1?pageNum=${pageInfo.pageNum+1}&name=${name}&time=${time}&categoryid=${categoryid}" aria-label="Next">
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
