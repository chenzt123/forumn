<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/27 0027
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <title>评论列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/main.css" media="all">
<%--    <script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="../resource/style/js/formCheck.js"></script>
    <script src="../resource/style/js/formSubmitWithPost.js"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12 m_col-sm-12">
            <div class="ibox float-e-margins m_userinfo">
                <%--<form class="layui-form" action="../comment/findCommentList" method="post" id="query">--%>
                <form class="layui-form" id="query">
                    <div class="layui-inline">
                        <label class="layui-form-label">评论内容:</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="commentContent"  autocomplete="off"
                                   class="layui-input" placeholder="请输入关键字" id="keyword">
                        </div>
                    </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">评论状态:</label>
                            <div class="layui-input-inline">
                                <select name="commentStatus" id="revertId">
                                    <option value="-1" <c:if test="${commentStatus == -1}">selected="selected"</c:if>>全部</option>
                                    <option value="0" <c:if test="${commentStatus == 0}">selected="selected"</c:if>>未评论</option>
                                    <option value="1" <c:if test="${commentStatus == 1}">selected="selected"</c:if>>已评论</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">评论类型:</label>
                            <div class="layui-input-inline">
                                <select name="commentType" id="commentType">
                                    <option value="" selected="selected">全部</option>
                                    <c:forEach items="${sensitiveContList}" var="item">
                                        <option <c:if test="${sensitiveContId == item.sensitiveContId}">selected="selected"</c:if>>${item.sensitiveCont}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="button" class="layui-btn" id="search" lay-filter="demo1" style="float:right;margin-left: 40px;" onclick="queryContentCommentAJAX('${contId}')">搜索</button>
                            <button type="button" class="layui-btn layui-btn-warm" id="search1" lay-filter="demo1" style="margin-left: 20px;" onclick="resetPostsComment()">重置</button>
                        </div>
                    <div class="layui-form-item">
                        <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1" style="float:right;margin-right: 20px;" onclick="batchEnableComment()">批量启用</button>
                        <button type="button" class="layui-btn layui-btn-danger" id="del" style="float:right;margin-right: 20px;" onclick="batchDisableComment()">批量禁用</button>
                    </div>
            </form>
        </div>
    </div>
