<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="first.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>更改密码</title>
    <link rel="stylesheet" href="css/register.css">
    <!--导入jquery-->

    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        function checkPassword1() {
            var password = $("#password").val();
            var reg_password = /^\w{8,20}$/;
            var flag = reg_password.test(password);
            if(flag){
                //密码合法
                $("#password").css("border","");
                $("#spass").html("");
            }else{
                //密码非法,加一个红色边框
                $("#password").css("border","1px solid red");
                $("#spass").css("color","red");$("#spass").html("密码长度需在8-20位");
            }
            return flag;
        }
        function checkPassword2() {
            var password = $("#newpassword").val();
            var reg_password = /^\w{8,20}$/;
            var flag = reg_password.test(password);
            if(flag){
                //密码合法
                $("#newpassword").css("border","");
                $("#newspass").html("");
            }else{
                //密码非法,加一个红色边框
                $("#newpassword").css("border","1px solid red");
                $("#newspass").css("color","red");$("#newspass").html("密码长度需在8-20位");
            }
            return flag;
        }
        function checkPassword3() {
            var password = $("#confirmpassword").val();
            var reg_password = /^\w{8,20}$/;
            var flag = reg_password.test(password);
            var newpassword=$("#newpassword").val();
            if(flag){
                //密码合法
                $("#confirmpassword").css("border","");
                $("#conspass").html("");
            }else{
                //密码非法,加一个红色边框
                $("#confirmpassword").css("border","1px solid red");
                $("#conspass").css("color","red");$("#conspass").html("密码长度需在8-20位");return flag;
            }
            if(password==newpassword)
            {
                $("#confirmpassword").css("border","");
                $("#conspass").html("");
            }
            else{
                $("#confirmpassword").css("border","1px solid red");
                $("#conspass").css("color","red");$("#conspass").html("两次密码输入不一致");flag=0;
                return flag;
            }
            return flag;
        }
        $(function () {
            $("#updatepass").submit(function(){
                if(checkPassword1() && checkPassword2() && checkPassword3()){
                    var password = $("#password").val();
                    var t=${sessionScope.user.password};
                    if(password==t)
                    {
                    return true}
                    else
                    {
                        alert("旧密码输入不正确");
                        return false;
                    }
                }else{
                    $("#errorMsg").html("仍有不符合要求的更改信息！");
                } return false;
            });
            $("#confirmpassword").blur(checkPassword3);
            $("#password").blur(checkPassword1);
            $("#newpassword").blur(checkPassword2);
        });


    </script>

</head>
<body>
<div class="rg_layout" >
    <div class="rg_form clearfix" style="width: 500px;height: 400px;margin: 1px">
        <div class="rg_form_left">
            <p>更改密码</p>
            <p>UPDATE PASSWORD</p>
        </div>
        <div class="rg_form_center">
            <div id="errorMsg" style="color:#ff0000;text-align: center"></div>
            <div style="color:black;text-align: center">${ti}</div>
            <form id="updatepass" action="/Tell/updatepasswordServlet" method="post">
                <input type="hidden" name="action" value="register">

                <table style="margin-top: 25px;">
                    <tr>
                        <td class="td_left">
                            <label for="password">旧密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password" name="password" placeholder="请输入密码"></span>
                        </td>
                        <td><span style="font-size: 0.5em;" id="spass"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="newpassword">新密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="newpassword" name="newpassword" placeholder="请输入新密码">

                        </td>
                        <td><span style="font-size: 0.5em;" id="newspass"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="confirmpassword">确认密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="confirmpassword" name="confirmpassword" placeholder="请确认密码">
                        </td>
                        <td><span style="font-size: 0.5em;" id="conspass"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right check">
                            <input type="submit" class="submit" value="提交">
                            <span id="msg" style="color: red;"></span>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div id="footer"></div>
<script type="text/javascript" src="js/include.js"></script>
</body>
</html>