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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="css/admin.css">

</head>
<body>
<div class="panel panel-success">
    <div class="panel-heading">
    <div id="h1"  >
        <form method="get" action="${pageContext.request.contextPath}/admin/look">
            <table>
               <tr>
                   <span class="page-header" style="font-weight: bold;color: #761c19;">
                       <h4>查询条件：</h4>
                   </span>
               </tr>
                <tr>
                    <td><label>姓名：</label></td>
                    <td><label>学号：</label></td>
                </tr>
                <tr>
                    <td><input id="name" name="name" class="form-control" type="text"></td>
                    <td><input id="username" name="username" class="form-control" type="text"></td>
                    <td><button type="submit" class="btn btn-info">查询</button></td>
                </tr>
            </table>
        </form>
<hr style="color: black;"/>
            <form method="post"  enctype="multipart/form-data" id="form1" action="${pageContext.request.contextPath}/user/fileUpload">
                   <table>
                        <tr>
                            <td>批量导入上传文件: </td>
                            <td> <input class="form-control" id="upfile" type="file" name="upfile" accept=".xls,.xlsx" /></td>
                            <td><input class="form-control"  type="submit" value="提交" onclick="return checkData()" /></td>
                        </tr>
                   </table>
            </form>
    </div>

    </div>

    <table class="table table-hover" style="text-align: center;">
        <div class="panel-body" style="margin-top: -30px;">
            <tr class="info">
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

            <c:forEach items="${users}" var="l" varStatus="m">
                <tr >
                    <td>
                        ${m.index+1}
                    </td>
                    <td>${l.username}</td>
                    <td>${l.password}</td>
                    <td>${l.name}</td>
                    <td>
                                <c:if test="${l.gender==1}">
                                    男
                                </c:if>
                                <c:if test="${l.gender==0}">
                                    女
                                </c:if>
                    </td>
                    <td>${l.email}</td>
                    <td>${l.phone}</td>
                    <td>${l.departmentid}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/adminmessagechange/${l.id}">编辑</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/admindelete/${l.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>

        </table>

        <nav aria-label="Page navigation" style="margin-left: 300px;">
            <ul class="pagination">

                <c:if test="${pageInfo.hasPreviousPage}">
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

    <script type="text/javascript">
        //JS校验form表单信息
        function checkData(){
            var fileDir = $("#upfile").val();
            var suffix = fileDir.substr(fileDir.lastIndexOf("."));
            if("" == fileDir){
                alert("选择需要导入的Excel文件！");
                return false;
            }
            if(".xls" != suffix && ".xlsx" != suffix ){
                alert("选择Excel格式的文件导入！");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
