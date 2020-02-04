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
    <a href="${pageContext.request.contextPath}/lose/loselose" class="list-group-item active">
        丢失物品：
    </a>
    <a href="${pageContext.request.contextPath}/lose/losefound" class="list-group-item">
        捡到物品：
    </a>
    <a href="#" class="list-group-item">
        失物招领流程：
    </a>
</div>


<div id="title2" class="alert alert-info" role="alert" style="margin-top: -200px;">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>发布丢失物品信息：</label>
</div>

<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/lose/loselose2">
    <div id="title3">
        <table>
            <tr>
                <td>
                    <label style="margin-left: 50px;">丢失物品类别：</label>
                    <select class="form-control" style="margin-left:40px;width: 240px;display: inline;" name="typeid">
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
                    <p style="display: inline;">${msg}</p>
                </td>
            </tr>
            <tr>
                <td>
                    <label>丢失物品名称：</label>
                    <input name="name" style="margin-left:40px;width: 240px;display: inline;" type="text" class="form-control" placeholder="丢失物品名称：">
                </td>
            </tr>
            <tr>
                <td>
                    <label>丢失地点：</label>
                    <input name="place" style="width: 240px;display: inline;margin-left: 75px;" class="form-control" type="text">
                </td>
            </tr>
            <tr>
                <td>
                    <label>描述：</label>
                    <textarea name="applyexplain" class="form-control" rows="8" cols="8"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label>上传图片：</label>
                    <input name="file" type="file" class="form-control" style="width: 100px;">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" class="form-control" style="width: 100px;margin-left: 150px;" value="发布">
                </td>
            </tr>
        </table>
    </div>
</form>



</body>
</html>
