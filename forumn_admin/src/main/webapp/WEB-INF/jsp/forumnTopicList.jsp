<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>论坛帖子</title>
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
                    <legend>论坛帖子列表</legend>
                </fieldset>
                <form class="layui-form" action="../informationContent/list" method="post" id="query">
                        <div class="search-three m_three clearfix">
                            <div class="layui-input-inline">
                                <label class="layui-form-label">关联期号:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="drawId" id="contTitle" value="${drawId}" lay-verify="required|title" autocomplete="off" placeholder="请输入关联期号" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">状态:</label>
                                <div class="layui-input-inline">
                                    <select id="isBlackList" name="topicStatus" lay-verify="required">

                                        <option value="-1"
                                                <c:if test="${topicStatus == -1}">selected="selected"</c:if>>全部
                                        </option>

                                        <option value="0" <c:if test="${topicStatus == 0}">selected="selected"</c:if>>草稿
                                        </option>

                                        <option value="1" <c:if test="${topicStatus == 1}">selected="selected"</c:if>>审核通过
                                        </option>

                                        <option value="2" <c:if test="${topicStatus == 2}">selected="selected"</c:if>>审核不通过
                                        </option>
                                    </select>
                                </div>
                        </div>

                        <div class="layui-inline">
                                <label class="layui-form-label"></label>
                                <div class="layui-input-inline">
                                    <button type="button" class="layui-btn layui-btn-warm" onclick="queryClean()">重置
                                    </button>
                                    <button type="button" class="layui-btn" onclick="queryList()">查询</button>
                                </div>
                        </div>
                        </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button type="button" class="layui-btn" style="float:right;margin-right: 20px;"
                                onclick="saveMemberInfo()">新增论坛帖子
                        </button>
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
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox" id="allChoose">
                                </th>
                                <th style="text-align: center;">序列</th>
                                <th style="text-align: center;">论坛主题标题</th>
                                <th style="text-align: center;">关联期号</th>
                                <th style="text-align: center;">状态</th>
                                <th style="text-align: center;">创建时间</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="contTbody">
                                <c:if test="${!empty pageInfo.list}">
                                  <c:forEach items="${pageInfo.list}" var="content" begin="0" step="1" varStatus="i">
                                    <tr>
                                        <td><input type="checkbox" name="" lay-skin="primary" class="l_table_checkbox">
                                        </td>
                                        <td>${i.index+1}</td>

                                        <td>${content.topicTitle}</td>
                                        <td>${content.drawId}</td>
                                        <td><c:if test="${content.topicStatus==0}">草稿</c:if><c:if test="${content.topicStatus==1}">审核通过</c:if><c:if test="${content.topicStatus==2}">审核未通过</c:if></td>
                                        <td>${content.createTime}</td>
                                        <td>
                                            <a class="layui-btn layui-btn-xs redact" onclick="edit('${content.topicId}')">编辑</a>

                                            <%--<button type="button"
                                                    class="layui-btn layui-btn-danger layui-btn-xs delete"
                                                    onclick="deleteMemberInfo('${content.topicId}')">删除
                                            </button>
                                            <button type="button"
                                                    class="layui-btn layui-btn-xs layui-btn-normal cipher"
                                                    onclick="changePwd('${content.topicId}')">审核通过
                                            </button>
                                            <button type="button"
                                                    class="layui-btn layui-btn-xs layui-btn-danger blacklist"
                                                    onclick="updateIsBlackList('${content.topicId}')">审核不通过
                                            </button>--%>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                                <c:if test="${empty pageInfo.list}">
                                    <tr>
                                        <td colspan="9"
                                            style="text-align:center;font:700 14px/25px 'Microsoft Yahei';color:dodgerblue;">
                                            系统没有查找到数据！
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
<script src="../resource/style/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function() {
        var table = layui.table,
            form = layui.form,
            layedit = layui.layedit,
            laydate = layui.laydate,
            laypage = layui.laypage,
            layer = layui.layer;
        //分页
        laypage.render({
            elem: 'demo7',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                            var params = {
                                "pageNum": obj.curr,
                            };

                            httpPost("../forumntopic/allforumntopic", params);
                        }
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

    });

    //新建论坛帖子
    function saveMemberInfo() {
        $.post('../forumntopic/skipAdd', function (str) {
            layer.open({
                type: 1,
                title: '新建论坛帖子',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false,
                area: ['100%', '100%'],
                content: str,
                success: function (layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "auto");
                    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function () {
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
    };

    //编辑论坛帖子
    function edit(topicId) {
        $.post('../forumntopic/skipEdit', {"topicId": topicId}, function (str) {
            layer.open({
                type: 1,
                title: '编辑论坛帖子',
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
                    layui.use(['form', 'layedit', 'laydate', 'table', 'laypage', 'layer'], function () {
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
    };
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