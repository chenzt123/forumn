<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>咨讯设置</title>
		<link rel="stylesheet" type="text/css" href="../resource/css/public_style.css"/>
		<link rel="stylesheet" type="text/css" href="../resource/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="../resource/css/consulting_options.css"/>
	</head>
	<body>
		
		<div class="warpss">
			
			<div class="zixun">
				资讯设置
			</div>
		
		<!-- 内容展示 -->
			<div class="neirong">
				内容展示
			</div>
			<div class="tableOne">
				<table class="layui-table " lay-skin="line">
				  <colgroup>
					<col width="150">
					<col width="200">
					<col>
				  </colgroup>
				  <thead>
					<tr>
					  <th style="text-align: center">显示名称</th>
					  <th style="text-align: center">是否显示</th>
					</tr>
				  </thead>
				  <tbody>

				  <c:if test="${!empty allShowList}">
					  <c:forEach items="${allShowList}" var="InformationShowSetting" begin="0" step="1" varStatus="status">
						  <tr>
							  <td>${InformationShowSetting.showName}</td>
							  <td>
								  <!-- 开关 -->
								  <form class="layui-form" action="" lay-filter="example">
									  <div class="layui-form-item">
										  <div class="layui-input-block">
											  <input type="checkbox" lay-skin="switch" lay-filter="switchShow"
													 <c:if test="${InformationShowSetting.isShow == 1}">checked</c:if>
													 <c:if test="${InformationShowSetting.isShow == 0}">unchecked</c:if>
													 lay-text="ON|OFF"
													 value="${InformationShowSetting.id}"/>
										  </div>
									  </div>
								  </form>
							  </td>

						  </tr>
					  </c:forEach>
				  </c:if>
				  </tbody>
				</table>
			</div>
				<br/>
			<!-- 功能设置 -->
			<div class="gongneng" style="position: relative;left:55px;">
				功能设置
			</div>
			<div class="tableTwo">
				<table class="layui-table " lay-skin="line">
				  <colgroup>
					<col width="150">
					<col width="200">
					<col>
				  </colgroup>
				  <thead>
					<tr>
					  <th style="text-align: center">功能名称</th>
					  <th style="text-align: center">是否开启</th>
					 
					</tr> 
				  </thead>
				  <tbody>

				  <c:if test="${!empty allFunctionList}">
					  <c:forEach items="${allFunctionList}" var="InformationFunctionSetting" begin="0" step="1" varStatus="status">
						  <tr>
							  <td>${InformationFunctionSetting.functionName}</td>
							  <td>
								  <!-- 开关 -->
								  <form class="layui-form" action="" lay-filter="example">
									  <div class="layui-form-item">
										  <div class="layui-input-block">
											  <input type="checkbox" lay-skin="switch" lay-filter="switchFunction"
													 <c:if test="${InformationFunctionSetting.isUse == 1}">checked</c:if>
													 <c:if test="${InformationFunctionSetting.isUse == 0}">unchecked</c:if>
													 lay-text="ON|OFF" value="${InformationFunctionSetting.id}"/>
										  </div>
									  </div>
								  </form>
							  </td>
						  </tr>
					  </c:forEach>
				  </c:if>
				  </tbody>
				</table>
			</div>
			
		
		
		</div>
	</body>
	<script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script src="../resource/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form,layer = layui.layer,layedit = layui.layedit,laydate = layui.laydate;
		 //监听指定开关
		  form.on('switch(switchShow)', function(data){
				var params = {
					id:data.value,
					isShow:0
				};
				if(this.checked){
					params = {
						id:data.value,
						isShow:1
					}
				}
				$.ajax({
				  type:"POST",
				  url:"settingShowSitch",
				  data: params,
				  dataType:"json",
				  success:function(data){
						layer.msg(data.msg, {
							icon: 1, time: 400, end: function () {
									location.reload();
							}
						});
				  }
				});
				return false;
			});
			form.on('switch(switchFunction)', function(data){
				var params = {
					id:data.value,
					isUse:0
				};
				if(this.checked){
					params = {
						id:data.value,
						isUse:1
					}
				}
				$.ajax({
					type:"POST",
					url:"settingFunctionSitch",
					data: params,
					dataType:"json",
					success:function(data){
						layer.msg(data.msg, {
							icon: 1, time: 400, end: function () {
								location.reload();
							}
						});
					}
				});
				return false;
			});
		});
		
	</script>
	
</html>
