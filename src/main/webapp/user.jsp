
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css"/>

    <script type="text/javascript">
        $(function () {
            $("#code").click(function () {
                $(this).prop("src","${pageContext.request.contextPath}/user/getCode?time="+new Date());
            });
        });
    </script>

</head>
<body>

    <jsp:include page="head.jsp"></jsp:include>


<form class="form-horizontal" action="${pageContext.request.contextPath}/user/load" method="post">

        <img id="img"  src="${pageContext.request.contextPath}/img/banner.jpg" class="img-thumbnail">

    <div class="form-group">
        <label id="e1" for="inputEmail3" class="col-sm-2 control-label">学号:</label>
        <div class="col-sm-10">
            <input type="input" style="width: 210px;" class="form-control" id="inputEmail3"
                   name="username" placeholder="请输入学号：">
        </div>
    </div>

    <div class="form-group"  >
        <div class="col-sm-10" >
            <label style="margin-left: 432px;margin-top: -230px;" for="inputPassword3" class="col-sm-2 control-label">密码：</label>
            <input style="margin-left: 700px;margin-top: -230px;width: 210px;" type="password" class="form-control"
                  name="password" id="inputPassword3" placeholder="请输入密码：">
        </div>
    </div>

    <div class="form-group" >
        <div>
            <input type="text" style="width: 210px;margin-left: 564px;margin-top: -200px;"
                   placeholder="请输入验证码..." maxlength="4" autocomplete="off" name="path" id="path" class="form-control">
            <img name="code" style="margin-left: 800px;margin-top: -160px;" id="code"
                 src="${pageContext.request.contextPath}/user/getCode?time='+new Date()'">
        </div>
    </div>

    <div class="form-group">
        <div >
            <div class="checkbox" style="margin-left: 600px;margin-top: -160px;" >
                <label >
                    <input type="checkbox">
                    <span>记住密码</span>
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div  style="margin-left: 800px;margin-top: -180px;" >
            <input class="btn btn-default" type="submit" value="登陆">
        </div>
    </div>

</form>

</body>
</html>
