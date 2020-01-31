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

</head>
<body>

<form method="post" action="${pageContext.request.contextPath}/news/modify2/${news.id}">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>标题</td>
            <td>
                <input name="title" type="text" value="${news.title}">
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td>
                <input name="context" type="text" value="${news.context}">
            </td>
        </tr>
        <tr>
            <td>新闻类型</td>
            <td>
                <input name="newstypeid" type="text" value="${news.newstypeid}">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit"  value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
