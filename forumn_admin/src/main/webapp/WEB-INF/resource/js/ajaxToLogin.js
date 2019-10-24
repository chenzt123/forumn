$.ajaxSetup({
    type: 'POST',
    complete: function(xhr,status) {
        // debugger;
        var sessionStatus = xhr.getResponseHeader('sessionstatus');
        if(sessionStatus == 'timeout') {
            var top = getTopWinow();
            // layer.alert('由于您长时间没有操作, session已过期, 请重新登录', {icon: 2},function () {
            //     top.location.href = top.location.href;
            // });

            // alert('由于您长时间没有操作, session已过期, 请重新登录');
            top.location.href = top.location.href;
        }
    }
});

function getTopWinow(){
    var p = window;
    while(p != p.parent){
        p = p.parent;
    }
    return p;
}