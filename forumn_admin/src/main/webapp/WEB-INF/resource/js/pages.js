$(document).ready(function() {
// $(function() {
	$(".bai").niceScroll({"cursorcolor":"#929292","cursoropacitymin":"0.5",cursorborder: "1px solid #929292",railpadding:{ top: 0, right:0, left: 0, bottom: 0 },"cursorwidth":"3"});  //右侧滚动条美化
	//蒙版
	$(function(){
		$('.l_select_top_right_remove').click(function() {
			//upDate();
			$('.m_bai_title .m_title').html('修改')
		});
		$('.l_select_top_right_add').click(function() {
			//upDate();
			$('.m_bai_title .m_title').html('增加')
    	});
    	$('.m_icon').click(function() {
    		//$('.meng', parent.document).css('display', 'none');
			$('.m_zeng').css('display', 'none');
			$('.m_qiang').css('display', 'none');
			$('.zhe').css('display', 'none');
			$('.eee').css('display', 'none');
    	});
	});
});
function upDate(){
	//$('.meng', parent.document).css('display', 'block');
	$('.eee').css('display', 'block');
	$('.zhe').css('display', 'block');
	$('.m_zeng').css('display', 'block');
}
function trClick(){
	//$('.meng', parent.document).css('display', 'block');
	$('.eee').css('display', 'block');
	$('.zhe').css('display', 'block');
	$('.m_zeng').css('display', 'none');
	$('.m_qiang').css('display', 'block');
	$('.m_bai_title .m_title').html('详情');
}
function getBodyH(){
	var heightBody = $(".l_block").height();
	if (window.navigator.userAgent.indexOf("MSIE")>=1) {
		heightBody = document.body.clientHeight;
	}
    parent.getIfrH(heightBody);
}

window.onload = function(){
	getBodyH();
};
window.onresize = function(){
    getBodyH();
};


