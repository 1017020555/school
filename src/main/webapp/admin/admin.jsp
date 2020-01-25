<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin</title>
    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/admin.css">

</head>
<body>
    <div id="h1">
        <form method="get" action="${pageContext.request.contextPath}/admin/look">
            <table>
                <tr>
                    <td>查询用户:</td>
                </tr>
                <tr>
                    <td><label>姓名：</label></td>
                    <td><label>学号：</label></td>
                </tr>
                <tr>
                    <td><input id="name" name="name" class="form-control" type="text"></td>
                    <td><input id="username" name="username" class="form-control" type="text"></td>
                    <td>
                        <button type="submit" class="btn btn-info">查询</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div id="h2">
        <table class="table table-bordered table-striped" style="text-align: center;">
            <tr>
                <td>序号</td>
                <td>学号</td>
                <td>密码</td>
                <td>姓名</td>
                <td>性别</td>
                <td>Email</td>
                <td>电话</td>
                <td>所属学院</td>
                <td colspan="2">操作</td>
            </tr>


            <c:forEach items="${users}" var="l">
                <tr>
                    <td>
                        1
                        <input type="checkbox">
                    </td>
                    <td>${l.username}</td>
                    <td>${l.password}</td>
                    <td>${l.name}</td>
                    <td>${l.gender}</td>
                    <td>${l.email}</td>
                    <td>${l.phone}</td>
                    <td>${l.departmentid}</td>
                    <td>编辑</td>
                    <td>删除</td>
                </tr>
            </c:forEach>
        </table>

        <nav aria-label="Page navigation" style="margin-left: 300px;">
            <ul class="pagination">

                <c:if test="${pageInfo.hasPreviousPage  }">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/user?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums  }" var="page">
                    <c:if test="${page==pageInfo.pageNum }">
                        <li class="active"><a href="${pageContext.request.contextPath}/admin/user?pageNum=${page}">${page}</a></li>
                    </c:if>
                    <c:if test="${page!=pageInfo.pageNum }">
                        <li><a href="${pageContext.request.contextPath}/admin/user?pageNum=${page}">${page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.hasNextPage }">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/user?pageNum=${pageInfo.pageNum+1 }" aria-label="Next">
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
