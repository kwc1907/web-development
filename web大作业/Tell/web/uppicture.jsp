
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>上传图片</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="container" style="margin-top: 70px;" >
    <div class="col-md-9">
    <form action="${pageContext.request.contextPath}/upPictureServlet" method="post"   enctype="multipart/form-data" >
        <div id="pre">
            <input type="file" id="file" name="uploadFile"/>
        </div>
        <label class="control-label" style="font-size: 1.2em;margin-top:10px">这一刻的想法:</label>
        <label class="control-label">(感想不能超过20字哦)</label>
        <input name="bewrite" class="form-control"type="text" size="20" maxlength="20" />
        <input class="btn btn-primary center-block" style="margin-top: 15px" type="submit" value="上传信息"/>
    </form></div>

<div class="col-md-3 hidden-xs">
    <div class="side-bar-card clearfix">
        <div class="text-center">
            <p>用户名:${sessionScope.user.username}</p>
            <p>性别:${sessionScope.user.sex}</p>
            <p>生日:${sessionScope.user.birthday}</p>
            <p>邮箱:${sessionScope.user.email}</p>
            <p>注册时间:${sessionScope.user.registime}</p>
            <br/><br/><br/><br/>
        </div></div>
    </div>
</div>
<script>
    var pre=document.getElementById("pre");
    var img=document.createElement("img");
    var file=document.getElementById("file");
    file.onchange=function () {
        var fileReader=new FileReader();
        fileReader.readAsDataURL(this.files[0]);
        fileReader.onload=function () {
            img.src=fileReader.result;
            img.style.width="300px";
            pre.appendChild(img);
        };
    };
</script>

</body>
</html>
