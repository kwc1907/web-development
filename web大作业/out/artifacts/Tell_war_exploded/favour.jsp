<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的收藏</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery-3.3.1.min.js"></script>

    <script type="text/javascript">
        function fav(flag,id) {
            if(!flag)
            {
                $.get("addfavourServlet",{id:id},function () {
                    window.location.reload();
                    alert("收藏成功");
                });
            }
            else
            {
                $.get("delfavourServlet",{id:id},function () {
                   window.location.reload();
                    alert("已取消收藏");
                });
            }

        }
    </script>
</head>
<body>
<div >
    <div class="container" style="margin-top: 70px;" >
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h2 align="center">我的收藏</h2>
            </div>
            <div class="panel-body">
                <div class="col-md-9">
                    <c:if test="${not empty requestScope.pic}">
                        <c:forEach items="${requestScope.pic}" var="pi" varStatus="s">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img src="${pi.picturepath}" style="height:280px" />
                                    <h6>您于${pi.date}收藏</h6>
                                    <c:if test="${pi.bewrite!=null}">
                                        <p>描述:${pi.bewrite}</p>
                                    </c:if>
                                    <button onclick="fav(${pi.favourflag},${pi.id})" type="button" class="btn btn-default btn-sm">
                                        <c:if test="${pi.favourflag}">
                                            <span class="glyphicon glyphicon-star"></span> 收藏
                                        </c:if>
                                        <c:if test="${!pi.favourflag}">
                                            <span class="glyphicon  glyphicon-star-empty"></span> 收藏
                                        </c:if>
                                    </button>
                                    <button type="button" class="btn btn-default btn-sm">
                                        <a href="${pageContext.request.contextPath}/downServlet?filename=${pi.picturepath}"><span class="glyphicon glyphicon-download-alt"></span> 下载</a>
                                    </button>
                                </div>
                            </div>
                        </c:forEach></c:if>
                    <c:if test="${empty requestScope.pic}">
                        <h2>您当前还未收藏过图片，快去广场上看看吧！</h2>
                    </c:if>
                </div>
                <div class="col-md-3 hidden-xs">
                    <div class="side-bar-card clearfix">
                        <div class="text-center">
                            <br/><br/><br/><br/>
                            <p>用户名:${sessionScope.user.username}</p>
                            <p>性别:${sessionScope.user.sex}</p>
                            <p>生日:${sessionScope.user.birthday}</p>
                            <p>邮箱:${sessionScope.user.email}</p>
                            <p>注册时间:${sessionScope.user.registime}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var t=0;
</script>
</body>
</html>
