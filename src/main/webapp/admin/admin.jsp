<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/9
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <table>
            <tr>
                <td>查询用户:</td>
            </tr>
            <tr>
                <td><label>姓名：</label></td>
                <td><label>学号：</label></td>
                <td><label>院系:</label></td>
            </tr>
            <tr>
                <td><input class="form-control" type="text"></td>
                <td><input class="form-control" type="text"></td>
                <td>
                    <select class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </td>
                <td>
                    <button type="button" class="btn btn-info">查询</button>
                </td>
            </tr>
        </table>
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

            <tr>
                <td><input type="checkbox"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>编辑</td>
                <td>删除</td>
            </tr>
        </table>

        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

    </div>



</body>
</html>
