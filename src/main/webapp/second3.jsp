<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>second3</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div style="width: 300px;margin-left: 140px;margin-top: 50px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">商品分类：</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/1">手机数码</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/2">智能设备及3C配件</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/3">服饰配件</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/4">书籍</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/5">食品</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/6">运动户外</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/7">生活用品</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/8">游戏设备</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/9">健身器材</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/second/getMessage2/10">其它物品</a></li>
    </ul>
</div>

<div style="width: 600px;margin-left: 570px;margin-top: -460px;">
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#" onclick="window.location.href='javascript:void(0)'">二手物品信息：</a></li>
    </ul>
</div>

<div class="panel panel-default" style="width: 600px;margin-left: 570px;">
    <div class="panel-heading">
        <h3 class="panel-title">${second.name}</h3>
    </div>
    <div class="panel-body" style="width: 600px;height: 440px;">
        发布日期：<fmt:formatDate value="${second.time}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
        <img src="/upload/${second.photo}" style="width: 200px;height: 200px;"><br>
        价格：<input readonly="readonly" class="form-control" value="${second.price}">
        描述：<textarea style="resize:none;" readonly="readonly" cols="8" rows="5" class="form-control">${second.context}</textarea>
    </div>
    <!--容纳动态内容-->
    <div class="fdt">
        <p style="font-family: '微软雅黑';font-weight: bold;font-size: 20px; margin-bottom: 20px; margin-top: 20px;">
            评论：<p style="display: inline;color: red;font-weight: bold;">${msg}</p>
        <p>
        <div id="nr">

        </div>
    </div>
    <div class="panel-body">
        <form method="get" action="${pageContext.request.contextPath}/second/fb2/${second.id}">
            <p>发表评论：</p>
            <textarea cols="100px" rows="5px" name="context" class="form-control"></textarea>
            <input style="width: 100px;resize:none;" class="form-control" type="submit" value="发表" id="fb" />
        </form>
    </div>
</div>

<script>
$(function () {
    //刷新页面时将内容读取出来，并按发表时间读出来
    $.ajax({
        type:'get',
        url:"${pageContext.request.contextPath}/second/pl/${second.id}",
        dataType:"json",
        success:function(data){
            var str='';
            $.each(data, function (index, val) {
                var date=new Date(val.time);
                var month=date.getMonth()+1;
                var day=date.getDate();
                str += "<div class=\"panel panel-default\">" +
                    "<div class='panel-heading'><span class='xm' style='color: #e38d13;font-weight: bold;'>"+val.user.name+"</span>发表评论：</div>" +
                        "<div class='panel-body'>"+val['context']+"</p></div>" +
                    "<div class='panel-body' style='margin-left: 400px;'>发表时间："+date.getFullYear()+"-"+month+"-"+day+"</div>";
                str +="<div style='margin-left: 500px;'>" +
                         "<span><a href='${pageContext.request.contextPath}/second/de/"+val['userid']+"/${second.id}/"+val['id']+"'>删除评论</a></span>" +
                      "</div>" +
                    "</div>";
            });
            $("#nr").html(str);
        }
    });

})
</script>

</body>
</html>
