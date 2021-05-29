<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2021/5/6
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/comment.css">
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
                    /*$(t).removeClass("glyphicon glyphicon-heart");
                    $(t).addClass("glyphicon glyphicon-heart-empty");
                    $(t).html(data+"");*/
                    window.location.reload();
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
        function addcom(pid) {
            var a=$("#content").val();
            $.get("addcommenServlet",{pid:pid,content:a},function () {
                window.location.reload();
            });
        }
        function delcom(id,pid) {
            $.get("delcommenServlet",{id:id,pid:pid},function () {
                window.location.reload();
            });
        }
    </script>
</head>
<body>
<div >
    <div class="container" style="margin-top: 70px;" >
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h2 align="center">评论详情页</h2>
            </div>
            <div class="panel-body">
                <div class="all">
                    <div class="layout">
                        上传者:${requestScope.picture.username}<br/>
                        上传时间:${requestScope.picture.date}<br/>
                        描述:${requestScope.picture.bewrite}</div>
                </div>
                <img src="${requestScope.picture.picturepath}" class="img-responsive center-block" style="margin-top: 15px; width: 600px;height: 650px;"><br/>
                <div class="col-md-offset-5">
                    <button onclick="addlik(${picture.likeflag},${picture.id})" type="button" class="btn btn-default btn-sm">
                        <c:if test="${picture.likeflag}">
                            <span id="${picture.id}" class="glyphicon glyphicon-heart">${picture.likecount}</span> 点赞
                        </c:if>
                        <c:if test="${!picture.likeflag}">
                            <span id="${picture.id}" class="glyphicon glyphicon-heart-empty">${picture.likecount}</span> 点赞
                        </c:if>
                    </button>
                    <button onclick="fav(${picture.favourflag},${picture.id})" type="button" class="btn btn-default btn-sm">
                        <c:if test="${picture.favourflag}">
                            <span class="glyphicon glyphicon-star"></span> 收藏
                        </c:if>
                        <c:if test="${!picture.favourflag}">
                            <span class="glyphicon  glyphicon-star-empty"></span> 收藏
                        </c:if>
                    </button></div>
                <div class="zi">
                    <h3 class="col-md-offset-5">评论</h3><br/>
                    <textarea maxlength="100" class="form-control" rows="5" style="margin-top:-15px;width: 90%" id="content" name="content" placeholder="来说两句吧...(请注意文明用语哦！)"></textarea>
                   <button onclick="addcom(${picture.id})" class="col-md-offset-10" type="button" class="btn btn-primary">提交评论</button>
                </div>
                <div class="alre">
                    <c:if test="${not empty requestScope.comment}">
                        <c:forEach items="${requestScope.comment}" var="com" varStatus="c">
                            <h4>${com.username}</h4>
                            <span style="font-size: 1.2em">${com.comment}</span>
                            <c:if test="${com.uid==sessionScope.user.id}">
                            <a href="javascript:delcom(${com.id},${com.pid});" style="float: right">删除</a>
                            </c:if>
                            <p style="font-size: 0.9em" align="right">${com.date}</p>
                            <hr style="color:rgba(2,255,217,0.58)"  />
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.comment}">
                        <h3>评论区空空如也，快来抢第一个沙发吧</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

