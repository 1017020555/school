<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminsecondhand</title>
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
        #d1 select{
            width: 200px;
            display: inline;
        }
    </style>
</head>
<body>

<div id="d1">
    <label>查询条件：</label><br>
    <label style="margin-left: 80px;">商品留言管理：</label>
            <button class="btn btn-primary" type="button" onclick="comment()">
                点击跳转 <span class="badge">4</span>
            </button>
    <br><br>
    <label style="margin-left: 80px;">二手物品名称</label><input type="text" class="form-control" placeholder="请输入物品名称：">
    <label>发布时间</label><input type="date" class="form-control">
    <label>所属类型</label>
    <select class="form-control">
        <option>1</option>
        <option>2</option>
    </select>

    <button style="display: inline;width: 80px;" type="button" class="form-control" >查询</button>
</div>
<br>
<div>
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>序号</td>
            <td>物品名称</td>
            <td>描述</td>
            <td>发布时间</td>
            <td>分类</td>
            <td>旧的价格</td>
            <td>新价格</td>
            <td>图片路径</td>
            <td>联系方式</td>
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
                <td></td>
                <td></td>
                <td></td>
                <td>编辑</td>
                <td>删除</td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    function comment() {
        window.location.href="adminsecondhandcomment.jsp";
    }
</script>
</body>
</html>
