<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图片上传</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <script src="/static/layui/layui.js"></script>
    <script src="/static/js/jquery.min.js"></script>
</head>

<body>
<div class="kit-doc">
</div>
<!--这里写页面的代码-->
<h1>h5 video</h1>
<div id="box">
    <video id="video" controls preload="auto" width="400px" height="300px">
        <source src="${kitG}" type="video/mp4">
    </video>
</div>


</div>

<script>
    layer.open({
        type: 1,
        title: false,
        shadeClose: true,
        area: ['400px', '350px'],
        content: $('#box'),
        success: function(layero){
            //layer样式layer-anim导致全屏样式错乱，移除该样式即可
            setTimeout(function() {
                $(layero).removeClass('layer-anim');
            }, 0);
        }
    });
</script>

</body>

</html>