
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css"/>--%>

    <script type="text/javascript">
        $(function () {
            $("#code").click(function () {
                $(this).prop("src","${pageContext.request.contextPath}/user/getCode?time="+new Date());
            });
        });
    </script>
</head>
<body style=" background: url(http://global.bing.com/az/hprichbg/rb/RavenWolf_EN-US4433795745_1920x1080.jpg) no-repeat center center fixed;
 background-size: 100%;">

    <jsp:include page="head.jsp"></jsp:include>
<div class="modal-dialog" style="margin-top: 5%;">
  <div class="modal-content">
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/load" method="post">
            <div class="modal-header">
                <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
            </div>
            <div class="modal-body" id = "model-body">
                <div class="form-group">
                    <label style="display: inline;margin-left: 100px;" id="e1" for="inputEmail3" class="control-label">学号:</label>
                    <input style="display: inline;width: 200px;margin-left: 130px;" type="input" class="form-control" id="inputEmail3"
                           name="username" placeholder="请输入学号：" value="${username }">
                </div>
                <div class="form-group">
                    <label style="display: inline;margin-left: 100px;"  for="inputPassword3" class="control-label">密码：</label>
                    <input style="display: inline;width: 200px;margin-left: 120px;"  type="password" class="form-control"
                           name="password" id="inputPassword3" placeholder="请输入密码：" value="${password}">
                </div>
                <div class="form-group">
                    <label style="display: inline;margin-left: 100px;"   class="control-label">验证码：</label>
                    <input type="text" style="width: 130px;display: inline;margin-left: 105px;"
                           placeholder="请输入验证码..." maxlength="4" autocomplete="off"
                           name="path" id="path" class="form-control">
                    <img name="code"  id="code" style="display: inline;margin-left: 32px;"
                         src="${pageContext.request.contextPath}/user/getCode?time='+new Date()'">
                </div>
                <div class="form-group" >
                    <input type="checkbox" style="display: inline;margin-left: 100px;" name="rem" onclick="remember();">
                    <span>记住密码</span>
                </div>
                <div class="form-group">
                    <input class="btn btn-success" style="display: inline;margin-left: 100px;"
                           type="submit" value="登陆" onclick="ch()">
            </div>
            </div>
    </form>
</div>
</div>
  <script>
      $("#inputEmail3").blur(function () {
          if ($("#inputEmail3").val()==""){
              alert("账户不能为空！");
          }
      });
      $("#inputPassword3").blur(function () {
          if ($("#inputPassword3").val()==""){
              alert("密码不能为空！");
          }
      });
      function ch() {
          if ($("#inputEmail3").val()=="" || $("#inputPassword3").val()==""){
              alert("账户或密码不能为空！");
              return false;
          }
      }
  </script>

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
