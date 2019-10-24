//验证调用方法 
var formvalide={
	init:{
		//初始化方法
		validate:function(formid){
			forminit(formid);
		}
	},
	form:{
		//表单校验
		validate:function(formid){
			return checkform(formid);
		}
	},
    forminitInput:{
        validate:function(formid) {
            return checkformpInput(formid);
        }

	},
	input:{//文本框验证
		validate:function(obj,trf){
			return checkinput(obj,trf);
		}
	},
	check:{//多选验证
		validate:function(checkname){
			return checkcheckbox(checkname);
		}
	},
	select:{//下拉验证
		validate:function(obj){
			return checkselect(obj);
		}
	},
	textarea:{//文本域
		validate:function(obj){
			return checktextarea(obj);
		}
	},
	showMsg:{//单纯显示提示信息
		validate:function(flag,obj,msg){
			blockMsg(flag,obj,msg);
		}
	}
}
//身份证提示消息集合
var idCardTypeMsg=[];
//验证提示信息
var validateType={
		empty:"不能为空",
		number:"只能为数字",
		English:"只能为英文",
		Englishandcomma:"只能为英文加'.'",
		Englishandnumber:"只能为英文或数字",
		EnChNumber:"只能为英文或中文或数字",
		Chinese:"只能为中文",
		ChsTab:"只能为汉字或空格",
		ChaKuoHao:"只能是汉字和括号",
		ChsElg:"只能为中文或英文",
		intOrFloat:"只能为整数或小数",
		unnormal:"不能包含其他非法字符",
		currency:"只能为货币格式",
		trim:"只能为字母或数字或下划线",
		isEmail:"要符合正确邮箱格式",
		mobile:"只能为正确的手机号码",
		phone:"只能为正确的电话号码(如：0931-1234567)",
		ip:"只能为正确的IP地址",
		url:"只能为正确的URL地址",
		brithday:"正确格式为YYYY-MM-DD(1900年-2099年)",
		idCard:"只能为正确的15位或18位身份证号码",
		checkbox:"请选择其中一个",
		select:"所选选项值为空",
		mil:"至少为",
		mal:"最多为",
		pattern:"不能包含特殊字符(\\#$^&*<>?{}[]\")",
		datePwd:"不能包含特殊字符(<>&)",
		notSpecial:"不能包含特殊字符(<>)",
		NoChinese:"不能包含中文",
		checkMoney:"金额必须为整数或小数(保留2位),可以为负",
		checkMoneys:"金额必须为整数或小数(保留2位)",
		tszf:"不能包含特殊字符(\\#$^&*<>{}[]~`@%【】￥？-+={})"
}
//验证集合
var validateArray = {
	empty:{//不能为空
		validate:function(data){
			return !/^\s*$/.test(data.value);
		}
	},
	number:{//验证数字
		validate:function(data){
			return /^\d+$/.test(data.value);
		}
	},
	English : {// 验证英语
    	validate:function(data){
			return /^[A-Za-z]+$/.test(data.value);
		}
    },
	Englishandcomma:{//英文和逗号
		validate:function(data){
			return /^([A-Za-z]+.*)+$/.test(data.value);
		}
	},
	ChaKuoHao:{//中文和中英文括号
		validate:function(data){
			return /^[\u4E00-\u9FA5\(\（\）\)]+$/.test(data.value);
		}
	},
	Englishandnumber:{//英文和数字
		validate:function(data){
			return /^[A-Za-z0-9]+$/.test(data.value);
		}
	},
	EnChNumber:{//英文或中文或数字
		validate:function(data){
			return /^[\u4E00-\u9FA5A-Za-z0-9]+$/.test(data.value);
		}
	},
	Chinese: {//中文
		validate:function(data){
			return /^[\u4E00-\u9FA5]+$/.test(data.value);
		}
    },
    ChsTab: {//汉字或空格
    	validate:function(data){
			return /^[[\u4E00-\u9FA5]+\s*]+$/.test(data.value);
		}
    },
    ChsElg: {//中文和英文
		validate:function(data){
			return /^[\u4E00-\u9FA5A-Za-z]+$/.test(data.value);
		}
    },
    intOrFloat : {// 验证整数或小数
    	validate:function(data){
			return /^\d+(\.\d+)?$/.test(data.value);
		}
    },
    unnormal : {// 验证是否包含空格和非法字符
    	validate:function(data){
			return !/[@#\$%\^&\*]+/g.test(data.value);
		}
    },
    currency : {// 验证货币
    	validate:function(data){
			return /^\d+(\.\d+)?$/.test(data.value);
		}
    },
    trim: {//字母和数字和下划线
    	validate:function(data){
			return /^([0-9A-Za-z]+_?)+$/.test(data.value);
		}
    }, 
    isEmail: {//邮箱验证
    	validate:function(data){
			return /^[a-z0-9]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/.test(data.value);
		}
    },
    mobile: {//手机号
    	validate:function(data){
			return /^([1][3578][0-9]{9})$/.test(data.value);
		}
    },
    phone: {//电话号码（座机号）
    	validate:function(data){
			return /^0[0-9]{2,3}-[0-9]{7,8}|[0-9]{7,8}$/.test(data.value);
		}
    },
    ip:{//ip地址
    	validate:function(data){
			return /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(data.value);
		}
    },
    url: {//url
    	validate:function(data){
    		if(data.value.length > 0){
    			return /^(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&amp;%@!\-\/]))?$/.test(data.value);
    		}else{
    			return true;
    		}
    			
		}
    },
    brithday:{//出生日期
		validate:function(data){
			return /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/.test(data.value);
		}
	},
	idCard:{//身份证号
		validate:function(data){
//			if(data.value.length==15){
//				$("#"+data.id).val(idCardtools.id15to18(data));
//			}
			return idCardtools.check_sfz(data);
		}
	},
	pattern:{//特殊字符
		validate:function(data){
			return !/[#\$\^\&\*<>\?\{\}\\\[\]\"]/.test(data.value);
		}
	},
	tszf:{//数据库名称特殊字符
		validate:function(data){
			return !/[#\$\^\&\*<>\{\}\\\[\]\~\`\!\@\%\_\-\+\=\{\}\|\￥\……\（\）\——\【\】\？]/.test(data.value);
		}
	},
	datePwd:{//密码防脚本注入
		validate:function(data){
			return !/[\&<>]/.test(data.value);
		}
	},
	notSpecial:{//密码防脚本注入
		validate:function(data){
			return !/[\<>]/.test(data.value);
		}
	},
	checkMoney : {
		validate:function(data){
			return /^-?\d+(\.\d{1,2})?$/.test(data.value);
		}
	},
	checkMoneys : {
		validate:function(data){
			return /^\d+(\.\d{1,2})?$/.test(data.value);
			
		}
	},
	NoChinese:{
		validate:function(data){
		 return /^[^\u4e00-\u9fa5]{0,}$/.test(data.value);
		}
	}
}
//表单初始化方法
function forminit(formid){
	var texts = $("#"+formid).find("input");
	var selects = $("#"+formid).find("select");
	var textareas = $("#"+formid).find("textarea");
	//初始化文本框
	for(var i=0; i<texts.length; i++){
		var onblurfun=$("#"+texts[i].id).attr("onblur");
		if(onblurfun=="" || onblurfun==null || onblurfun==undefined)
		{
			$("#"+texts[i].id).attr("onblur","formvalide['input'].validate(this)");
		}
		else
		{
			$("#"+texts[i].id).attr("onblur","if(formvalide['input'].validate(this)){"+onblurfun+";}")
		}
		var onkeyupfun=$("#"+texts[i].id).attr("onkeyup");
		if(onkeyupfun=="" || onkeyupfun==null || onkeyupfun==undefined)
		{
			$("#"+texts[i].id).attr("onkeyup","formvalide['input'].validate(this)");
		}
		else
		{
			$("#"+texts[i].id).attr("onkeyup","if(formvalide['input'].validate(this)){"+onkeyupfun+";}")
		}
	}
	//验证下拉框
	for(var i=0; i<selects.length; i++){
		$("#"+texts[i].id).attr("onchange","formvalide['select'].validate(this)");
	}
	for(var i=0; i<textareas.length; i++){
		var onblurfun=$("#"+textareas[i].id).attr("onblur");
		if(onblurfun=="" || onblurfun==null || onblurfun==undefined)
		{
			$("#"+textareas[i].id).attr("onblur","formvalide['textarea'].validate(this)");
		}
		else
		{
			$("#"+textareas[i].id).attr("onblur","if(formvalide['textarea'].validate(this)){"+onblurfun+";}")
		}
		var onkeyupfun=$("#"+textareas[i].id).attr("onkeyup");
		if(onkeyupfun=="" || onkeyupfun==null || onkeyupfun==undefined)
		{
			$("#"+textareas[i].id).attr("onkeyup","formvalide['textarea'].validate(this)");
		}
		else
		{
			$("#"+textareas[i].id).attr("onkeyup","if(formvalide['textarea'].validate(this)){"+onkeyupfun+";}")
		}
	}
}


//表单初始化input方法
function forminitInput(formid){
    var texts = $("#"+formid).find("input");
    // var selects = $("#"+formid).find("select");
    // var textareas = $("#"+formid).find("textarea");
    //初始化文本框
    for(var i=0; i<texts.length; i++){
        var onblurfun=$("#"+texts[i].id).attr("onblur");
        if(onblurfun=="" || onblurfun==null || onblurfun==undefined)
        {
            $("#"+texts[i].id).attr("onblur","formvalide['input'].validate(this)");
        }
        else
        {
            $("#"+texts[i].id).attr("onblur","if(formvalide['input'].validate(this)){"+onblurfun+";}")
        }
        var onkeyupfun=$("#"+texts[i].id).attr("onkeyup");
        if(onkeyupfun=="" || onkeyupfun==null || onkeyupfun==undefined)
        {
            $("#"+texts[i].id).attr("onkeyup","formvalide['input'].validate(this)");
        }
        else
        {
            $("#"+texts[i].id).attr("onkeyup","if(formvalide['input'].validate(this)){"+onkeyupfun+";}")
        }
    }
}
//form表单提交验证
function checkform(formid){
	var isok=true;
	var texts = $("#"+formid).find("input[type='text']");
	var checkboxs = $("#"+formid).find("input[type='checkbox']");
	var radios = $("#"+formid).find("input[type='radio']");
	var passwords=$("#"+formid).find("input[type='password']");
	var selects = $("#"+formid).find("select");
	var textareas = $("#"+formid).find("textarea");
	//验证文本框
	for(var i=0; i<texts.length; i++){
		if(!checkinput(texts[i],"1")){
			isok=false;
			break;
		}
	}
	//验证密码框
	for(var i=0; i<passwords.length; i++){
		if(!checkinput(passwords[i],"1")){
			isok=false;
			break;
		}
	}
	if(isok==false) return;
	//验证复选框
	var checkboxname="";
	for(var i=0; i<checkboxs.length; i++){
		if(checkboxname!=checkboxs[i].name){
			checkboxname=checkboxs[i].name;
			if(!checkcheckbox(checkboxname)){
				isok=false;
				break;
			}
		}
	}
	if(isok==false) return;
	//验证单选框
	var radioname="";
	for(var i=0; i<radios.length; i++){
		if(radioname!=radios[i].name){
			radioname=radios[i].name;
			if(!checkcheckbox(radioname)){
				isok=false;
				break;
			}
		}
	}
	if(isok==false) return;
	//验证下拉框
	for(var i=0; i<selects.length; i++){
		if(!checkselect(selects[i])){
			isok=false;
			break;
		}
	}
	if(isok==false) return;
	//验证文本域
	var textareaname="";
	for(var i=0; i<textareas.length; i++){
		if(textareaname!=textareas[i].name){
			textareaname=textareas[i].name;
			if(!checktextarea(textareas[i])){
				isok=false;
				break;
			}
		}
	}
	return isok;
}

//验证input
function checkformpInput(formid){
    var isok=true;
    var texts = $("#"+formid).find("input[type='text']");

    //验证文本框
    for(var i=0; i<texts.length; i++){
        if(!checkinput(texts[i],"1")){
            isok=false;
            break;
        }
    }
    return isok;
}


//焦点input离开验证验证
function checkinput(obj,trf){
	var types=obj.getAttribute("validateType");
	if(types!=null && types!=undefined && types!=null){
		var type=types.split("&");
		var msg=[];
		msg.push("此信息");
		var istf=false;
		for(var i=0;i<type.length;i++){
			var checktype= type[i].substr(0,3);
			if(checktype!="mil" && checktype!="mal" && type[i]!="idCard"){
				var result = validateArray[type[i]].validate(obj);
				if(!result){
					if(msg.length<=1){
						msg.push(validateType[type[i]]);
					}else{
						msg.push("且"+validateType[type[i]]);
					}
					istf=true;
				}
			}
			else if(checktype=="mil" || checktype=="mal"){
				var eq=type[i].indexOf("=");
				var length=type[i].substr(eq+1,type[i].length);
				var islength=false;
				if(checktype=="mil"){
					if(obj.value.length<length){
						islength=true;
					}
				}else if(checktype=="mal"){
					if(obj.value.length>length){
						islength=true;
						
					}
				}
				if(islength){
					if(msg.length<=1){
						msg.push(validateType[checktype]+length+"个字");
					}else{
						msg.push("且"+validateType[checktype]+length+"个字");
					}
					istf=true;
				}
			}
			else if(type[i]=="idCard"){
				msg=[];
				var result = validateArray[type[i]].validate(obj);
				msg[0]=result[2];
				istf=!result[1];
			}
		}
		if(istf){
			layer.tips(msg.join(""), '#'+obj.id, {tips: [2, '#FF7841']});
			if(trf!=undefined && trf!=null && trf!="" && trf=="1")
			{
				$("#"+obj.id).focus();
				$("#"+obj.id).select();
			}
			return false;
		}else{
			hiddenelement();
			return true;
		}
	}
	return true;
}
//checkbox验证
function checkcheckbox(checkboxname)
{
	var istf=false;
	var idcheck=document.getElementsByName(checkboxname);
	for(var i=0;i<idcheck.length;i++){
		if(idcheck[i].checked){
			istf=false;
			break;
		}else{
			istf=true;
		}
	}
	if(istf){
		layer.tips(validateType['checkbox'], $(idcheck[0]).parent().parent(), {tips: [2, '#FF7841']});
		return false;
	}else{
		hiddenelement();
		return true;
	}
}
//select验证
function checkselect(obj){
	if(obj.value==""){
		layer.tips(validateType['select'], $(obj).parent(), {tips: [2, '#FF7841']});
		return false;
	}else{
		hiddenelement();
		return true;
	}
}
//textarea验证
function checktextarea(obj){
	var types=obj.getAttribute("validateType");
	if(types!=null && types!=undefined && types!=null){
		var type=types.split("&");
		var msg=[];
		msg.push("此信息");
		var istf=false;
		for(var i=0;i<type.length;i++){
			var checktype= type[i].substr(0,3);
			if(checktype!="mil" && checktype!="mal"){
				var result = validateArray[type[i]].validate(obj);
				if(!result){
					if(msg.length<=1){
						msg.push(validateType[type[i]]);
					}else{
						msg.push("且"+validateType[type[i]]);
					}
					istf=true;
				}
			}else{
				var eq=type[i].indexOf("=");
				var length=type[i].substr(eq+1,type[i].length);
				var islength=false;
				if(checktype=="mil"){
					if(obj.value.length<length){
						islength=true;
					}
				}else if(checktype=="mal"){
					if(obj.value.length>length){
						islength=true;
						
					}
				}
				if(islength){
					if(msg.length<=1){
						msg.push(validateType[checktype]+length+"个字");
					}else{
						msg.push("且"+validateType[checktype]+length+"个字");
					}
					istf=true;
				}
			}
		}
		if(istf){
			layer.tips(msg.join(""), '#'+obj.id, {tips: [2, '#FF7841']});
			return false;
		}else{
			hiddenelement();
			return true;
		}
	}
	return true;
}
//显示提示消息
function blockMsg(flag,obj,msg)
{
	if(flag){
		layer.tips(msg, '#'+obj.id, {tips: [2, '#FF7841']});
	}else{
		hiddenelement();
	}
}
//关闭
function hiddenelement()
{
	layer.closeAll('tips');
}
//身份证验证规则
function idCardtools(){}
//15位转18位
idCardtools.id15to18 = function(date){
	var zjhm=date.value;
    var strJiaoYan = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    var intQuan = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var ll_sum = 0;
    var i;
    var t;
    zjhm = zjhm.substr(0, 6) + "19" + zjhm.substr(6);
    for (i = 0; i < zjhm.length; i++) {
    	re = new RegExp("[^0-9X]");
    	if(!re.test(re))
    	{
    		ll_sum = ll_sum + parseInt(0) * intQuan[i];
    	}
    	else
		{
    		ll_sum = ll_sum + parseInt(zjhm.substr(i,1)) * intQuan[i];
		}
    }
    ll_sum = ll_sum % 11;
    zjhm = zjhm + strJiaoYan[ll_sum];
    return zjhm;
}
// -------------------------------
// 函 数 名：check_sfz(item)
// 参数说明：item (id)需要验证身份证的字段
// -------------------------------
idCardtools.check_sfz = function zltools(date) {
	idCardTypeMsg[0]=date;
	idCardTypeMsg[1]=true;
	if(idCardTypeMsg.length==3){
		idCardTypeMsg.splice(2,1);
	}
	var item=date.id;
	var zjhm = date.value;
	var birthday = "";
	var zjhm1 = "";
	var zjhm2 = "";
	var s = "";
	if (!(zjhm.length == 15 || zjhm.length == 18)) {
		idCardTypeMsg[1]=false;
		idCardTypeMsg[2]="身份证长度不对，请检查！";
		return idCardTypeMsg;
	}
	zjhm1 = zjhm;
	//最后一位小写转大写
	if (zjhm.length == 18) {
		zjhm1 = zjhm.substr(0, 17);
		zjhm2 = zjhm.substr(17, 1);
		if (zjhm2 == "x") {
			zjhm2 = "X";
			zjhm = zjhm1 + zjhm2;
		}
	}
	//验证是否数字
	re = new RegExp("[^0-9]");
	if (s = zjhm1.match(re)) {
		idCardTypeMsg[1]=false;
		idCardTypeMsg[2]="输入的值中含有非法字符'" + s + "'请检查！";
		return idCardTypeMsg;
	}
	// 取出生日期
	if (zjhm.length == 15) {
		birthday = "19" + zjhm.substr(6, 6);
	} else {
		re = new RegExp("[^0-9X]");
		if (s = zjhm2.match(re)) // 18位身份证对末位要求数字或字符
		{
			idCardTypeMsg[1]=false;
			idCardTypeMsg[2]="输入的值中含有非法字符'" + s + "'请检查！";
			return idCardTypeMsg;
		}
		birthday = zjhm.substr(6, 8);
	}
	birthday = birthday.substr(0, 4) + "-" + birthday.substr(4, 2) + "-"+ birthday.substr(6, 2);
	if (this.check_sfzdate("证件号码", birthday)[1] == false)// 检查日期的合法性
	{
		return idCardTypeMsg;
	}
	if (zjhm.length == 18) {
		if (!this.check_sfzlast(zjhm)[1])// 对18位长的身份证进行末位校验
		{
			return idCardTypeMsg;
		}
	}
	return idCardTypeMsg;
}
// -------------------------------
// 函 数 名：check_sfzlast(hm)
// 功能介绍：验证身份证最后一位
// -------------------------------
idCardtools.check_sfzlast = function(hm) {
	var w = new Array();
	var ll_sum;
	var ll_i;
	var ls_check;
	w[0] = 7;
	w[1] = 9;
	w[2] = 10;
	w[3] = 5;
	w[4] = 8;
	w[5] = 4;
	w[6] = 2;
	w[7] = 1;
	w[8] = 6;
	w[9] = 3;
	w[10] = 7;
	w[11] = 9;
	w[12] = 10;
	w[13] = 5;
	w[14] = 8;
	w[15] = 4;
	w[16] = 2;
	ll_sum = 0;
	for (ll_i = 0; ll_i <= 16; ll_i++) {
		ll_sum = ll_sum + (hm.substr(ll_i, 1) - 0) * w[ll_i];
	}
	ll_sum = ll_sum % 11;
	switch (ll_sum) {
		case 0 :
			ls_check = "1";
			break;
		case 1 :
			ls_check = "0";
			break;
		case 2 :
			ls_check = "X";
			break;
		case 3 :
			ls_check = "9";
			break;
		case 4 :
			ls_check = "8";
			break;
		case 5 :
			ls_check = "7";
			break;
		case 6 :
			ls_check = "6";
			break;
		case 7 :
			ls_check = "5";
			break;
		case 8 :
			ls_check = "4";
			break;
		case 9 :
			ls_check = "3";
			break;
		case 10 :
			ls_check = "2";
			break;
	}
	if (hm.substr(17, 1) != ls_check) {
		idCardTypeMsg[1]=false;
		idCardTypeMsg[2]="\u8eab\u4efd\u8bc1\u9519\u8bef!\u672b\u5c3e\u5e94\u4e3a:"+ ls_check + ",\u5b9e\u4e3a:" + hm.substr(17, 1);
		return idCardTypeMsg;
	}
	idCardTypeMsg[1]=true;
	return idCardTypeMsg;
}
// -------------------------------
// 函 数 名：check_sfzdate(i_field,thedate)
// 功能介绍：验证身份证中的出生日期
// -------------------------------
idCardtools.check_sfzdate = function(i_field, thedate) {
	if (!(thedate.length == 8 || thedate.length == 10)) {
		idCardTypeMsg[1]=false;
		idCardTypeMsg[2]="请输入正确的'" + i_field + "' ！";
		return idCardTypeMsg;
	}
	if (thedate.length == 8) {
		thedate = thedate.substr(0, 4) + "-" + thedate.substr(4, 2) + "-" + thedate.substr(6, 2);
	}
	var reg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
	var r = !reg.test(thedate);
	if (r) {
		idCardTypeMsg[1]=false;
		idCardTypeMsg[2]="身份证出生日期错误!";
		return idCardTypeMsg;
	}
	else
	{
		idCardTypeMsg[1]=true;
		return idCardTypeMsg;
	}
	idCardTypeMsg[1]=true;
	return idCardTypeMsg;
}