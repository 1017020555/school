
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
                   name="username" placeholder="请输入学号：" value="${username }">
        </div>
    </div>

    <div class="form-group"  >
        <div class="col-sm-10" >
            <label style="margin-left: 432px;margin-top: -230px;" for="inputPassword3" class="col-sm-2 control-label">密码：</label>
            <input style="margin-left: 700px;margin-top: -230px;width: 210px;" type="password" class="form-control"
                  name="password" id="inputPassword3" placeholder="请输入密码：" value="${password}">
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
                    <input type="checkbox" name="rem" onclick="remember();">
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

<script>
    $(document).ready(function(){
        //记住密码功能
        var str = getCookie("loginInfo");
        str = str.substring(1,str.length-1);
        var username = str.split(",")[0];
        var password = str.split(",")[1];
        //自动填充用户名和密码
        $("#username").val(username);
        $("#password").val(password);
    });

    //获取cookie
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
        }
        return "";
    }

    //记住密码功能
    function remember(){
        var remFlag = $("input[type='checkbox']").is(':checked');
        if(remFlag==true){ //如果选中设置remFlag为1
            //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
            var conFlag = confirm("记录密码功能不宜在公共场所使用,以防密码泄露.您确定要使用此功能吗?");
            if(conFlag){ //确认标志
                $("#remFlag").val("1");
            }else{
                $("input[type='checkbox']").removeAttr('checked');
                $("#remFlag").val("");
            }
        }else{ //如果没选中设置remFlag为""
            $("#remFlag").val("");
        }
    }
</script>
</body>
</html>
