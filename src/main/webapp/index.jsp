<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>

    <div class="container">
        <br>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="carousel slide" id="carousel-example-generic" data-ride="carousel" data-interval="3000">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/img/one.jpg"/>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/two.jpg"/>
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/three.jpg"/>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

<table>
    <tr>
        <td>
            <div id="d1" style="margin-left: 140px;width: 600px;margin-top: 60px;">
                <ul class="nav nav-pills nav-stacked" id="news">
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/news/getMessage">新闻资讯：
                            <span class="badge" style="margin-right: 0px;">更多》</span>
                        </a>
                    </li>
                </ul>
            </div>
        </td>
        <td>
            <div id="d2" style="width: 300px;margin-left: 100px;margin-top: 60px;">
                <ul class="nav nav-pills nav-stacked" id="lose">
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/lose/getMessage">失物招领：
                            <span class="badge" style="margin-right: 0px;">更多》</span>
                        </a>
                    </li>
                </ul>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div id="d3" style="margin-left: 140px;margin-top:100px;width: 600px;">
                <ul class="nav nav-pills nav-stacked" id="second">
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/second/getMessage">二手交易：
                            <span class="badge" style="margin-right: 0px;">更多》</span>
                        </a>
                    </li>

                </ul>
            </div>
        </td>
        <td>
            <div id="d4" style="margin-left: 100px;width: 300px;">
                <ul class="nav nav-pills nav-stacked" id="exam">
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/compition/getMessage">学科竞赛：
                            <span class="badge" style="margin-right: 0px;">更多》</span>
                        </a>
                    </li>

                </ul>
            </div>
        </td>
    </tr>
</table>



<div style="scroll-margin-bottom: 0px;">
    <jsp:include page="bottom.jsp"></jsp:include>
</div>

<script type="text/javascript">
    function c(id){
        window.location.href='${pageContext.request.contextPath}/second/look/'+id;
    };

    $(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/news/index",
            type:'get',
            dataType:"json",
            success:function(applies) {
                $.each(applies,function(index,obj){
                    var date=new Date(obj.time);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    $("#news").append(
                        "<li role='presentation'>"
                        + "<a href='${pageContext.request.contextPath}/news/look/"+obj.id+"'>"+date.getFullYear()+"-"+month+"-"+day+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        + obj.title+"</a></li>"
                    );
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/lose/index",
            type:'get',
            dataType:"json",
            success:function(applies) {
                $.each(applies,function(index,obj){
                    var date=new Date(obj.applytime);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    $("#lose").append(
                        "<li role='presentation'>"
                        + "<a href='${pageContext.request.contextPath}/lose/look/"+obj.applyid+"'>"+date.getFullYear()+"-"+month+"-"+day+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        + obj.name+"</a></li>"
                    );
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/second/index",
            type:'get',
            dataType:"json",
            success:function(applies) {
                $.each(applies,function(index,obj){
                    var date=new Date(obj.time);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    $("#second").append(
                        "<li style='width: 200px;height: 150px;float: left;'>" +
                            "<div onclick='c("+obj.id+");'>" +
                                "<img src='/upload/"+obj.photo+"' style='width: 100px;height: 100px;' class='img-thumbnail'>" +
                                "<br>物品名称：<span>"+obj.name+"</span>" +
                                "<br>价格：<span>"+obj.price+"</span>" +
                            "</div>" +
                        "</li>"
                    );
                });
            }
        });
        $.ajax({
            url:"${pageContext.request.contextPath}/compition/index",
            type:'get',
            dataType:"json",
            success:function(data) {
                $.each(data,function(index,obj){
                    var date=new Date(obj.time);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    $("#exam").append(
                        "<li role='presentation'>"
                        + "<a href='${pageContext.request.contextPath}/compition/look/"+obj.id+"/"+obj.count+"'>"+date.getFullYear()+"-"+month+"-"+day+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                        + obj.title+"</a></li>"
                    );
                });
            }
        });

    })
</script>
</body>
</html>
