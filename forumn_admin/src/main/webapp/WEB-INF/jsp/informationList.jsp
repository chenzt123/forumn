<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>资讯管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/main.css" media="all">
    <script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../resource/js/ueditor/lang/zh-cn	/zh-cn.js"></script>
    <style>
        .layui-form-select {
            z-index: 9999;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12 m_col-sm-12">
            <div class="ibox float-e-margins m_userinfo">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>资讯信息列表</legend>
                </fieldset>
                <form class="layui-form" action="../informationContent/list" method="post" id="query">
                    <div class="search-three m_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">发布时间:</label>
                            <div class="layui-input-inline" style="width: 350px">
                                <input type="text" name="startTime" id="startTime" value="${startTime}"
                                       placeholder="yyyy-MM-dd HH:mm:ss"
                                       autocomplete="off" class="layui-input">
                                至
                                <input type="text" name="endTime" id="endTime" value="${endTime}"
                                       placeholder="yyyy-MM-dd HH:mm:ss"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="search-three m_three clearfix">
                            <div class="layui-input-inline">
                                <label class="layui-form-label">标题:</label>
                                <div class="layui-input-inline">
                                    <%--<script id="contContent" name="contContent" type="text">${content.contContent}</script>--%>
                                    <input type="text" name="contTitle" id="contTitle" value="${contTitle}" lay-verify="required|title" autocomplete="off" placeholder="请输入关键字" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-input-inline">
                                <label class="layui-form-label">作者/来源:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="source" id="source" value="${source}" lay-verify="required|title" autocomplete="off" placeholder="请输入作者名" class="layui-input">
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <label class="layui-form-label">类别:</label>
                                <div class="layui-input-inline">
                                        <select name="columnId" id="columnId">
                                            <option value="" selected="selected">全部</option>
                                            <c:forEach items="${typeList}" var="informationType" begin="0" step="1" varStatus="star">
                                                <option value="${informationType.columnId}" <c:if test="${columnId == informationType.columnId}">selected="selected"</c:if>>${informationType.columnName}</option>
                                            </c:forEach>
                                        </select>
                                </div>
                                <div class="layui-form-radio">
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn layui-btn-warm" onclick="queryClean()">重置</button>
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn layui-bg-cyan" onclick="queryInfo()">查询</button>
                                    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn layui-bg-blue" onclick="add('${content.cont_id}')">新增</button>
                                </div>
                            </div>
                        </div>
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
                        <table class="layui-table m_table" lay-filter="demo">
                            <colgroup>
                                <col width="40px">
                                <col width="9%">
                                <col width="15%">
                                <col width="15%">
                                <col width="5%">
                                <col width="165px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox" id="allChoose"></th>
                                <th style="text-align: center;">发布时间</th>
                                <th style="text-align: center;">标题</th>
                                <th style="text-align: center;">来源/作者</th>
                                <th style="text-align: center;">被评论数</th>
                                <th style="text-align: center;">类别</th>
                                <th style="text-align: center;">状态</th>
                                <th style="text-align: center;">备注</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="contTbody">
                                <c:if test="${!empty pageInfo.list}">
                                  <c:forEach items="${pageInfo.list}" var="content" begin="0" step="1" varStatus="star">
                                    <tr>
                                        <td><input type="checkbox" name="" lay-skin="primary" class="l_table_checkbox" data-id="${content.cont_id}"></td>
                                        <td>${content.cont_publish_time}</td>
                                        <td>${content.cont_title}</td>
                                        <td>${content.source}</td>
                                        <td style="text-align: center; <c:if test="${content.byReply > -1}"> color:#38aaff</c:if>" onclick="queryContentComment('${content.cont_id}')">${content.byReply}</td>
                                        <td>${content.column_name}</td>
                                        <td style="text-align: center;"><c:if test="${content.cont_publish_status==0}">下架</c:if><c:if test="${content.cont_publish_status==1}">上架</c:if></td>
                                        <td>${content.column_desc}</td>
                                        <td>
                                            <a class="layui-btn layui-btn-xs redact" lay-event="lock" onclick="contentLock('${content.cont_id}','${content.status}')"><c:if test="${content.status == 0}">锁定
                                          </c:if><c:if test="${content.status == -1}">已锁</c:if></a>
                                          <a class="layui-btn layui-btn-xs redact" onclick="up('${content.cont_id}')">上架</a>
                                            <%--<a class="layui-btn layui-btn-xs redact" lay-event="edit" onclick="contentUpAndDown('${content.cont_id}','${content.cont_publish_status}')"><c:if test="${content.cont_publish_status == 0}">下架</c:if></a>--%>
                                                <%--<c:if test="${content.cont_publish_status == 1}">上架</c:if></a>--%>
                                          <a class="layui-btn layui-btn-xs redact" onclick="edit('${content.cont_id}')">编辑</a>
                                            <a class="layui-btn layui-btn-danger layui-btn-xs delete" onclick="del('${content.cont_id}')">删除</a>
                                            <a class="layui-btn layui-btn-xs layui-bg-blue" onclick="down('${content.cont_id}')">下架</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                                <c:if test="${empty pageInfo.list}">
                                    <tr>
                                        <td colspan="9"
                                            style="text-align:center;font:700 14px/25px 'Microsoft Yahei';color:dodgerblue;">
                                            系统没有查找到合适的数据！
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <div id="demo7"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="../resource/layui/layui.js"></script>
<script src="../resource/js/formSubmitWithPost.js"></script>
<script src="../resource/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../resource/js/formCheck.js"></script>
<%--<script src="../resource/style/js/formSubmitWithPost.js"></script>--%>
<script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="../resource/style/js/formCheck.js"></script>--%>
<script>
    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate,
            laypage = layui.laypage,
            layer = layui.layer;


        // //发帖的时间
        // laydate.render({
        //     elem: '#contPublishTime'
        //     , type: 'datetime'
        // });
        //注册时间:
        laydate.render({
            elem: '#startTime'
            , type: 'datetime'
        });

        laydate.render({
            elem: '#endTime'
            , type: 'datetime'
        });
        //常规用法
        laydate.render({
            elem: '#date'
        });
        //分页
        laypage.render({
            elem: 'demo7',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    //queryInformationAJAX(obj.curr);
                            var params = {
                                "pageNum": obj.curr,
                                "contPublishTime": $("input[name=contPublishTime]").val(),
                                "contTitle": $("input[name=contTitle]").val(),
                                "source": $("input[name=source]").val(),
                                "columnId": $("select[name=columnId]").val()
                              //  "columnDesc": $("input[name=columnDesc]").val()
                            };

                            httpPost("../informationContent/list", params);
                            //window.location.href="getMemberList?pageNo="+obj.curr;
                        }
                        // console.log(obj.curr)
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
                getCheckData: function () { //获取选中数据
                    var checkStatus = table.checkStatus('idTest'),
                        data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                },
                getCheckLength: function () { //获取选中数目
                    var checkStatus = table.checkStatus('idTest'),
                        data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                },
                isAll: function () { //验证是否全选
                    var checkStatus = table.checkStatus('idTest');
                    layer.msg(checkStatus.isAll ? '全选' : '未全选')
                }
            };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $("#del").click(function () {
            // test.reload("idTest");
        })
        //indexs调整或关闭iframe窗口的时候需要
        var indexs;
        //新增
        $("#add-btn").click(function () {
            //iframe窗
            layer.open({
                type: 2,
                title: '资讯信息新增',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: '../component/form/group.html',
                success: function (layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "hidden");
                }
            });
        });
        //修改
        $("#modify").click(function () {
            //iframe窗
            layer.open({
                type: 2,
                title: '资讯信息修改',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: '../component/form/edit.html',
                success: function (layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "hidden");
                }
            });
        });
        $(window).resize(function () {
            if ($(".layui-layer-iframe").hasClass("layui-layer-iframe")) {
                layer.full(indexs);
            }
        });
    });

    //回车查询
    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            queryInfo();
        }
    };
    //搜索
    function queryInfo() {
        if (formvalide['forminitInput'].validate("query")) {
            $("#query").submit();
        }
    };
    //搜索
    function queryInformationAJAX(pageNum) {
        var contPublishTime = $('#contPublishTime').val();
        var contTitle = $('#contTitle').val();
        var source = $('#source').val();
        var columnId = $('#columnId').val();
        $.ajax({
            url:"../informationContent/queryInformationAJAX",
            data:{pageNum:pageNum,contPublishTime:contPublishTime,contTitle:contTitle,source:source,columnId:columnId},
            type:"POST",
            dataType : "json",
            success : function(data){
                var list = data.data['list'];
                var pageInfo = data.data['pageInfo'];
                var template=
                    '<tr>'+
                    '<td><input type="checkbox" id="isSelect" lay-skin="primary" class="l_table_checkbox" data-id="contId"></td>'+
                    '<td style="text-align: center;">contPublishTime</td>'+
                    '<td style="text-align: center;">contTitle</td>'+
                    '<td style="text-align: center;">source</td>'+
                    '<td style="text-align: center;" id="contentByReply">byReply</td>'+
                    '<td style="text-align: center;">columnName</td>'+
                    '<td style="text-align: center;">contPublishStatus</td>'+
                    '<td style="text-align: center;">columnDesc</td>'+
                    '<td>'+
                    '<a class="layui-btn layui-btn-xs redact" lay-event="lock" onclick="contentLock(\'contId\',\'status\')">statusName</a>'+
                    '<a class="layui-btn layui-btn-xs redact" lay-event="up" onclick="up(\'contId\')">上架</a>'+
                    '<a class="layui-btn layui-btn-xs redact" lay-event="edit" onclick="edit(\'contId\')">编辑</a>'+
                    '<a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="del(\'contId\')">删除</a>'+
                    '<a class="layui-btn layui-btn-xs redact" lay-event="down" onclick="down(\'contId\')">下架</a>'+
                    '</td>'+
                    '</tr>';
                var body = $('#contTbody').empty();
                for(var i=0;i<list.length;i++){
                    var lists = list[i];
                    var tr = $(template.replace(/contId/g,lists.contId==null?"":lists.contId)
                        .replace('contPublishTime',lists.contPublishTime==null?"":lists.contPublishTime)
                        .replace('contTitle',lists.contTitle==null?"":lists.contTitle)
                        .replace('source',lists.source==null?"":lists.source)
                        .replace('byReply',lists.byReply==null?"":lists.byReply)
                        .replace('columnName',lists.columnName==null?"":lists.columnName)
                        .replace('contPublishStatus',lists.contPublishStatus==null?"":lists.contPublishStatus)
                        .replace('columnDesc',lists.columnDesc==null?"":lists.columnDesc)
                        .replace('status',lists.status==null?"":lists.status)
                        .replace('statusName',lists.status==null || lists.status==0?"锁定":"已锁")
                    );
                    body.append(tr);
                    if(lists.byReply>0){
                        tr.find('td').eq(3).addClass('contentByReply');
                        tr.find('td').eq(3).attr('onclick',"queryContentComment('"+ (lists.contId==null?"":lists.contId) +"')");
                    }
                }
                layui.use('form', function() {
                    var form = layui.form;
                    form.render();
                });
                $('#allChoose').attr("checked", false);
                layui.form.render(); //重新渲染显示效果
                getPage(pageInfo.total,pageInfo.pageSize,pageInfo.pageNum);
            }
        });
    };

    //编辑
    function edit(contId){
        $.post('../informationContent/edit', {"contId":contId}, function (str) {
            layer.open({
                type: 1,
                title: '编辑资讯信息',
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

    //保存
    function add(contId){
        $.post('../informationContent/add', {"contId":contId}, function (str) {
            layer.open({
                type: 1,
                title: '新增资讯信息',
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


    //消息提示
    layui.use(['layer', 'laydate'], function () {
        var message = '${information}';
        if (message != "" && message != null) {
            if ((message.indexOf('失败') > -1) || (message.indexOf('异常') > -1)
                || (message.indexOf('错误') > -1)) {
                layer.msg(message, {icon: 2});
            } else {
                layer.msg(message, {icon: 2});
            }
        }
    });

    //重置,window.location.href的值放接口上的请求路径
    function queryClean() {
        window.location.href = "../informationContent/list";
    }

    //资讯锁定
    function contentLock(contId,status) {
        var url = "../informationContent/lock";
        var param = {contId:contId,status:status==null||status== 0 ? -1: 0};
        httpPost(url,param);
        // $.ajax({
        //     url:"../informationContent/lock",
        //     data:{contId:contId,status:status==null||status== 0 ? -1: 0},
        //     type:"POST",
        //     dataType : "json",
        //     success : function(data){
        //         var flag = data.success;
        //         if(flag){
        //             layer.alert(data.msg, {icon: 1});
        //             var pageNum = $("#pageInfo .layui-box .layui-laypage-skip .layui-input").val();
        //             //queryInformationAJAX(pageNum);
        //         }else{
        //             layer.msg(data.msg, {icon: 5});
        //         }
        //     }
        // });

    }

    function up(contId,contPublishStatus){
        layui.use(['layer', 'laydate'], function () {

            layer.confirm('确定要上架该资讯吗？', {
                btn: ['确认', '取消'] //按钮
                , btn1: function (index, layro) {
                    var params = {
                        contId: contId, contPublishStatus: contPublishStatus == null || contPublishStatus == 0 ? 1 : 0
                    };
                    httpPost("../informationContent/up", params);
                    // $.ajax({
                    //     url:"../informationContent/up",
                    //      data:{contId: contId, contPublishStatus: contPublishStatus == null || contPublishStatus == 0 ? 1 : 0},
                    //     type:"POST",
                    //     dataType : "json",
                    //     success : function(data){
                    //         var flag = data.success;
                    //         if(flag){
                    //             layer.alert(data.msg, {icon: 1});
                    //             debugger;
                    //             var pageNum = $("#pageInfo2 .layui-box .layui-laypage-skip .layui-input").val();
                    //             //queryInformationAJAX(pageNum)
                    //         }else{
                    //             layer.msg(data.msg, {icon: 5});
                    //         }
                    //     }
                    // });
                },
                btn2: function (index, layro) {
                    layer.msg('取消成功', {icon: 1});
                }
                , icon: 7
            });
        })
    }


    function down(contId,contPublishStatus) {
         layui.use(['layer', 'laydate'], function () {
             layer.confirm('确定要下架该资讯吗？', {
                 btn: ['确认', '取消'] //按钮
                 , btn1: function (index, layro) {
                         var params = {
                             contId: contId, contPublishStatus: contPublishStatus == null || contPublishStatus == 0 ? 1 : 0
                         };
                         httpPost("../informationContent/down", params);
                         window.location.href = "sys/sys-resource!delete.do?id=" + ids;
                         // $.ajax({
                         //     url: "../informationContent/down",
                         //     data: {
                         //         contId: contId,
                         //         contPublishStatus: contPublishStatus == null || contPublishStatus == 0 ? 1 : 0
                         //     },
                         //     type: "POST",
                         //     dataType: "json",
                         //     success: function (data) {
                         //         var flag = data.success;
                         //         if (flag) {
                         //             layer.alert(data.msg, {icon: 1});
                         //             debugger;
                         //             var pageNum = $("#pageInfo2 .layui-box .layui-laypage-skip .layui-input").val();
                         //             queryInformationAJAX(pageNum)
                         //         } else {
                         //             layer.msg(data.msg, {icon: 5});
                         //         }
                  //   }
                     // });
                 },

                 btn2: function (index, layro) {
                     layer.msg('取消成功', {icon: 1});
                 }
                 , icon: 7
             });

         });
    }

    //删除
    function del(contId) {
        // layui.use(['layer', 'laydate'], function () {
        //     layer.confirm('删除所选资源，是否继续？', {
        //         btn: ['确认', '取消'] //按钮
        //         , btn1: function (index, layro) {
        //             var params = {
        //                 "contId": contId
        //             };
        //             httpPost("../informationContent/del", params);
        //             //window.location.href="sys/sys-resource!delete.do?id="+ids;
        //         },
        //         btn2: function (index, layro) {
        //             layer.msg('取消成功', {icon: 1});
        //         }
        //         , icon: 7
        //     });
        // })
        layer.confirm('确定删除该行吗？', function(index) {
            layer.close(index);
            $.ajax({
                type:"POST",
                url:"../informationContent/del",
                data: {"contId":contId},
                dataType:"json",
                success:function(data){
                    if ((data.msg.indexOf('失败') > -1) || (data.msg.indexOf('异常')>-1)
                        || (data.msg.indexOf('错误')>-1)){
                        layer.msg(data.msg, {icon: 2});
                    }else{
                        layer.msg(data.msg, {icon: 1});
                        layer.msg("删除成功",{icon: 1});
                        window.location.reload();
                    }
                }
            });
        });

    }


    function queryContentComment(contId){
        $.post('../contentComment/findCommentList', {"contId":contId}, function (str) {
            layer.open({
                type: 1,
                title: '资讯评论',
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

    function getPage(total,pageSize,pageNum){
        layui.use(['laypage', 'layer'], function() {
            var laypage = layui.laypage,
                layer = layui.layer;

            //分页
            laypage.render({
                elem: 'pageInfo',
                count: total,
                limit: pageSize,//每页显示条数
                curr: pageNum,
                layout: ['count', 'prev', 'page', 'next', 'skip'],
                jump: function (obj, first) {
                    if (!first) {
                        queryInformationAJAX(obj.curr);
                    }
                    // console.log(obj.curr)
                }
            });
        });
    }

    // 时间
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test10'
            , type: 'datetime'
            , range: true
        });
    });

</script>

<script>
    $(document).ready(function () {
        $('#title').keydown(function (event) {
            var curKey = event.which;
            if (curKey == 13) {
                queryInformationAJAX();
                return false;
            }
        });
    });
</script>
<style>
    .contentByReply{
        color: #38aaff;
        text-decoration:underline;
        cursor:pointer;
    }
</style>
</body>

</html>