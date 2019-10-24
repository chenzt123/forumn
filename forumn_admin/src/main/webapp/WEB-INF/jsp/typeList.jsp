<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>资讯类型</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../resource/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/admin.css" media="all">
    <link rel="stylesheet" href="../resource/style/css/main.css" media="all">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12 m_col-sm-12">
            <div class="ibox float-e-margins m_userinfo">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>资讯类型列表</legend>
                </fieldset>
                <form class="layui-form" action="queryInformationTypeList" id="query" method="post">
                    <div class="search-three m_three clearfix">
                        <div class="layui-form-item">
                            <label class="layui-form-label">类型名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="columnName" autocomplete="off" placeholder="请输入类型名称" value="${param.columnName}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">拼音码：</label>
                            <div class="layui-input-block">
                                <input type="text" name="columnCode" autocomplete="off" placeholder="请输入拼音码" value="${param.columnCode}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">等级：</label>
                            <div class="layui-input-block">
                                <input type="text" name="columnLevel" autocomplete="off" placeholder="请输入等级" value="${param.columnLevel}" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button type="button" class="layui-btn" onclick="queryInfo()">查询</button>
                        <button type="button" class="layui-btn layui-btn-normal" onclick="edit('${informationType.columnId}')">新增</button>
                        <%--<button type="button" class="layui-btn layui-btn-warm" id="modify">修改</button>--%>
                        <button type="button" class="layui-btn layui-btn-danger" id="batchDel">删除</button>
                        <button type="button" class="layui-btn layui-btn-warm" onclick="queryClean()">重置</button>
                        <%--<button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button>--%>
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
                        <table class="layui-table m_table"  lay-filter="demo">
                            <colgroup>
                                <col width="4%">
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <col>
                                <%--<col>--%>
                                <col>

                            </colgroup>
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" class="l_table_checkbox" id="allChoose"></th>
                                <th style="text-align: center;">序号</th>
                                <th style="text-align: center;width: 150px;">类型名称</th>
                                <%--<th style="text-align: center">父类型名称</th>--%>
                                <th style="text-align: center">拼音码</th>
                                <%--<th>缩略图片</th>--%>
                                <th style="text-align: center">备注</th>
                                <th style="text-align: center">允许添加多条</th>
                                <th style="text-align: center">等级</th>
                                <th style="text-align: center;width: 160px;">创建时间</th>
                                <th style="text-align: center">排序</th>
                                <th style="text-align: center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty pageInfo.list}">
                                <c:forEach items="${pageInfo.list}" var="informationType" begin="0" step="1" varStatus="status">
                                    <tr>
                                        <td><input type="checkbox" name="noiddel" lay-skin="primary" class="l_table_checkbox" value="${informationType.columnId}"></td>
                                        <td style="text-align: center">${status.index+1}</td>
                                        <td style="text-align: center">${informationType.columnName}</td>
                                     <%--   <td style="text-align: center">${informationType.parColumnName}</td>--%>
                                        <td style="text-align: center">${informationType.columnCode}</td>
                                        <td style="text-align: center">${informationType.columnDesc}</td>
                                        <td style="text-align: center">
                                            <c:if test="${informationType.ismany == 1}">是</c:if>
                                            <c:if test="${informationType.ismany == 0}">否</c:if>
                                        </td>
                                        <td style="text-align: center">${informationType.columnLevel}</td>
                                        <td style="text-align: center">${informationType.createTime}</td>
                                        <td style="text-align: center">${informationType.columnSeq}</td>
                                        <td style="text-align: center">
                                                <%--<a href="javascript:;" class="layui-btn layui-btn-primary layui-btn-xs examine">查看</a>--%>
                                            <a class="layui-btn layui-btn-xs redact" onclick="edit('${informationType.columnId}')">编辑</a>
                                            <a class="layui-btn layui-btn-danger layui-btn-xs delete" lay-event="del" onclick="del('${informationType.columnId}')">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty pageInfo.list}">
                                <tr>
                                    <td colspan="9"
                                        style="text-align:center;font:700 14px/25px 'Microsoft Yahei';color:red;">
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
<script>
    //重置
    function queryClean() {
        window.location.href = "queryInformationTypeList";
    }
    $(function(){
        $('#batchDel').click(function () {
            var ids = new Array();
            $("input:checkbox[name='noiddel']:checked").each(function () {
                ids.push($(this).val());
            });

            if (ids.length == 0) {
                layer.open({
                    title: '提示',
                    content: '请选择删除信息'
                });
                return false;
            }
            layer.confirm('确定要删除选中行吗？', {
                time: 20000, //20s后自动关闭
                btn: ['确定', '取消'],
                yes: function (index) {
                    layer.close(index);
                    $.ajax({
                        type: 'GET',
                        url: 'delByIds',
                        data: {ids: ids.join(','),aaa:"asdfas"},
                        dataType: 'json',
                        success: function (data) {
                            layer.msg(data.msg, {
                                icon: 1, time: 500, end: function () {
                                    window.location.reload();
                                }
                            });
                        }
                    });
                }
            });

        });

    })


    function edit(id){
        $.post('typeAddOrEdit', {"id":id}, function (str) {
            layer.open({
                type: 1,
                title: '编辑信息',
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

    function del(id){
        layer.confirm('确定删除该行吗？', function(index) {
            layer.close(index);
            $.post('delById', {"id":id}, function (data) {
                layer.msg(data.msg, {
                    icon: 1, time: 500, end: function () {
                        window.location.reload();
                    }
                });
            })
        });

    }

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
            elem: 'demo7',
            count: ${pageInfo.total},
            limit:${pageInfo.pageSize},//每页显示条数
            curr:${pageInfo.pageNum},
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    var params = {
                        "pageNum": obj.curr,
                        "pageSize":obj.limit,
                        "columnName": $.trim($("input[name=columnName]").val()),
                        "columnCode": $.trim($("input[name=columnCode]").val()),
                        "columnLevel": $.trim($("input[name=columnLevel]").val())
                    };
                    httpPost("queryInformationTypeList", params);
                    // window.location.href="getMemberList?pageNo="+obj.curr;
                }
                // console.log(obj.curr)
            }
        });
        // 自定义验证规则
        // form.verify({
        //     title: function(value) {
        //         // if(value.length < 5) {
        //         //     return '标题至少得5个字符啊';
        //         // }
        //         /*if ($.trim($("#username").val()) == '') {
        //             alert('用户名不能为空');
        //             return;
        //         }*/
        //     },
        //     // pass: [/(.+){6,12}$/, '密码必须6到12位'],
        //     // content: function(value) {
        //     //     layedit.sync(editIndex);
        //     // }
        //
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
        // $("#del").click(function() {
//				test.reload("idTest");
        // })
        //indexs调整或关闭iframe窗口的时候需要
        var indexs;
        //新增
        /*$("#add-btn").click(function() {
            //iframe窗
            layer.open({
                type: 2,
                title: '添加资讯类型',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: 'typeAddOrEdit',
                data:'a',
                success: function(layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "hidden");
                }
            });
        });*/
        //修改
        /*$("#modify").click(function() {
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
                content: 'typeAddOrEdit',
                success: function(layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "hidden");
                }
            });
        });*/
        $(window).resize(function() {
            if($(".layui-layer-iframe").hasClass("layui-layer-iframe")) {
                layer.full(indexs);
            }
        });
    });
