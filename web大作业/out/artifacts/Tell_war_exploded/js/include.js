$(function () {
    $.get("first.jsp",function (data) {
        $("#header").html(data);
    });
    $.get("foot.html",function (data) {
        $("#footer").html(data);
    });
});