<!DOCTYPE html> <html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Freemarker 测试</title>
</head> <body>
<#--这是 freemarker 注释，不会输出到文件中-->
<h1>${name}；${message}</h1>
<br>
<#-- assign-->
<#-- 简单类型-->
<#assign postman ="无赖"/>
郑中基：${postman}
<br>
<#--对象-->
<#assign info={"mobile":"13423457634","address":"村里"}/>
联系电话：${info.mobile},地址：${info.address}
<br>
</body>
</html>