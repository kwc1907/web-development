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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        function deletepic(id) {
            if(confirm("您确定要删除这张图片吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/delPicServlet?id="+id;
            }
        }</script>
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
    </script>
</head>
<body>
<div >
    <div class="container" style="margin-top: 70px;" >
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h2 align="center">个人中心</h2>
            </div>
            <div class="panel-body">
                <div class="col-md-9">
                    <c:if test="${not empty requestScope.pic}"><h2>你上传的图片</h2>
                    <c:forEach items="${requestScope.pic}" var="pi" varStatus="s">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pi.picturepath}" style="height:290px" />
                            <h6>您于${pi.date}上传</h6>
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
                            <button onclick="deletepic(${pi.id});" type="button" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-remove"></span> 删除
                            </button>
                        </div>
                    </div>
                    </c:forEach></c:if>
                    <c:if test="${empty requestScope.pic}">
                        <h2>您当前还未上传过图片</h2>
                    </c:if>
                </div>
                <div class="col-md-3 hidden-xs">
                    <div class="side-bar-card clearfix">
                        <div class="text-center">
                        <p>用户名:${sessionScope.user.username}</p>
                        <p>性别:${sessionScope.user.sex}</p>
                        <p>生日:${sessionScope.user.birthday}</p>
                        <p>邮箱:${sessionScope.user.email}</p>
                        <p>注册时间:${sessionScope.user.registime}</p>
                            <br/><br/><br/><br/>
                        </div>
                        <div class="text-center">
                        <c:if test="${perpiclength!=9}">
                            <h4><a href="${pageContext.request.contextPath}/uppicture.jsp">上传图片</a></h4>
                            <p>你一共可以上传9张图片哦</p>
                            <p>当前您总共上传了${perpiclength}张了</p>
                        </c:if>
                        <c:if test="${perpiclength==9}">
                            <p>你已经上传了9张图片了，无法上传更多了。</p>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
