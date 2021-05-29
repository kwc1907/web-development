<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/4/30
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tell广场</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        function addlik(flag,id) {
            var t="#"+id;
            if(!flag)
            {
                $.get("addlikeServlet",{id:id},function (data){
                    /* $(t).removeClass("glyphicon glyphicon-heart-empty");
                      $(t).addClass("glyphicon glyphicon-heart");
                      $(t).html(data+"");*/
                    window.location.reload();
                });
            }
            else{
                $.get("dellikeServlet",{id:id},function (data){
                    $(t).removeClass("glyphicon glyphicon-heart");
                    $(t).addClass("glyphicon glyphicon-heart-empty");
                    $(t).html(data+"");
                });
            }
            return !flag;
        }

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
                    alert("取消收藏");
                });
            }

        }

    </script>
</head>
<body>
<div class="container" style="margin-top: 70px;" >
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h2 align="center">Tell广场</h2>
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <c:if test="${not empty requestScope.picall}">
                        <c:forEach items="${requestScope.picall}" var="pi" varStatus="s">
                            <div class="col-md-4">
                                <div class="thumbnail">
                                    <img src="${pi.picturepath}" style="height:320px" />
                                    <h6>${pi.username} 于${pi.date}上传</h6>
                                    <c:if test="${pi.bewrite!=null}">
                                        <p>描述:${pi.bewrite}</p>
                                    </c:if>
                                    <button onclick="addlik(${pi.likeflag},${pi.id})" type="button" class="btn btn-default btn-sm">
                                        <c:if test="${pi.likeflag}">
                                            <span id="${pi.id}" class="glyphicon glyphicon-heart">${pi.likecount}</span> 点赞
                                        </c:if>
                                        <c:if test="${!pi.likeflag}">
                                            <span id="${pi.id}" class="glyphicon glyphicon-heart-empty">${pi.likecount}</span> 点赞
                                        </c:if>
                                    </button>
                                    <button type="button" class="btn btn-default btn-sm">
                                        <a href="${pageContext.request.contextPath}/commenServlet?id=${pi.id}"><span class="glyphicon glyphicon-pencil">${pi.comcount}</span> 评论</a>
                                    </button>
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
                    <c:if test="${empty requestScope.picall}">
                        <h2>广场现在空空如也，你快来抢第一个沙发吧！</h2>
                    </c:if>
                </div>
            </div>
        </div>
</div>

 <div id="footer"></div>
 <script type="text/javascript" src="js/include.js"></script>
</body>
</html>