</script>
<script>
    //回车查询
    document.onkeydown = function (e) { // 回车提交表单
        var theEvent = window.event || e;
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
        if (code == 13) {
            queryInfo();
        }
    };
    //查询按钮操作
    function queryInfo() {
        if(formvalide['forminitInput'].validate("query")) {
            $("#query").submit();
        }
    };

    /*$(document).ready(function() {
        // 查看
        $('.m_table .examine').click(function() {
            layer.open({
                type: 2,
                title: '查看信息详情',
                shadeClose: true,
                shade: false,
                fixed: false,
                resize: false,
                maxmin: false, //开启最大化最小化按钮
                area: ['100%', '100%'],
                content: '../component/form/detail.html',
                success: function(layero, index) {
                    indexs = index;
                    layer.full(index);
                    $(".layui-layer-iframe").css("overflow", "hidden");
                }
            });
        })*/

    // 编辑
    /*$('.m_table .redact').click(function() {
        layer.open({
            type: 2,
            title: '商家信息新增',
            shadeClose: true,
            shade: false,
            fixed: false,
            resize: false,
            maxmin: false, //开启最大化最小化按钮
            area: ['100%', '100%'],
            content: 'typeAddOrEdit',
            success: function(layero, index) {
                indexs = index;
                layer.full(index);
                $(".layui-layer-iframe").css("overflow", "hidden");
            }
        });
    })*/
</script>
</body>

</html>