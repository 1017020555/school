<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/4
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>lose</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lose.css"/>


</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div id="title" style="margin-left: 90px;margin-top: 50px;" class="alert alert-info" role="alert">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>失物招领请注意：</label>
</div>

<div class="list-group" id="lists" style="margin-left: 90px;">
    <a href="${pageContext.request.contextPath}/lose/loselose" class="list-group-item">
        发布丢失物品通告：
    </a>
    <a href="${pageContext.request.contextPath}/lose/losefound" class="list-group-item">
        发布捡到物品通告：
    </a>
    <a href="${pageContext.request.contextPath}/lose/loseadvice" class="list-group-item">
        失物招领流程：
    </a>
</div>


<div id="title2" class="alert alert-info" role="alert" style="margin-top: -200px;">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>查询条件：</label>
</div>

<form method="get" action="${pageContext.request.contextPath}/lose/search">
<div id="title3">
    <table>
        <tr>
            <td>
                <label style="margin-left: 0px;">
                    丢失OR捡到物品
                </label>
            </td>
            <td>
                <label style="margin-left: 10px;">选择丢失物品类别：</label>
            </td>
            <td>
                <label>丢失物品名称：</label>&nbsp;&nbsp;
            </td>
          <td>
              <label>丢失时间：</label>
          </td>
        </tr>
    <tr>
        <td>
            <select name="type" class="form-control" style="width: 130px;">
                <option value="lose">丢失</option>
                <option value="found">捡到</option>
            </select>
        </td>
        <td>
    <select class="form-control" style="width: 120px;" name="typeid">
        <c:forEach items="${types}" var="type">
            <option
                    <c:if test="${type=='校园卡'}">value="1" </c:if>
                    <c:if test="${type=='银行卡'}">value="2" </c:if>
                    <c:if test="${type=='U盘'}">value="3" </c:if>
                    <c:if test="${type=='现金或钱包'}">value="4" </c:if>
                    <c:if test="${type=='钥匙'}">value="5" </c:if>
                    <c:if test="${type=='手机'}">value="6" </c:if>
                    <c:if test="${type=='包包或服饰'}">value="7" </c:if>
                    <c:if test="${type=='图书资料'}">value="8" </c:if>
                    <c:if test="${type=='生活用品'}">value="9" </c:if>
                    <c:if test="${type=='其它物品'}">value="10" </c:if>
                    <c:if test="${type=='眼镜'}">value="11" </c:if>
                    <c:if test="${type=='身份证'}">value="12" </c:if>
            >${type}
            </option>
        </c:forEach>
    </select>
        </td>
        <td>
            <input name="name" style="width: 120px;" type="text" class="form-control" placeholder="丢失物品名称：">
        </td>
    <td>
        <input name="applytime" style="width: 150px;" class="form-control" type="date">
    </td>
        <td>
            <input type="submit" class="form-control" style="width: 50px;" value="搜索">
        </td>
    </tr>
    </table>
</div>
</form>

<div id="title4" class="alert alert-info" role="alert">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>查询结果：</label>
</div>

<div id="title5" style="margin-left: 500px;width: 600px;">
        <ul class="nav nav-pills nav-stacked">
            <c:forEach items="${applys}" var="apply">
                <li style="width: 200px;height: 200px;float: left;">
                    <div onclick="window.location.href='${pageContext.request.contextPath}/lose/look/'+${apply.applyid}">
                        <img src="/upload/${apply.picture}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                        <label>名称：${apply.name}</label><br>
                        <label>地点：${apply.place}</label>
                    </div>
                </li>
            </c:forEach>
        </ul>
</div>
<div id="title6" style="margin-left: 500px;width: 600px;">
    <ul class="nav nav-pills nav-stacked">
        <c:forEach items="${goods}" var="good">
            <li style="width: 200px;height: 200px;float: left;">
                <div onclick="window.location.href='${pageContext.request.contextPath}/lose/look2/'+${good.goodid}">
                    <img src="/upload/${good.photo}" style="width: 120px;height: 120px;" alt="图片" class="img-thumbnail"><br>
                    <label>名称：${good.goodname}</label><br>
                    <label>地点：${good.place}</label>
                </div>
            </li>
        </c:forEach>
    </ul>

    <nav aria-label="Page navigation" style="margin-left: 300px;">
        <ul class="pagination">
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/lose/search?pageNum=${pageInfo.pageNum-1}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <c:if test="${page==pageInfo.pageNum }">
                    <li class="active"><a href="${pageContext.request.contextPath}/lose/search?pageNum=${page}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageInfo.pageNum }">
                    <li><a href="${pageContext.request.contextPath}/lose/search?pageNum=${page}&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}">${page}</a></li>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/lose/search?pageNum=${pageInfo.pageNum+1 }&type=${type}&typeid=${typeid}&name=${name}&applytime=${applytime}" aria-label="Next">
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
