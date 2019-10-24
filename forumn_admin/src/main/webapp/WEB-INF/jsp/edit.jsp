<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <%--<link rel="stylesheet" type="text/css" href="../resource/lib/z-tree/css/zTreeStyle/zTreeStyle.css" />--%>
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" type="text/css" href="../resource/style/css/main.css" />
    <%--<script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>--%>
<%--    <script src="../resource/lib/z-tree/js/jquery.ztree.core.js" type="text/javascript" charset="utf-8"></script>--%>
<%--    <script src="../resource/lib/z-tree/js/jquery.ztree.excheck.js" type="text/javascript" charset="utf-8"></script>--%>
    <%--<script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/ueditor.config.js"></script>--%>
    <%--<script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/ueditor.all.min.js"> </script>--%>
    <%--<script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/lang/zh-cn	/zh-cn.js"></script>--%>
    <%--    <script src="../resource/layui/layui.js" type="text/javascript" charset="utf-8"></script>--%>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins l_ibox">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>编辑资讯信息</legend>
                </fieldset>
                <form class="layui-form" action="../informationContent/saveOrUpdate" method="post" id="editForm">
                    <input id="contId" name="contId" hidden value="${content.contId}">
                    <div class="l_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="contTitle" lay-verify="required"  autocomplete="off" placeholder="请输入标题" value="${content.contTitle}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">作者：</label>
                            <div class="layui-input-block">
                                <input type="text" name="source" lay-verify="required" autocomplete="off" placeholder="作者不能为空" value="${content.source}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-input-inline">
                            <label class="layui-form-label">类别:</label>
                            <div class="layui-input-inline">
                                <select name="columnId" id="columnId" lay-filter="aihao">
                                    <option value=""></option>
                                    <c:forEach items="${typeList}" var="informationType" begin="0" step="1" varStatus="star">
                                        <option value="${informationType.columnId}" <c:if test="${content.columnId == informationType.columnId}">selected="selected"</c:if>>${informationType.columnName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="l_three clearfix">
                    <div class="layui-from-item">
                        <label class="layui-form-label">类型：</label>
                        <div class="layui-input-block" id="IsPurchased">
                            <input type="radio" name="contentType" lay-filter="aaa" value="1" title="图文" <c:if test="${content.contentType == 1}">checked=""</c:if>>
                            <input type="radio" name="contentType" lay-filter="aaa" value="0" title="文章" <c:if test="${content.contentType == 0}">checked=""</c:if>>
                            <input type="radio" name="contentType" lay-filter="aaa" value="2" title="视频" <c:if test="${content.contentType == 2}">checked=""</c:if>>
                        </div>
                    </div>
                    </div>

                    <div class="l_three clearfix" id = "headPics">
                        <div class="layui-form-item">
                                <label class="layui-form-label">首页图片：</label>
                            <div class="layui-input-block">
                            <input id="headPic" name="headPic" hidden value="${content.headPic}">
                                    <button type="button" class="layui-btn" id="test2">多图片上传</button>
                                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                                        预览图：
                                        <div class="layui-from-item layui-upload-list" id="demo2">
                                            <c:if test="${!empty picList}">
                                                <c:forEach items="${picList}" var="pic" begin="0" step="1" varStatus="star">
                                                <img class="layui-upload-img" <c:if test="${pic != ''}">src ="${pic}"</c:if>>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </blockquote>
                            </div>
                        </div>
                    </div>
<%--视频--%>
                    <div class="l_three clearfix" id = "headVideo">
                        <div class="layui-form-item">
                            <%--<button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传视频</button>--%>
                            <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
                            <%--<legend>上传视频</legend>--%>
                            <%--</fieldset>--%>
                            <%--<div class="layui-form-item" id="videoUp">--%>
                            <%--<input id="videoUrl" name="videoUrl" hidden value="${content.headPic}">--%>
                            <%--<button type="button" class="layui-btn" id="test1">--%>
                            <%--<i class="layui-icon">&#xe67c;</i>上传视频--%>
                            <%--</button>--%>
                            <%--</div>--%>
                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                                <legend>上传视频</legend>
                            </fieldset>
                            <div class="layui-form-item" id="videoUp">
                                <label class="layui-form-label" style="height: 137px; line-height: 117px">视频</label>
                                <input name="classVideo" id="videoUrl"  value="${content.headPic}" autocomplete="off" class="layui-input" type="hidden">
                                <div class=" layui-upload-drag" id="video" style="border-left: 0px;" type="video">
                                    <i class="layui-icon">&#xe654;</i>
                                    <p>点击上传</p>
                                    <video id="demo3" src="" style="position: absolute;height: 137px;width: 137px;margin: -106px auto auto -60px;"/>
                                </div>
                                <input type="button" value="预览" onclick="openVideo()" style="margin-left: 30px">
                            </div>

                        </div>
                    </div>
                    <div class="l_one clearfix">
                    <div class="layui-form-item">
                        <label class="layui-form-label">内容：</label>
                        <div class="layui-input-block">
                            <script id="contContent" name="contContent" type="text">${content.contContent}</script>
                            <%--<input type="text" name="contContent" lay-verify="required" autocomplete="off" placeholder="请输入内容" value="${content.contContent}" class="layui-input">--%>
                        </div>
                    </div>
                    </div>
                    <div class="l_three clearfix">
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
    layui.use(['upload','layer','form', 'layedit', 'laydate', 'table','upload'], function() {
        // layui.upload(options);
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate;
            upload = layui.upload,
            layer = layui.layer
            $ = layui.jquery;

        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '../ueditor/uploadImgs'
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    // $('#demo2').attr('src', result); //图片链接（base64）
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                    // $('#headPic').val(result);
                });
            }
            ,done: function(res){
                // alert(res.state);
                // debugger;
                //如果上传失败
                if(res.state == 'SUCCESS'){

                    var pic = $('#headPic').val();
                    if(pic != ""){
                        alert(pic+","+res.url);
                        $('#headPic').val(pic+","+res.url);
                    }else{
                        $('#headPic').val(res.url);
                    }
                    // debugger;
                    // alert(res);

                    // return layer.msg(res.url);

                }else{
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            ,success:function(data){
                alert(data);
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    upload.upload();
                });
            }
        });


        form.on("submit(save)", function(data) {
            // alert(data);
            //弹出提交内容
            /*layer.alert(JSON.stringify(data.field), {
            title: '最终的提交信息'
            });*/
            //debugger;
            var contentType = $("input[name='contentType']:checked").val();
            // var contTitle = $("input[name='contTitle']").val();
            // alert(contentType);
            if(contentType==null || contentType=="" ){
                // debugger;
                layer.msg("请选择文章类型");
                return false;
            }
            $.ajax({
                type:"POST",
                url:"../informationContent/saveOrUpdate",
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
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

// 类型点击时间
        form.on('radio(aaa)', function (data) {

            if ($('#IsPurchased input[name="contentType"]:checked ').val() == "0") {
                $("#headPics").hide();
                $("#headVideo").hide();
            }
            else if($('#IsPurchased input[name="contentType"]:checked ').val() == "1"){
                $("#headPics").show();
                $("#headVideo").hide();
            }else if($('#IsPurchased input[name="contentType"]:checked ').val() == "2"){
                $("#headPics").hide();
                $("#headVideo").show();
            }
            form.render();
        });


    //上传视频
    var uploadInst = upload.render({
        elem: '#video'
        , url: '../ueditor/uploadImgs'
        , field: "layuiVideo"
        , multiple: false
        // ,data:{"dir":"media"}
        , accept: 'video' //视频
        , size: "102400"
        //, method: "post"
        , before: function (obj) {
            //     $('#demo3').css('display','block').attr('src', "http://p6nngxvb7.bkt.clouddn.com/FsyjSltTtkVtzepa_w7zsnS_S7zO"); //链接（base64）http://p6nngxvb7.bkt.clouddn.com/FsyjSltTtkVtzepa_w7zsnS_S7zO
            // }
            obj.preview(function (index, file, result) {
                $('#demo3').attr('src', result); //图片链接（base64）
                $('#demo3').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                // $('#headPic').val(result);
            });
        }
        , done: function (res) {
            // alert(res.state);
            // debugger;
            //如果上传失败
            if (res.state == 'SUCCESS') {

                var pic = $('#headPic').val();
                if (pic == null) {
                    $('#headPic').val(pic + "," + res.url);
                } else {
                    $('#headPic').val(res.url);
                }
                // debugger;
                // alert(res);

                // return layer.msg(res.url);

            } else {
                return layer.msg('上传失败');
            }
            //上传成功
        }
        , success: function (data) {
            alert(data);
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }

    });
    });
</script>
<script type="text/javascript">

    // function savefun(){
    //     var contentType = $("input[name='contentType']:checked").val();
    //     var contTitle = $("input[name='contTitle']").val();
    //     // alert(contentType);
    //     if(contentType==null || contentType=="" ){
    //         // debugger;
    //         layer.msg("请选择文章类型");
    //         return false;
    //     }if(contTitle==null || contTitle=="" ){
    //         // debugger;
    //         layer.msg("文章标题不能为空");
    //         return false;
    //     }
    //     $.ajax({
    //         type:"POST",
    //         url:"../informationContent/saveOrUpdate",
    //         data: $('#editForm').serialize(),
    //         dataType:"json",
    //         success:function(data){
    //             layer.msg(data.msg, {
    //                 icon: 1, time: 500, end: function () {
    //                     if(data.msg.indexOf('成功') != -1){
    //
    //                         location.reload();
    //                     }
    //                 }
    //             });
    //         }
    //     });
    //     //loading
    //     var index = layer.msg('提交中，请稍候', {
    //         icon: 16,
    //         time: false,
    //         shade: 0.5
    //     });
    //     setTimeout(function() {
    //         layer.close(index);
    //         // layer.msg("保存成功")
    //         // location.reload();
    //         layer.msg("保存成功", {
    //             icon: 1, time: 500, end: function () {
    //                     location.reload();
    //
    //             }
    //         });
    //     }, 1000);
    //
    //     layui.upload({
    //         url: 'http://192.168.1.188:22222/file/upload'
    //         ,success: function(res){
    //             console.log(res); //上传成功返回值，必须为json格式
    //         }
    //     });
    //
    // }
    var flag = ${addFlag};

    if(flag==true){
        $("#headPics").hide();
        $("#headVideo").hide();
    }else{
        var type = ${content.contentType};
        if(type != null && type != "") {
            if (type == 2) {
                $("#headPics").hide();
            } else if (type == 0) {
                $("#headPics").hide();
                $("#headVideo").hide();

            } else if (type == 1) {
                $("#headVideo").hide();
            }
        }

            function openVideo() {

                var classVideo = document.getElementById("videoUrl").value;
                var index = layer.open({
                    type: 2,
                    content: '/ueditor/goLook?classVideo=' + classVideo,
                    area: ['600px', '450px'],
                    offset: 't',
                    maxmin: true,
                    end: function () {

                    }
                });
            }
    }
</script>
<script>
    $(document).ready(function (){
        // UE.delEditor('ueditor');
        var ueditor=UE.getEditor("contContent",{
            initialFrameWidth :'100%',//设置编辑器宽度
            initialFrameHeight:350,//设置编辑器高度
            scaleEnabled:true});
        formvalide['init'].validate("editForm");


        $('input:radio[name="contentType"]').click(function(){
            var checkValue = $('input:radio[name="contentType"]:checked').val();
            alert(checkValue);
        });
    });
</script>

</body>

</html>