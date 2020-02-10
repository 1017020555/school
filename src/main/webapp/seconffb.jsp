<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>lose</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>

<div id="title2" class="alert alert-info" role="alert">
    <img src="${pageContext.request.contextPath}/img/img1.png">
    <label>发布二手物品信息：</label>
</div>

<p style="font-weight: bold;color: red;font-size: large;">${msg}</p>
<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/second/fb">
    <div id="title3">
        <table>
            <tr>
                <td>
                    <label>物品类别：</label>
                    <select class="form-control" style="margin-left:40px;width: 240px;display: inline;" name="categoryid">
                        <option value="1">手机数码</option>
                        <option value="2">智能设备及3C配件</option>
                        <option value="3">服饰配件</option>
                        <option value="4">书籍</option>
                        <option value="5">食品</option>
                        <option value="6">运动户外</option>
                        <option value="7">生活用品</option>
                        <option value="8">游戏设备</option>
                        <option value="9">健身器材</option>
                        <option value="10">其它物品</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label>物品名称：</label>
                    <input name="name" style="margin-left:40px;width: 240px;display: inline;" type="text" class="form-control" placeholder="售卖物品名称：">
                </td>
            </tr>
            <tr>
                <td>
                    <label>希望售卖价格：</label>
                    <input name="price" style="width: 240px;display: inline;margin-left: 10px;" class="form-control" type="text">
                </td>
            </tr>
            <tr>
                <td>
                    <label>描述：</label>
                    <textarea name="context" class="form-control" rows="8" cols="8"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <label>上传图片：</label>
                    <input name="photo" type="file" class="form-control" style="width: 100px;">
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
