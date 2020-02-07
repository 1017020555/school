<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>adminlose</title>

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
        #d1 button{
            width: 80px;
            margin-left: 10px;
            display: inline;
        }
    </style>
</head>
<body>

<form method="get" action="${pageContext.request.contextPath}/lose/search2">
<div id="d1">
    <label>查询条件：</label><br>
    <label>所属类型</label>
    <select name="type" class="form-control" style="margin-left: 30px;">
        <option value="lose">丢失物品</option>
        <option value="found">找到物品</option>
    </select>
    <label >丢失物品名称</label>
        <input name="goodname" type="text" class="form-control" placeholder="请输入物品名称：">
    <label>丢失时间</label>
        <input name="time" type="date" class="form-control">
    <button type="submit" class="form-control" >查询</button>
</div>
</form>
<br>

<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>物品名称</td>
            <td>描述</td>
            <td>丢失时间</td>
            <td>丢失地</td>
            <td>类型</td>
            <td colspan="2">操作</td>
        </tr>

        <c:forEach items="${applys}" var="apply" varStatus="i">
            <tr>
                <td>${i.index+1}
                    <input type="checkbox">
                </td>
                <td>${apply.name}</td>
                <td>
                          <c:if test="${fn:length(apply.applyexplain)>5}">
                              ${fn:substring(apply.applyexplain, 0, 6)}.....
                          </c:if>
                </td>
                <td>
                    <fmt:formatDate value="${apply.applytime}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${apply.place}</td>
                <td>
                    <c:if test="${apply.typeid=='1'}">校园卡 </c:if>
                    <c:if test="${apply.typeid=='2'}">银行卡 </c:if>
                    <c:if test="${apply.typeid=='3'}">U盘</c:if>
                    <c:if test="${apply.typeid=='4'}">现金或钱包 </c:if>
                    <c:if test="${apply.typeid=='5'}">钥匙</c:if>
                    <c:if test="${apply.typeid=='6'}">手机</c:if>
                    <c:if test="${apply.typeid=='7'}">包包或服饰</c:if>
                    <c:if test="${apply.typeid=='8'}">图书资料</c:if>
                    <c:if test="${apply.typeid=='9'}">生活用品</c:if>
                    <c:if test="${apply.typeid=='10'}">其它物品</c:if>
                    <c:if test="${apply.typeid=='11'}">眼镜</c:if>
                    <c:if test="${apply.typeid=='12'}">身份证</c:if>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/lose/modify1/${apply.applyid}">编辑</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/lose/delete/${apply.applyid}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<nav aria-label="Page navigation" style="margin-left: 300px;">
    <ul class="pagination">
        <c:if test="${pageInfo.hasPreviousPage}">
            <li>
                <a href="${pageContext.request.contextPath}/lose/show?pageNum=${pageInfo.pageNum-1}&type=${type}&goodname=${goodname}&time=${time}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="page">
            <c:if test="${page==pageInfo.pageNum }">
                <li class="active"><a href="${pageContext.request.contextPath}/lose/show?pageNum=${page}&type=${type}&goodname=${goodname}&time=${time}">${page}</a></li>
            </c:if>
            <c:if test="${page!=pageInfo.pageNum }">
                <li><a href="${pageContext.request.contextPath}/lose/show?pageNum=${page}&type=${type}&goodname=${goodname}&time=${time}">${page}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${pageInfo.hasNextPage }">
            <li>
                <a href="${pageContext.request.contextPath}/lose/show?pageNum=${pageInfo.pageNum+1 }&type=${type}&goodname=${goodname}&time=${time}" aria-label="Next">
                    <span aria-hidden="true">&raquo;&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>
当前${pageInfo.pageNum }页，总共${pageInfo.pages}页，总共${pageInfo.total }条记录

</body>
</html>
