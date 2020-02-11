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
                <input class="form-control" name="title" type="text" value="${news.title}">
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td>
                <textarea name="context" cols="8" rows="8" class="form-control">${news.context}</textarea>
            </td>
        </tr>
        <tr>
            <td>新闻类型</td>
            <td>
                <select name="newstypeid" class="form-control">
                    <option value="1">教务管理</option>
                    <option value="2">教育科研</option>
                    <option value="3">教育动态</option>
                    <option value="4">对外交流</option>
                    <option value="5">校友历史</option>
                    <option value="6">财务管理</option>
                    <option value="7">校务公开</option>
                    <option value="8">办事指南</option>
                    <option value="9">工会之家</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="form-control" type="submit"  value="修改" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
