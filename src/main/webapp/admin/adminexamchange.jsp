<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/31
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminnewschange</title>
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

<form id="f1" method="post" action="${pageContext.request.contextPath}/compition/modify2/${compition.id}">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>标题</td>
            <td>
                <input class="form-control" name="title" type="text" value="${compition.title}">
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td>
                <textarea class="form-control" name="context">${compition.context}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" style="margin-left: 400px;" class="form-control" value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
