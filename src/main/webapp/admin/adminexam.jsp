<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminexam</title>
    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style rel="stylesheet" type="text/css">
        #d1 label{
            margin-left: 20px;
        }
        #d1 input{
            width: 200px;
            margin-left: 20px;
            display: inline;
        }
        #d1 button{
            width: 100px;
            margin-left: 50px;
            display: inline;
        }
    </style>
</head>
<body>
<div id="d1">
    <label>查询条件：</label><br>
    <label style="margin-left: 100px;">竞赛文章标题</label><input type="text" class="form-control" placeholder="请输入文章标题：">
    <label>竞赛文章发布时间</label><input type="date" class="form-control">
    <button type="button" class="form-control" >查询</button>
</div>
<br>
<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>标题</td>
            <td>内容</td>
            <td>所属部门</td>
            <td>审批状态</td>
            <td>发布时间</td>
            <td colspan="2">操作</td>
        </tr>


        <c:forEach items="${users}" var="l">
            <tr>
                <td>1
                    <input type="checkbox">
                </td>
                <td>${l.username}</td>
                <td>${l.password}</td>
                <td>${l.name}</td>
                <td>${l.gender}</td>
                <td>${l.email}</td>

                <td>编辑</td>
                <td>删除</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
