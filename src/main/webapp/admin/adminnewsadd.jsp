<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/1/28
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminnewsadd</title>
    <!--引入css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!--引入js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/admin/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/admin/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，
     这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/admin/ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
    </style>


</head>
<body>

<form method="post" action="${pageContext.request.contextPath}/admin/modify">
    <table class="table table-bordered table-striped" style="text-align: center;">
        <tr>
            <td>标题：</td>
            <td>
                <input id="title" name="title" type="text" value="${user1.username}">
            </td>
        </tr>
        <tr>
            <td>内容：</td>
            <td>

                <script id="editor" type="text/plain" style="width:800px;height:150px;"></script>
                <script type="text/javascript">
                    var ue = UE.getEditor('editor');
                </script>

            </td>
        </tr>
        <tr>
            <td>审批状态</td>
            <td>

                <input id="state" name="state" type="text" value="${user1.password}">

            </td>
        </tr>
        <tr>
            <td>新闻类型</td>
            <td>

                <input id="email" name="email" type="email" value="${user1.email}">

            </td>
        </tr>
        <tr>
            <td>上传文件</td>
            <td>
                <input id="file" name="file" type="file" value="${user1.email}">
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit"  value="发布" id="change">
            </td>
        </tr>
    </table>

</form>

</body>
</html>
