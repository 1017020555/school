<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2019/12/30
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!--引入css-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--引入js-->
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>

    <div class="container">
        <br>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="carousel slide" id="carousel-example-generic" data-ride="carousel" data-interval="1500">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/one.jpg"/>
                        </div>
                        <div class="item">
                            <img src="img/one.jpg"/>
                        </div>
                        <div class="item">
                            <img src="img/one.jpg"/>
                        </div>
                        <div class="item">
                            <img src="img/one.jpg"/>
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


    <div id="d1" style="margin-left: 170px;margin-top:60px;width: 600px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active">
                <a href="#">新闻资讯：
                    <span class="badge" style="margin-right: 0px;">更多》</span>
                </a>
            </li>

            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>

        </ul>
    </div>

    <div id="d2" style="margin-left: 850px;margin-top:-250px;width: 300px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active">
                <a href="#">失物招领：
                    <span class="badge" style="margin-right: 0px;">更多》</span>
                </a>
            </li>

            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>

        </ul>
    </div>

    <div id="d3" style="margin-left: 170px;margin-top:100px;width: 600px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active">
                <a href="#">二手交易：
                    <span class="badge" style="margin-right: 0px;">更多》</span>
                </a>
            </li>

            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>

        </ul>
    </div>


    <div id="d2" style="margin-left: 850px;margin-top:-250px;width: 300px;">
        <ul class="nav nav-pills nav-stacked">
            <li role="presentation" class="active">
                <a href="#">学科竞赛：
                    <span class="badge" style="margin-right: 0px;">更多》</span>
                </a>
            </li>

            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>
            <li role="presentation"><a href="#" class="studentmessage.jsp">个人资料</a></li>

        </ul>
    </div>


<div style="scroll-margin-bottom: 0px;">
    <jsp:include page="bottom.jsp"></jsp:include>
</div>

</body>
</html>
