<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>adminnewsadd</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <style type="text/css">
        #f1 input{
            width: 200px;
            margin-left: 300px;
        }
        #f1 textarea{
            width: 500px;
            height: 300px;
            margin-left: 200px;
        }
    </style>
</head>
<body>

<form id="f1" action="${pageContext.request.contextPath}/news/upload"  method="post" enctype="multipart/form-data">
    <table class="table table-bordered table-striped" >
        <tr>
            <td>标题：</td>
            <td>
                <input  id="title" class="form-control" name="title" type="text">
            </td>
        </tr>
        <tr>
            <td>内容：</td>
            <td>
                   <textarea id="context" rows="6"  name="context" class="form-control"></textarea>
            </td>
        </tr>
        <tr>
            <td>新闻类型</td>
            <td>
                <select class="form-control" style="width: 200px;margin-left: 370px;" name="newstypeid" id="newstypeid">
                    <c:forEach  items="${list}" var="l">
                        <option
                                <c:if test="${l=='教务管理'}" > value="1"</c:if>
                                <c:if test="${l=='教育科研'}" > value="2"</c:if>
                                <c:if test="${l=='教育动态'}" > value="3"</c:if>
                                <c:if test="${l=='对外交流'}" > value="4"</c:if>
                                <c:if test="${l=='校友历史'}" > value="5"</c:if>
                                <c:if test="${l=='财务管理'}" > value="6"</c:if>
                                <c:if test="${l=='校务公开'}" > value="7"</c:if>
                                <c:if test="${l=='办事指南'}" > value="8"</c:if>
                                <c:if test="${l=='工会之家'}" > value="9"</c:if>
                        >
                                ${l}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>上传图片</td>
            <td>
                <input id="path" name="path" type="file">
            </td>
        </tr>
        <tr>
            <td>上传附件</td>
            <td>
                <input id="file" name="file" type="file">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"  class="form-control" value="发布" id="change">
            </td>
        </tr>
    </table>

</form>

</body>

</html>
