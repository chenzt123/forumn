<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<%--<title>编辑</title>--%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../resource/lib/z-tree/css/zTreeStyle/zTreeStyle.css" />
	<link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
	<link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
	<script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox float-e-margins l_ibox">
				<fieldset class="layui-elem-field layui-field-title">
					<legend>资讯类型修改</legend>
				</fieldset>
				<form class="layui-form">
					<input type="hidden" name="columnId" value="${informationType.columnId}"/>
					<div class="l_three clearfix">
						<div class="layui-form-item">
							<label class="layui-form-label">类型名称：</label>
							<div class="layui-input-block">
								<input type="text" name="columnName" lay-verify="required" autocomplete="off" placeholder="请输入类型名称" value="${informationType.columnName}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">拼音code：</label>
							<div class="layui-input-block">
								<input type="text" name="columnCode" lay-verify="required" autocomplete="off" placeholder="请输入拼音码" value="${informationType.columnCode}" class="layui-input">
							</div>
						</div>
					</div>
					<div class="l_three clearfix">
						<%-- todo 暂时隐藏
						<div class="layui-form-item">
							<label class="layui-form-label">父类型：</label>
							<div class="layui-input-block">
								<select name="parColumnId" lay-filter="aihao">
									<option value=""></option>
									<c:forEach items="${parColumnNameList}" var="parColumnName" begin="0" step="1" varStatus="star">
										<option value="${parColumnName.columnId}" <c:if test="${informationType.columnId == parColumnName.columnId}">selected="selected"</c:if>>${parColumnName.columnName}</option>
									</c:forEach>
								</select>
							</div>
						</div>--%>
						<div class="layui-form-item">
							<label class="layui-form-label">等级：</label>
							<div class="layui-input-block">
								<input type="text" name="columnLevel" lay-verify="required|number" placeholder="请输入等级" value="${informationType.columnLevel}" autocomplete="off" class="layui-input">
							</div>
						</div>

					</div>
					<div class="l_three clearfix">

						<div class="layui-form-item">
							<label class="layui-form-label">排序：</label>
							<div class="layui-input-block">
								<input type="text" name="columnSeq" lay-verify="number" placeholder="请输入排序数值（越大越靠前）默认为0"
								<c:choose>
								<c:when test="${not empty informationType.columnSeq}">
									   value="${informationType.columnSeq}"
								</c:when>
								<c:otherwise>
									   value = "0"
								</c:otherwise>
								</c:choose>
									   onfocus="if(value=='${informationType.columnSeq}'){value=''}"
									   onblur="if(value==''){value='${informationType.columnSeq}'}"
									   autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">允许添加多条：</label>
							<div class="layui-input-block">
								<input type="radio" name="ismany" value="1" title="是" <c:if test="${informationType.ismany eq 1}">checked=true</c:if> />
								<input type="radio" name="ismany" value="0" title="否" <c:if test="${informationType.ismany eq 0}">checked=true</c:if> />
							</div>
						</div>
					</div>
					<div class="l_three clearfix">

						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">备注：</label>
							<div class="layui-input-block">
								<textarea placeholder="请输入内容" class="layui-textarea" name="columnDesc">${informationType.columnDesc}</textarea>
							</div>
						</div>
					</div>

					<div class="l_three clearfix">
						<div class="layui-form-item">
							<label class="layui-form-label">创建时间：</label>
							<div class="layui-input-block">
								<input disabled="disabled" style="background-color:darkgrey" type="text" id="date"  placeholder="保存后自动生成" autocomplete="off" value="${informationType.createTime}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"></label>
							<div class="layui-input-block">
								<button class="layui-btn save-btn" lay-submit="" lay-filter="save">保存</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	layui.use(['form', 'layedit', 'laydate', 'table'], function() {
		var table = layui.table,
				form = layui.form,
				layedit = layui.layedit,
				laydate = layui.laydate;
		/*laydate.render({
            elem: '#date'
        });*/
		/*laydate.render({elem: '#from_date',type: 'datetime'});
        laydate.render({elem: '#to_date',type: 'datetime'});*/
		//自定义验证规则
		form.verify({
			title: function(value) {
				if(value.length < 5) {
					return '标题至少得5个字符啊';
				}
			},
			pass: [/(.+){6,12}$/, '密码必须6到12位'],
			content: function(value) {
				layedit.sync(editIndex);
			}
		});
		//保存loading
		form.on("submit(save)", function(data) {
			// alert(data);
			//弹出提交内容
			/*layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });*/
			//debugger;
			$.ajax({
				type:"POST",
				url:"addOrUpdate",
				data: data.field,
				dataType:"json",
				success:function(data){
					layer.msg(data.msg, {
						icon: 1, time: 500, end: function () {
							if(data.msg.indexOf('成功') != -1){
								location.reload();
							}
						}
					});
				}
			});
			//loading
			/*var index = layer.msg('提交中，请稍候', {
                icon: 16,
                time: false,
                shade: 0.8
            });*/
			/*setTimeout(function() {
                layer.close(index);
                layer.msg("提交成功！");
            }, 2000);*/
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
		//查看图片
		$(".img-block span img").click(function() {
			layer.photos({
				title: "商品图片详细",
				shade: '0.9',
				photos: ".img-block" //格式见API文档手册页
				,
				anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机
			});
		});
	});
</script>
<script type="text/javascript">
	var setting = {
		view: {
			showIcon : false,
			selectedMulti : true,     //可以多选
			showLine : false,
			expandSpeed : 'fast',
		},
		check : {
			enable : true,
			chkStyle : "checkbox",    //复选框
			chkboxType : {
				"Y" : "s",
				"N" : "ps"
			}
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: beforeClick,
			onClick: onClick
		}
	};

	var zNodes = [{
		id: 1,
		pId: 0,
		name: "北京"
	},
		{
			id: 2,
			pId: 0,
			name: "天津"
		},
		{
			id: 3,
			pId: 0,
			name: "上海"
		},
		{
			id: 6,
			pId: 0,
			name: "重庆"
		},
		{
			id: 4,
			pId: 0,
			name: "河北省"
		},
		{
			id: 41,
			pId: 4,
			name: "石家庄"
		},
		{
			id: 42,
			pId: 4,
			name: "保定"
		},
		{
			id: 43,
			pId: 4,
			name: "邯郸"
		},
		{
			id: 44,
			pId: 4,
			name: "承德"
		},
		{
			id: 5,
			pId: 0,
			name: "广东省"
		},
		{
			id: 51,
			pId: 5,
			name: "广州"
		},
		{
			id: 52,
			pId: 5,
			name: "深圳"
		},
		{
			id: 53,
			pId: 5,
			name: "东莞"
		},
		{
			id: 54,
			pId: 5,
			name: "佛山"
		},
		{
			id: 6,
			pId: 0,
			name: "福建省"
		},
		{
			id: 61,
			pId: 6,
			name: "福州"
		},
		{
			id: 62,
			pId: 6,
			name: "厦门"
		},
		{
			id: 63,
			pId: 6,
			name: "泉州"
		},
		{
			id: 64,
			pId: 6,
			name: "三明"
		}
	];

	function beforeClick(treeId, treeNode) {

	}

	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getSelectedNodes(),
				v = "";
		for(var i = 0, l = nodes.length; i < l; i++) {
			v += nodes[i].name + ",";
		}
		if(v.length > 0) v = v.substring(0, v.length - 1);
		var cityObj = $("#citySel");
		cityObj.attr("value", v);
	}

	function showMenu() {
		var cityObj = $("#citySel");
		var cityOffset = $("#citySel").offset();
		$("#menuContent").css({
			left: "0px",
			top: cityObj.outerHeight() + "px",
			width: cityObj.outerWidth() + "px"
		}).slideDown("fast");

		$(document).bind("mousedown", onBodyDown);
	}

	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$(document).unbind("mousedown", onBodyDown);
	}

	function onBodyDown(event) {
		if(!(event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
			hideMenu();
		}
	}

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	window.onresize = function() {
		var cityObj = $("#citySel");
		var cityOffset = $("#citySel").offset();
		$("#menuContent").css({
			left: "0px",
			top: cityObj.outerHeight() + "px",
			width: cityObj.outerWidth() + "px"
		});

	}
</script>

</body>

</html>