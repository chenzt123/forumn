var baseurl = null;
$(document).ready(function() {

    baseurl = "/system/"+baseurl;
  //    底部的高度
    // var allheight=document.body.clientHeight;
    // $('.l_list_list_middle').css('height',allheight-495+'px');
    // $('.l_alert_bottom').css('height',allheight*0.86-90+'px');
    
    // //弹出框
    // $('.l_details').click(function(){
    //   $('.l_desk').css('display','block');
    //   $('.l_alert').css('display','block');
    // })
    // $('.l_alert_top i').click(function(){
    //   $('.l_desk').css('display','none');
    //   $('.l_alert').css('display','none');
    // })
layui.use(['form', 'layedit', 'laydate','laypage', 'layer','form'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  

  //监听提交
//  form.on('submit(demo1)', function(data){
//    layer.alert(JSON.stringify(data.field), {
//      title: '最终的提交信息'
//    })
//    return false;
//  });
//   var laypage = layui.laypage
//  ,layer = layui.layer;
//  
//  var $ = layui.jquery, form = layui.form;
//  
//laypage.render({
//    elem: 'demo2'
//    ,count: 100
//    ,prev: '<em><</em>'
//    ,next: '<em>></em>'
//  });
//laydate.render({
//    elem: '#test1'
//  });

  
  
  //全选
  form.on('checkbox(allChoose)', function(data){
    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
    child.each(function(index, item){
      item.checked = data.elem.checked;
    });
    form.render('checkbox');
  });
});

$('.l_list_list_middle tr:even').css('background','#f9f9f9')
// window.onresize=function(){
//     var allheight=document.body.clientHeight;
//     $('.l_list_list_middle').css('height',allheight-255+'px');
//     $('.l_alert_bottom').css('height',allheight*0.86-90+'px');
// }


//点击展开
$('.l_list_list_form_button').click(function(){
	if($('.l_list_list_form_button em').text()=="点击展开"){
		$('.l_list_form_hidden').css('height','auto');
		$('.l_list_list_form_button em').text('点击收起');
		$('.l_list_list_form_button img').attr('src','../static/image/top.png');
	}else{
		$('.l_list_form_hidden').css('height','45px');
		$('.l_list_list_form_button em').text('点击展开');
		$('.l_list_list_form_button img').attr('src','../static/image/down.png');
	}
	getBodyH();
})
});