</div>
<div class="layui-fluid">
    <div class="layui-form">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <table class="layui-table m_table" lay-filter="demo1" id="commentTable">
                            <%--                            <colgroup>--%>
                            <%--                                <col width="0%">--%>
                            <%--                                <col width="5%">--%>
                            <%--                                <col width="20%">--%>
                            <%--                                <col width="10%">--%>
                            <%--                                <col width="10%">--%>
                            <%--                                <col width="10%">--%>
                            <%--                                <col width="10%">--%>
                            <%--                                <col width="165px">--%>
                            <%--                            </colgroup>--%>
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox" id="commentCheckbox">全选</th>

                                <th style="text-align: center;">评论内容</th>
                                <th style="text-align: center;">点赞数</th>
                                <th style="text-align: center;">回复数</th>
                                <th style="text-align: center;">评论时间</th>
                                <th style="text-align: center;">评论者</th>
                                <th style="text-align: center;">状态</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="commentTbody">
                            <c:forEach items="${commentList}" var="item" >
                                <tr>
                                    <td><input type="checkbox" id="isSelect" lay-skin="primary" class="l_table_checkbox" data-id="${item.commentId}"></td>
                                    <td>${item.content}</td>
                                    <td style="text-align: center;">${item.thumbsUp}</td>
                                    <td style="text-align: center; <c:if test="${item.byReply > 0}"> color:#38aaff" onclick="queryCommentRevert('${item.commentId}')" </c:if> id="commentByReply">${item.byReply}</td>
                                    <td style="text-align: center;">${item.createTime}</td>
                                    <td style="text-align: center;">${item.memberName}</td>
                                    <td style="text-align: center;"><c:if test="${item.isForbidden==0}">启用</c:if><c:if test="${item.isForbidden==1}">禁用</c:if></td>

                                    <td>
                                        <a class="layui-btn layui-btn-xs redact" lay-event="examine" onclick="queryCommentDetail('${item.commentId}')">详情</a>
                                        <a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="deleteComment('${item.commentId}')">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="pageInfo2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script>
    var contId = '${contId}';
        layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate,
            laypage = layui.laypage,
            layer = layui.layer;

        //常规用法
        laydate.render({
            elem: '#date'
        });
        //分页
        laypage.render({
            elem: 'pageInfo2',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    queryContentCommentAJAX(contId,obj.curr);
                    // var params = {
                    //     "pageNum": obj.curr,
                    //     "title": $('#title').val(),
                    //     "postsTypeId": $('#postsTypeId').val(),
                    //     "commentStatus": $('#commentStatus').val()
                    // };
                    // httpPost("/posts/queryAll", params);
                    // window.location.href="getMemberList?pageNo="+obj.curr;
                }
                // console.log(obj.curr)
            }
        });
        // //自定义验证规则
        // form.verify({
        //     title: function(value) {
        //         if(value.length < 5) {
        //             return '标题至少得5个字符啊';
        //         }
        //     },
        //     pass: [/(.+){6,12}$/, '密码必须6到12位'],
        //     content: function(value) {
        //         layedit.sync(editIndex);
        //     }
       // });
            form.on('checkbox(allChoose)', function(data) {
                var child = $(data.elem).parents('.layui-form').find('tbody input[type="checkbox"]');
                child.each(function(index, item) {
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });

            var $ = layui.$,
                active = {
                    getCheckData: function() { //获取选中数据
                        var checkStatus = table.checkStatus('idTest'),
                            data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                    },
                    getCheckLength: function() { //获取选中数目
                        var checkStatus = table.checkStatus('idTest'),
                            data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                    },
                    isAll: function() { //验证是否全选
                        var checkStatus = table.checkStatus('idTest');
                        layer.msg(checkStatus.isAll ? '全选' : '未全选')
                    }
                };

            $('.demoTable .layui-btn').on('click', function() {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });
            $("#del").click(function() {
//				test.reload("idTest");
            })
            //indexs调整或关闭iframe窗口的时候需要
            var indexs;
            //新增
            $("#add-btn").click(function() {
                //iframe窗
                layer.open({
                    type: 2,
                    title: '商家信息新增',
                    shadeClose: true,
                    shade: false,
                    fixed: false,
                    resize: false,
                    maxmin: false, //开启最大化最小化按钮
                    area: ['100%', '100%'],
                    content: '../component/form/group.html',
                    success: function(layero, index) {
                        indexs = index;
                        layer.full(index);
                        $(".layui-layer-iframe").css("overflow", "hidden");
                    }
                });
            });
            //修改
            $("#modify").click(function() {
                //iframe窗
                layer.open({
                    type: 2,
                    title: '商家信息修改',
                    shadeClose: true,
                    shade: false,
                    fixed: false,
                    resize: false,
                    maxmin: false, //开启最大化最小化按钮
                    area: ['100%', '100%'],
                    content: '../component/form/edit.html',
                    success: function(layero, index) {
                        indexs = index;
                        layer.full(index);
                        $(".layui-layer-iframe").css("overflow", "hidden");
                    }
                });
            });
            $(window).resize(function() {
                if($(".layui-layer-iframe").hasClass("layui-layer-iframe")) {
                    layer.full(indexs);
                }
            });
        });


    //搜索
    function queryContentCommentAJAX(contId,pageNum) {
        var keyword = $('#keyword').val();
        var revertStatus = $('#revertStatus').val();
        var sensitiveWord = $('#commentType').val();
        $.ajax({
            url:"../contentComment/queryContentAJAX",
            data:{contId:contId,pageNum:pageNum,keyword:keyword,revertStatus:revertStatus,sensitiveWord:sensitiveWord},
            type:"POST",
            dataType : "json",
            success : function(data){
                var commentList = data.data['commentList'];
                var pageInfo = data.data['pageInfo'];
                var template=
                '<tr>'+
                    '<td><input type="checkbox" id="isSelect" lay-skin="primary" class="l_table_checkbox" data-id="commentId"></td>'+
                    '<td>content</td>'+
                    '<td style="text-align: center;">thumbsUp</td>'+
                    '<td style="text-align: center;" id="commentByReply">byReply</td>'+
                    '<td style="text-align: center;">createTime</td>'+
                    '<td style="text-align: center;">memberName</td>'+
                    '<td style="text-align: center;">isForbidden</td>'+
                    '<td>'+
                    '<a class="layui-btn layui-btn-xs redact" lay-event="examine" onclick="queryCommentDetail(\'commentId\')">详情</a>'+
                    '<a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="deleteComment(\'commentId\')">删除</a>'+
                    '</td>'+
                    '</tr>';
                var body = $('#commentTbody').empty();
                for(var i=0;i<commentList.length;i++){
                    var comment = commentList[i];
                    var tr = $(template.replace(/commentId/g,comment.commentId==null?"":""+comment.commentId+"")
                        .replace('content',comment.content==null?"":comment.content)
                        .replace('thumbsUp',comment.thumbsUp==null?"":comment.thumbsUp)
                        .replace('byReply',comment.byReply==null?"":comment.byReply)
                        .replace('createTime',comment.createTime==null?"":comment.createTime)
                        .replace('memberName',comment.memberName==null?"":comment.memberName)
                        .replace('isForbidden',comment.isForbidden==0?"启用":"禁用"));

                }
                body.append(tr);
                if(comment.byReply>0){
                    tr.find('td').eq(3).addClass('commentByReply');
                    tr.find('td').eq(3).attr('onclick',"queryCommentRevert('"+ (comment.commentId==null?"":comment.commentId) +"')");
                }
            layui.use('form', function() {
            var form = layui.form;
            form.render();
        });
        $('#commentCheckbox').attr("checked", false);
        layui.form.render(); //重新渲染显示效果
        getPage(pageInfo.total,pageInfo.pageSize,pageInfo.pageNum,contId.contId);
    }
    });
    };

    //重置
    function resetPostsComment() {
        $('#keyword').val("");
        $('#revertStatus option:first').attr('selected',true).siblings('option').attr('selected',false);
        $('#commentType option:first').attr('selected',true).siblings('option').attr('selected',false);

        queryPostsCommentAJAX(contId,'1');
        layui.form.render(); //重新渲染显示效果
    }

    //批量启用
    function batchEnableComment() {
        //debugger;
        var ids = [];    //定义一个空数组
        var chkBoxes = $('#commentTable').find('input:checked');
        if (chkBoxes.length == 0) {         //如果不勾选弹出警告框
             layer.alert('至少选中一条评论', {icon: 2});
        // alert('至少选中一条评论');
            return false;
        }
        //遍历被选中的checkbox集
        $(chkBoxes).each(function () {
            ids.push( $(this).attr('data-id') );   //找到对应checkbox中data-id属性值，然后push给空数组$ids
        });
        var commentIds = ids.join(',');              //将数组转化为用逗号隔开的字符串
        $.ajax({
            url:"../contentComment/batchEnable",
            data:{commentIds:commentIds},
            type:"POST",
            dataType : "json",
            success : function(data){
                var flag = data.success;
                if(flag){
                    layer.alert(data.msg, {icon: 1});
                    var pageNum = $("#pageInfo2 .layui-box .layui-laypage-skip .layui-input").val();
                    queryContentCommentAJAX(contId,pageNum)
                }else{
                    layer.msg(data.msg, {icon: 5});
                }
            }
        });
    }

    //批量禁用
    function batchDisableComment() {
        var ids = [];    //定义一个空数组
        var chkBoxes = $('#commentTable').find('input:checked');
        if (chkBoxes.length == 0) {         //如果不勾选弹出警告框
            layer.alert('至少选中一条评论');
            return false;
        }
        //遍历被选中的checkbox集
        $(chkBoxes).each(function () {
            ids.push( $(this).attr('data-id') );   //找到对应checkbox中data-id属性值，然后push给空数组$ids
        });
        var commentIds = ids.join(',');              //将数组转化为用逗号隔开的字符串

        $.ajax({
            url:"../contentComment/batchDisable",
            data:{commentIds:commentIds},
            type:"POST",
            dataType : "json",
            success : function(data){
                var flag = data.success;
                if(flag){
                    layer.alert(data.msg, {icon: 1});
                    var pageNum = $("#pageInfo2 .layui-box .layui-laypage-skip .layui-input").val();
                    queryContentCommentAJAX(contId,pageNum)
                }else{
                    layer.msg(data.msg, {icon: 5});
                }
            }
        });
    }
    function getPage(total,pageSize,pageNum,contId){
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage,
                layer = layui.layer;

            //分页
            laypage.render({
                elem: 'pageInfo2',
                count: total,
                limit: pageSize,//每页显示条数
                curr: pageNum,
                layout: ['count', 'prev', 'page', 'next', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        queryContentCommentAJAX(contId,obj.curr);
                    }
                    // console.log(obj.curr)
                }
            });
        });
    }
    //删除
    function deleteComment(commentId){
        layer.confirm('确定删除该评论吗?', function(index) {
            $.ajax({
                url:"../contentComment/delete",
                data:{commentId:commentId},
                type:"POST",
                dataType : "json",
                success : function(data){
                    var flag = data.success;
                    if(flag){
                        layer.alert(data.msg, {icon: 1});
                    debugger;
                        var pageNum = $("#pageInfo2 .layui-box .layui-laypage-skip .layui-input").val();
                        queryContentCommentAJAX(contId,pageNum)
                    }else{
                        layer.msg(data.msg, {icon: 5});
                    }
                }
            });
            layer.close(index);
        });
    }

    function queryCommentDetail(commentId){
        $.post('../contentComment/details', {"commentId":commentId}, function (str) {
            layer.open({
                type: 1,
                title: '资讯评论详情',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: str,
                success: function (layero, index) {

                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "auto");
                    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
                        var table = layui.table,
                            form = layui.form,
                            layedit = layui.layedit,
                            laydate = layui.laydate,
                            laypage = layui.laypage,
                            layer = layui.layer;
                        form.render();
                    })

                },
                end: function () {
                    location.reload();
                }
            });
        })
    }
    //查看回复
    function queryCommentRevert(commentId){
        $.post('../revert/queryComment', {"commentId":commentId}, function (str) {
            layer.open({
                type: 1,
                title: '评论回复',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: str,
                // success: function (layero, index) {
                //
                //     indexs = index;
                //     layer.full(index);
                //     $(".layui-layer-iframe").css("overflow", "auto");
                //     layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
                //         var table = layui.table,
                //             form = layui.form,
                //             layedit = layui.layedit,
                //             laydate = layui.laydate,
                //             laypage = layui.laypage,
                //             layer = layui.layer;
                //         form.render();
                //     })
                //
                // },
                // end: function () {
                //     location.reload();
                // }
            });
        })
    }
</script>

<script>
    $(document).ready(function () {
        $('#keyword').keydown(function (event) {
            var curKey = event.which;
            if (curKey == 13) {
                queryPostsCommentAJAX(contId);
                return false;
            }
        });
    });
</script>
</body>
<style>
    .commentByReply{
        color: #38aaff;
        text-decoration: underline;
        cursor:pointer;
    }
</style>
</html>