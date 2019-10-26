<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>编辑论坛帖子</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins l_ibox">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>编辑论坛帖子 </legend>
                </fieldset>
                <form class="layui-form" action="../informationContent/saveOrUpdate" method="post" id="editForm">
                    <input id="contId" name="contId" hidden value="${content.contId}">
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="topicTitle" maxlength="10" lay-verify="required" value="${forumnTopic.topicTitle}"  autocomplete="off" placeholder="请输入标题(必填项)"  class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">关联期号：</label>
                            <div class="layui-input-block">
                                <input type="text" name="drawId" value="${forumnTopic.drawId}" lay-verify="required" autocomplete="off" placeholder="关联期号(必填项)"  maxlength="10" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">选择系统模块：</label>
                            <div class="layui-input-block">
                                <select  name="relativeModIt"  lay-filter="aihao">
                                    <c:forEach items="${forumnTopicModels}" var="forumnTopicModel" begin="0" step="1" varStatus="star">
                                        <option id="relativeModIt"  name="relativeModIt" value="${forumnTopicModel.modelId}"
                                        <c:if test="${forumnTopic.relativeModIt == forumnTopicModel.modelId}">selected=""</c:if>>${forumnTopicModel.modelTitle}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                    </div>
                    <div class="l_one clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">内容：</label>
                            <div class="layui-input-block">
                                <script id="contContent" name="contContent" type="text">${forumnTopic.topicContent}</script>
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="save" OnClientClick="this.disabled=true;return true;" >保存</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['upload','layer','form', 'layedit', 'laydate', 'table','upload','element'], function() {
        // layui.upload(options);
        var $ = layui.jquery
            , table = layui.table
            , form = layui.form
            , layedit = layui.layedit
            , laydate = layui.laydate
            , upload = layui.upload
            ,element = layui.element
            , layer = layui.layer;

        element.init();

        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        form.on("submit(save)", function (data) {
            $.ajax({
                type: "POST",
                url: "insert",
                data: data.field,
                success: function (data) {
                    if (data.success) {
                        layer.msg(data.information, {
                            icon: 1,time: 500, end: function () {
                                location.reload();
                            }
                        });

                    } else {
                        layer.msg(data.information, {icon: 2});
                    }
                }
            });
            return false;
        });
    })
</script>
<script>
    $(document).ready(function (){
        // UE.delEditor('ueditor');
        var ueditor=UE.getEditor("contContent",{
            initialFrameWidth :'100%',//设置编辑器宽度
            initialFrameHeight:350,//设置编辑器高度
            scaleEnabled:true});
        formvalide['init'].validate("editForm");
    });
</script>

</body>

</html>