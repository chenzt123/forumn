<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/4 0004
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/3 0003
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>回复详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
</head>
<body>
<div style="width: 800px; margin: 0 auto;">
    <div style="margin-bottom: 30px;">
        <h1 style="text-align:center" data-id="${comment.commentId}" id="h1">${comment.contTitle}</h1>
    </div>
    <div style="text-align:center; margin-bottom: 30px;">
        <span style="margin-right: 300px;">发布时间：${comment.contPublishTime}</span>
        <span>作者：${comment.contAuthor}</span>
    </div>
    <div style="margin-bottom: 50px;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comment.contContent}</p>
    </div>
    <div style="width: 800px; border-top: 1px solid black; margin-top: 50px; margin-bottom: 30px;"></div>
    <div>
        <p>${comment.memberName}</p>
    </div>
    <div style = "margin-bottom: 20px;">
        <p>${comment.createTime}</p>
    </div>
    <div>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comment.content}</p>
    </div>

    <div style="width: 800px; border-top: 1px solid black; margin-top: 50px; margin-bottom: 30px;"></div>

    <div>
        <p>${revert.memberName}</p>
    </div>

    <div style = "margin-bottom: 20px;">
        <p>${revert.createdTime}</p>
    </div>
    <div>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${revert.content}</p>
    </div>
</div>
</body>
</html>
