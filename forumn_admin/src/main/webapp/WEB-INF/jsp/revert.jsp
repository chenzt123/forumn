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
    <title>回复</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/main.css" media="all">
    <script src="../resource/style/js/formCheck.js"></script>
    <script src="../resource/style/js/formSubmitWithPost.js"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12 m_col-sm-12">
            <div class="ibox float-e-margins m_userinfo">
                <form class="layui-form" id="query">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">回复内容:</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="commentContent"  autocomplete="off"
                                       class="layui-input" placeholder="请输入关键字" id="revertKeyword">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">回复类型:</label>
                            <div class="layui-input-inline">
                                <select name="revertType" id="revertType">
                                    <option value="" selected="selected">全部</option>
                                    <c:forEach items="${sensitiveContList}" var="item">
                                        <option <c:if test="${sensitiveContId == item.sensitiveContId}">selected="selected"</c:if>>${item.sensitiveCont}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="button" class="layui-btn" id="search" lay-filter="demo1" style="margin-left: 40px;" onclick="queryCommentRevertAJAX('${commentId}')">搜索</button>
                            <button type="button" class="layui-btn layui-btn-warm" id="search1" lay-filter="demo1" style="margin-left: 20px;" onclick="resetCommentRevert()">重置</button>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button type="button" class="layui-btn layui-btn-danger" id="del" style="float:right;margin-right: 20px;" onclick="batchDeleteRevert()">批量删除</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="layui-fluid">
    <div class="layui-form">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <table class="layui-table m_table" lay-filter="demo1" id="revertTable">
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
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox" id="revertCheckbox">全选</th>
                                <th style="text-align: center;">回复内容</th>
                                <th style="text-align: center;">回复时间</th>
                                <th style="text-align: center;">回复者</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="revertTbody">
                            <c:forEach items="${revertList}" var="item" >
                                <tr>
                                    <td><input type="checkbox" id="isSelect" lay-skin="primary" class="l_table_checkbox" data-id="${item.revertId}"></td>
                                    <td>${item.content}</td>
                                    <td style="text-align: center;">${item.createdTime}</td>
                                    <td style="text-align: center;">${item.memberName}</td>
                                    <td>
                                        <a class="layui-btn layui-btn-xs redact" lay-event="examine" onclick="queryRevertDetails('${item.revertId}')">详情</a>
                                        <a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="deleteRevert('${item.revertId}')">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="pageInfo3"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.form.render(); //重新渲染显示效果
    var commentId = '${commentId}';
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
            elem: 'pageInfo3',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    queryCommentRevertAJAX('${commentId}',obj.curr);
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
    function queryCommentRevertAJAX(commentId,pageNum) {
        var revertKeyword = $('#revertKeyword').val();
        var sensitiveWord = $('#revertType').val();
        $.ajax({
            url:"../revert/queryCommentAJAX",
            data:{commentId:commentId,pageNum:pageNum,keyword:revertKeyword,sensitiveWord:sensitiveWord},
            type:"POST",
            dataType : "json",
            success : function(data){
                var revertList = data.data['revertList'];
                var pageInfo = data.data['pageInfo'];
                var template=
                    '<tr>'+
                        '<td><input type="checkbox" id="isSelect" lay-skin="primary" class="l_table_checkbox" data-id="revertId"></td>'+
                        '<td>content</td>'+
                        '<td>createdTime</td>'+
                        '<td>memberName</td>'+
                        '<td>'+
                            '<a class="layui-btn layui-btn-xs redact" lay-event="examine" onclick="queryRevertDetails(\'revertId\')">详情</a>'+
                            '<a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="deleteRevert(\'revertId\')">删除</a>'+
                        '</td>'+
                    '</tr>';
                var body = $('#revertTbody').empty();
                for(var i=0;i<revertList.length;i++){
                    var revert = revertList[i];
                    var tr = $(template.replace(/revertId/g,revert.revertId==null?"":revert.revertId)
                        .replace('content',revert.content==null?"":revert.content)
                        .replace('createdTime',revert.createdTime==null?"":revert.createdTime)
                        .replace('memberName',revert.memberName==null?"":revert.memberName));
                    body.append(tr);
                }
                layui.use('form', function() {
                    var form = layui.form;
                    form.render();
                });
                $('#revertCheckbox').attr("checked", false); //注意这里使用的是attr()
                layui.form.render(); //重新渲染显示效果
                getPage(pageInfo.total,pageInfo.pageSize,pageInfo.pageNum,commentId);
            }
        });
    };

    //重置
    function resetCommentRevert() {
        $('#revertKeyword').val("");
        $('#revertType option:first').attr('selected',true).siblings('option').attr('selected',false);

        queryCommentRevertAJAX(commentId,'1');
        layui.form.render(); //重新渲染显示效果
    }

    function getPage(total,pageSize,pageNum,commentId){
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage,
                layer = layui.layer;

            //分页
            laypage.render({
                elem: 'pageInfo3',
                count: total,
                limit: pageSize,//每页显示条数
                curr: pageNum,
                layout: ['count', 'prev', 'page', 'next', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        queryCommentRevertAJAX(commentId,obj.curr);
                    }
                }
            });
        });
    }
    //删除
    function deleteRevert(revertId){
        layer.confirm('真的删除行么', function(index) {
            $.ajax({
                url:"../revert/delete",
                data:{revertId:revertId},
                type:"POST",
                dataType : "json",
                success : function(data){
                    var flag = data.success;
                    if(flag){
                        layer.alert(data.msg, {icon: 1});
                        var pageNum = $("#pageInfo3 .layui-box .layui-laypage-skip .layui-input").val();
                        queryCommentRevertAJAX(commentId,pageNum)
                    }else{
                        layer.msg(data.msg, {icon: 5});
                    }
                }
            });
            layer.close(index);
        });
    }
    //回复详情
    function queryRevertDetails(revertId){
        $.post('../revert/details', {commentId:commentId,revertId:revertId}, function (str) {
            layer.open({
                type: 1,
                title: '评论',
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
    //批量删除
    function batchDeleteRevert() {
        var ids = [];    //定义一个空数组
        var chkBoxes = $('#revertTable').find('input:checked');
        if (chkBoxes.length == 0) {         //如果不勾选弹出警告框
            layer.alert("至少选中一条回复", {icon: 2});
            return false;
        }
        //遍历被选中的checkbox集
        $(chkBoxes).each(function () {
            ids.push( $(this).attr('data-id') );   //找到对应checkbox中data-id属性值，然后push给空数组$ids
        });
        var revertIds = ids.join(',');              //将数组转化为用逗号隔开的字符串

        $.ajax({
            url:"../revert/batchDelete",
            data:{revertIds:revertIds},
            type:"POST",
            dataType : "json",
            success : function(data){
                var flag = data.success;
                if(flag){
                    layer.alert(data.msg, {icon: 1});
                    var pageNum = $("#pageInfo3 .layui-box .layui-laypage-skip .layui-input").val();
                    queryCommentRevertAJAX(commentId,pageNum)
                }else{
                    layer.msg(data.msg, {icon: 5});
                }
            }
        });
    }

    // //查询按钮操作
    // function queryInfo() {
    //     if(formvalide['forminitInput'].validate("query")) {
    //         $("#query").submit();
    //     }
    // };
</script>
<script>
    $(document).ready(function () {
        $('#revertKeyword').keydown(function (event) {
            var curKey = event.which;
            if (curKey == 13) {
                queryCommentRevertAJAX(commentId);
                return false;
            }
        });
    });
</script>
</body>

</html>