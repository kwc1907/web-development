
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title style="font-size: 1.5em">Tell</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <c:if test="${sessionScope.user==null}">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index1.html">Tell</a>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">Tell</a>
            </c:if>
        </div>
        <div class="collapse navbar-collapse">
            <c:if test="${sessionScope.user!=null}">
            <ul class="nav navbar-nav" id="mytab">
                <li ><a href="${pageContext.request.contextPath}/showPersonPicServlet">个人主页</a></li>
                <li><a href="${pageContext.request.contextPath}/showfavourServlet">我的收藏</a></li>
                <li><a href="${pageContext.request.contextPath}/showAllPicServlet">Tell广场</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <span class="navbar-text">欢迎回来,${sessionScope.user.username}</span>
                <li><a href="${pageContext.request.contextPath}/updatepassword.jsp">修改密码</a></li>
                <li><a href="${pageContext.request.contextPath}/exitServlet"><span class="glyphicon glyphicon-log-out"></span>退出登录</a></li>
            </ul>
            </c:if>
            <c:if test="${sessionScope.user==null}">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/register.html"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
            </ul>
            </c:if>
        </div>
    </div>
</nav>
</body>
</html>