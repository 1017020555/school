<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/4
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <option value="1">校园卡</option>
            <option value="2">银行卡</option>
            <option value="3">U盘</option>
            <option value="4">现金或钱包</option>
            <option value="5">钥匙</option>
            <option value="6">手机</option>
            <option value="7">包包或服饰</option>
            <option value="8">图书资料</option>
            <option value="9">生活用品</option>
            <option value="10">其它物品</option>
            <option value="11">眼镜</option>
            <option value="12">身份证</option>
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
                <li>
                    <div style="width: 600px;">
                        <img src="/upload/${apply.picture}" style="width: 300px;height: 200px;" alt="图片" class="img-thumbnail"><br>
                        <label class="form-control">名称：${apply.name}</label><br>
                        <label class="form-control">地点：${apply.place}</label><br>
                        <label class="form-control">时间：
                            <fmt:formatDate value="${apply.applytime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                        </label><br>
                        <textarea class="form-control" cols="4" rows="4">${apply.applyexplain}</textarea>
                    </div>
                </li>
        </ul>
</div>

<br>
<br>

</body>
</html>
