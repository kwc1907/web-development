<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        function refreshCode() {
            var s="${pageContext.request.contextPath}/checkCode?time="+new Date().getTime();
            $("#vcode").prop("src",s);
        }
    </script>
</head>

<body>
<div class="layout">
    <div class="login-box">
        <div class="title">
            <img src="img/cool.png" alt="" />
            <span>欢迎登录Tell空间</span>
        </div>
        <div class="login_inner">
            <div class="alert alert-danger" >${tishi}</div>
            <form action="${pageContext.request.contextPath}/loginServlet" method="post" accept-charset="utf-8">
                <input type="hidden" name="action" value="login"/>
                <input name="username" type="text" placeholder="请输入账号">
                <input name="password" type="text" placeholder="请输入密码">
                <div class="verify">
                    <input name="check" type="text" placeholder="请输入验证码">
                    <a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath}/checkCode" id="vcode"/></a>
                </div>
                <div class="submit_btn">
                    <button type="submit"  id="btn_sub">登录</button>
                </div>
            </form>
            <div class="reg">没有账户？<a href="${pageContext.request.contextPath}/register.html">立即注册</a></div>
        </div></div>
</div>
</body>
<div id="footer"></div>
<script type="text/javascript" src="js/include.js"></script>
</html>
