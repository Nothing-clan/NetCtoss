<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--设置为异常处理页面才可以使用exception隐藏对象--%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>达内－NetCTOSS</title>
    <link type="text/css" rel="stylesheet" media="all" href="styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css"/>
    <script language="javascript" type="text/javascript">
        var timer;

        //启动跳转的定时器
        function startTimes() {
            timer = window.setInterval(showSecondes, 1000);
        }

        var i = 3;

        function showSecondes() {
            if (i > 0) {
                i--;
                document.getElementById("secondes").innerHTML = i;
            }
            else {
                window.clearInterval(timer);
                location.href = "/netctoss/toLogin.do";
            }
        }

        //取消跳转
        function resetTimer() {
            if (timer != null && timer != undefined) {
                window.clearInterval(timer);
                location.href = "/netctoss/toLogin.do";
            }
        }
    </script>
</head>
<body class="error_page" onload="startTimes();">
<h1 id="error">
    遇到错误，&nbsp;<span id="secondes">3</span>&nbsp;秒后将自动跳转，立即跳转请点击&nbsp;
    <a href="javascript:resetTimer();">返回</a>
    <div style="color: red;font-size: 24pt;"><%= exception.getMessage() %></div>
</h1>
</body>
</html>
    