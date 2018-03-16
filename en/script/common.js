function getDocURL(){
	var returnURL, tmpurl;
	tmpurl	= (document.URL.split('//')[1]).split('/')[0];
	if(tmpurl.substr(0, 1) == "[" ){returnURL	= tmpurl.split('[')[1].split(']')[0];}
	else{returnURL	= tmpurl.split(':')[0];}
	if(returnURL=="127.0.0.1"){returnURL = "192.168.1.231";}	//panch 调试，直接返回可用IP.
	return returnURL;
}
//读取Cookies
function getCookies(strName){
	var strCookie=unescape(document.cookie);
	var arrCookie=strCookie.split("; ");
	var userId=null;
	for(var i=0;i<arrCookie.length;i++){	//遍历cookie数组，处理每个cookie对
	   var arr=arrCookie[i].split("=");
	   if(strName==arr[0]){userId=unescape(arr[1]); break;}	//找到名称为userId的cookie，并返回它的值
	}
	return(userId);
}
//设置Cookies
function setCookies(strName, strValue, strExpires){
	var date=new Date(), expireDays;
	if(strExpires==""||strExpires==null){expireDays=1;}else{expireDays=parseInt(strExpires);}
	if(isNaN(expireDays)||expireDays<0){expireDays=1;}
	if(strName==null||strName==""){strName = "nothing";}
	date.setTime(date.getTime()+expireDays*24*3600*1000);
	document.cookie=""+strName+"=" + strValue + ";expires="+date.toGMTString();
	delete date; date = null; CollectGarbage();
}
//获取父页面的getElementById
function $p() {
  var elements = new Array();
  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string'){element = parent.document.getElementById(element);}
    if (arguments.length == 1){return element;}
    elements.push(element);
  }
  return elements;
}
//获取本页面的getElementById
function $s() {
  var elements = new Array();
  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string'){element = document.getElementById(element);}
    if (arguments.length == 1){return element;}
    elements.push(element);
  }
  return elements;
}
//去字符串前后空格
function trimEx(str){
	if(isNull(str) || isBlank(str)){return "";}
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
//checkbox对象应对赋值
function checkClick(frm,name){
	if($(name).checked==false){$(name).value=0;
	}else{$(name).value=1;}
}
/*********************************
//flag:	1检测IP  2检测域名  3检测IP或域名
*********************************/
function isURL(obj,flag){
	var	str = obj.value;  
	var strRegDomain	= /^((http|https):\/\/)?(([a-z0-9]([-a-z0-9]*[a-z0-9])?\.)+((a[cdefgilmnoqrstuwxz]|aero|arpa)|(b[abdefghijmnorstvwyz]|biz)|(c[acdfghiklmnorsuvxyz]|cat|com|coop)|d[ejkmoz]|(e[ceghrstu]|edu)|f[ijkmor]|(g[abdefghilmnpqrstuwy]|gov)|h[kmnrtu]|(i[delmnoqrst]|info|int)|(j[emop]|jobs)|k[eghimnprwyz]|l[abcikrstuvy]|(m[acdghklmnopqrstuvwxyz]|mil|mobi|museum)|(n[acefgilopruz]|name|net)|(om|org)|(p[aefghklmnrstwy]|pro)|qa|r[eouw]|s[abcdeghijklmnortvyz]|(t[cdfghjklmnoprtvwz]|travel)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])+)|((\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3}))(\:[0-9]*)?(\/[\w-\.\/?%&=]*)?$/i
	var	strRegIP = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/; 
	var Result	= false;
	if(1!=flag){	//检测域名
		if(strRegDomain.test(str)==true){  
			Result	= true;
		}
	}
	if(2!=flag){	//检测IP
		if(strRegIP.test(str)==true){   
  			if(RegExp.$1<0||RegExp.$1>255||RegExp.$2<0||RegExp.$2>255||RegExp.$3<0||RegExp.$3>255||RegExp.$4<0||RegExp.$4>255){      
				//obj.focus();   
			}else{
				Result	= true;   
				//剔除 如 010.020.020.03 前面 的0     
				var strtmp	= str.replace(/0(\d)/g,"$1");   
				//obj.value	= str.replace(/0(\d)/g,"$1");   
			}
		}
	}
	return Result;
}
//检测IP
function checkIp(str){ 
  //check type    
  if(/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/.test(str)==false){return false; }   
  //check value
  if(RegExp.$1<0 || RegExp.$1>255||RegExp.$2<0||RegExp.$2>255||RegExp.$3<0||RegExp.$3>255|| RegExp.$4<0||RegExp.$4>255){return false;}   
  //剔除   如     010.020.020.03   前面   的0     
  var   str=str.replace(/0(\d)/g,"$1");   
  str=str.replace(/0(\d)/g,"$1");    
  return true;  
} 
//判断是否为数组 
//typeof 返回值有六种可能： "number," "string," "boolean," "object," "function," 和 "undefined."
function isArray(obj){	
	if(typeof(obj)!="object"){return false;}
	if (!Array.prototype.push) { 
		Array.prototype.pop=function(){
			if(this.length!=0)this.length--;
				return this;
		}
	}
	if (!Array.prototype.push) { 
		Array.prototype.push = function() { 
			var startLength = this.length; 
			for (var i = 0; i < arguments.length; i++) 
				this[startLength + i] = arguments[i]; 
			return this.length; 
		} 
	}
	try{
		obj.push(1);obj.pop();return true;
	}catch(e){return false;}
}
//是否为数字
function isNum(num){
	if(!num.match("^\\d+$")){return false;}
	return true;
}
//是否为空
function isBlank(str){
	if( str !=""){return false;}else{return true;}
}
//是否为未定义
function isNull(str){
	if( str !=null){return false;}else{return true;}
}
//限制只返回数字 (输入框输入控制)
function isDigit(){
  if((event.keyCode != 46)&&(event.keyCode != 13)){
	  if ((event.keyCode < 48) || (event.keyCode > 57)) {alert(ALERTENTERINTEGER)};
  	  return ((event.keyCode >= 48) && (event.keyCode <= 57));
  }else{
	return  (event.keyCode);
  }
}
function check_com(theForm,checkOK,Msg){     //公用
  try{
	var checkStr=theForm;
		for(i=0;i<checkStr.length;i++){
			ch = checkStr.charAt(i);
			for (j = 0;  j < checkOK.length;  j++){
				if (ch == checkOK.charAt(j)){break;}
			}
			if (j == checkOK.length){return (false) ;}
		}
	return (true)
  }catch(e){}
}
//产生一个指定长度的随机数
function ranString(paranum){
	var reString, dtmp, i, itmp; 
   	dtmp = new Date();
	reString = dtmp.getMilliseconds().toString();
	delete dtmp; dtmp = null;
	itmp = paranum - reString.length;
	for (i=0;i<itmp;i++){ 
		x =parseInt(Math.random()*(10-1))+1; reString += x.toString();
	} 
	return reString;
}
function stringLength(s){ 
	var l = 0; 
	var a = s.split(""); 
	for (var i=0;i<a.length;i++) { 
		if (a[i].charCodeAt(0)<299){l++;}else{l+=2;} 
	} 
	return l; 
}
//获取浏览器名称及版本信息
function appInfo(){
    var browser = {
            msie: false, firefox: false, opera: false, safari: false, 
            chrome: false, netscape: false, appname: 'unknown', version: 0
        },
        userAgent = window.navigator.userAgent.toLowerCase();
    if ( /(msie|firefox|opera|chrome|netscape)\D+(\d[\d.]*)/.test( userAgent ) ){
        browser[RegExp.$1] = true;
        browser.appname = RegExp.$1;
        browser.version = RegExp.$2;
    } else if ( /version\D+(\d[\d.]*).*safari/.test( userAgent ) ){ // safari
        browser.safari = true;
        browser.appname = 'safari';
        browser.version = RegExp.$2;
    }
    return browser;
}
//得到windows当前操作系统版本
function GetOSVer(){
    var ua = window.navigator.userAgent;
    var osVersion = ua.split(";")[2]; 
    var osV = osVersion.substr(osVersion.length-3,3); 
    switch(osV){ 
        case "5.0": 
            return "Win2000"; 
        case "5.1": 
            return "WinXP"; 
        case "5.2": 
            return "Win2003"; 
        case "6.1":
            return "Win7";
        default: 
            return "Others"; 
    }
}
function do_submit(){$("outcfg_frm").submit();}

function remarkDisplay(a,b,c,d){$(a).className="Box"+d;$(a).setProperty("text",b);$(a).style.display="block";$(a).fade("in");window.setTimeout(function(){$(a)&&$(a).fade("out")},c)}
function setDisplay(a, c){if(!$(a))return;c?$(a).style.display="":$(a).style.display="none"}
function setDisabled(a, c){if(!$(a))return;c?$(a).disabled=true:$(a).disabled=false}
function limit(a,c){var b=a.value;if(b!="")b=b.replace(/[^\d]/g,"")-0,a.value=b>c?c:b}
function limitMax(a,c){var b=a.value;if(b!="")b=b.replace(/[^\d]/g,"")-0,a.value=b>c?c:b}
function limitMin(a,c){var b=a.value,b=b.replace(/[^\d]/g,"")-0;if(b-0<=c)a.value=c}
function limitTime(a,c){var b=a.value,b=b.replace(/[^\d]/g,"");if(b-0>c)a.value=c;b=a.value;b.length>=2&&a.id!=""&&(b=$(a.id).getNext("input"))&&b.select()}
function limitMac(a,c){var b=a.value;b=b.replace(/[^0-9a-fA-F]/g,"");b.length>2?b=b.substr(0,2):b=b;a.value=b;}
function limitFloat(a,b){var c=a.value;if(/^[0-9]+[.]?[0-9]*$/.test(a.value))if(c.charAt(0)==".")a.value="0"+c;else{if(/[.]/.test(c)){var c=c.replace(/[^0-9, ^.]/g,""),d=c.indexOf(".",c.indexOf(".")+1);a.value=d>0?c.slice(0,d):c;if(a.value.indexOf(".")==1&&a.value.length>3)a.value=a.value.slice(0,3)}else if(a.value=c.replace(/[^0-9, ^.]/g,""),a.value>b)a.value=b;if(a.value=="00"||a.value=="0.0"||a.value==""||a.value=="0."||a.value-0<0.1)a.value="0";if(a.value-0>jsonInCap[0].MaxExposureTime)a.value=jsonInCap[0].MaxExposureTime;a.value-=0}else a.value="0"}
function limitNum(a,c){$(a).value=$(a).value.replace(/[\"]+/,"");$(a).value=$(a).value.replace(/[\u4E00-\u9FA5]+/,"");if($(a).value)$(c).className="",$(c).className="addicon"}
function limitTitle(a){$(a).value=$(a).value.replace(/[\"]+/,"");$(a).value=$(a).value.replace(/[\']+/,"")}

function attachDateInput(a,b){
	var c=[],d=[],c=[$(a+"0"),$(a+"1"),$(a+"2")],d=[$(b+"0"),$(b+"1"),$(b+"2")];
	e=function(b,e){c[b]&&c[b].addEvents({keyup:function(f){if(b==2){var h=getMonthDay(a);chkTime(a,b,h,f)}else chkTime(a,b,e,f);f.code==37?b>0&&b<3&&c[b-1].select():b==2&&d[0]!=null&&this.value.length>=2&&d[0].select()},blur:function(c){if(b==2){var d=getMonthDay(a);chkTime(a,b,d,c)}else chkTime(a,b,e,c);checkDay(a)},focus:function(){this.select()}})},f=function(a,e){d[a]&&d[a].addEvents({keyup:function(f){chkTime(b,a,e,f);f.code==37&&(a==0&&c[2]!=null?c[2].select():a>0&&a<3&&d[a-1].select())},blur:function(){limit(this,e);if(this.value.length==1)this.value="0"+this.value},focus:function(){this.select()}})};a!=""&&(e(0,2999),e(1,12),e(2,getMonthDay(a)));b!=""&&(f(0,23),f(1,59),f(2,59))}

function chkTime(a,c,b,d){var d=d||event,g=b.toString().length,e,f=$(a+c);f.value=f.value.replace(/[^\d]/g,"");d=d.keyCode;if(d==37||d==39||d==9)if(f.blur(),d==37&&(e=c-1),d==39&&(e=c+1),d==9){if($(a+(c-1))&&(b=$(a+(c-1)).value-0,b<10))$(a+(c-1)).value="0"+b;$(a+c).select()}else{if(!(e>2||e<0)){b=f.value-0;if(b<10)f.value="0"+b;$(a+e).select()}}else if(f.value.length>=g)if(parseInt(f.value)>b)f.value=b,e=c+1,e>2||e<0||$(a+e).select();else if(parseInt(f.value)<0)f.value="00";else if(f.blur(),e=c+1,!(e>2||e<0)){b=f.value-0;if(b<10)f.value="0"+b;$(a+e).select()}}
function checkDay(a){if($(a+0).value-0<2E3)$(a+0).value=2E3;var c=$(a+1).value-0;if(c<1)$(a+1).value="01";else if(c<10)$(a+1).value="0"+c;else if(c>12)$(a+1).value=12;var c=$(a+2).value-0,b=getMonthDay(a);if(c<=0)$(a+2).value="01";else if(c<10)$(a+2).value="0"+c;else if(c>b)$(a+2).value=b}
function getMonthDay(a){var c=$(a+0).value-0,a=$(a+1).value-0;return a==4||a==6||a==9||a==11?30:a==2&&!(c%4!=0||c%100==0&&c%400!=0)?29:a==2&&(c%4!=0||c%100==0&&c%400!=0)?28:31}
function chk10(a){var b=a-0;return a-0<10?"0"+(b-0):b}
function getMonthDays(a,b){function c(a){return a%100==0&&a%400==0||a%100!=0&&a%4==0?!0:!1}return b==4||b==6||b==9||b==11?30:b==2&&c(a)?29:b==2&&!c(a)?28:31}

function ipv4LimitLast(a,d,b){var e=$(a),f=a=="ip3"?$("ip2"):$("dg2");e.removeEvents("keyup");e.removeEvents("blur");e.addEvents({keyup:function(a){this.value-0==255&&remarkDisplay("remark",tl("w_ipv4_range_last"),3E3,2);limit(this,b);a.code==37&&f.select()},blur:function(){if(this.value-0==0)remarkDisplay("remark",tl("w_ipv4_range_last"),3E3,2),this.value=1;limit(this,b);limitMin(this,d)}})}

function ipv4Limit(a,d,b){var e=$(a),f=a=="ip0"?$("ip1"):$("dg1");e.removeEvents("keyup");e.removeEvents("blur");e.addEvents({keyup:function(a){limit(this,b);a=a.code;a==110||a==190||a==39?f.select():a!=9&&this.value.length>=3&&f.select()},blur:function(){if(this.value-0==127)remarkDisplay("remark",tl("w_ipv4_127"),3E3,2),this.value=1;(this.value-0==0||this.value-0>223)&&remarkDisplay("remark",tl("w_ipv4_range"),3E3,2);limit(this,b);limitMin(this,d)}})}

function attachLimit(a,b,c){a=$(a);a.removeEvents("keyup");a.removeEvents("blur");a.addEvents({keyup:function(){limit(this,c)},blur:function(){limit(this,c);limitMin(this,b)}})}
function attachLimitCompare(a,b,c,d,e){var a=$(a),f=$(b);a.removeEvents("keyup");a.removeEvents("blur");a.addEvents({keyup:function(){limit(this,d)},blur:function(){limit(this,d);limitMin(this,c);if(e){if(this.value-0>f.value-0)this.value=f.value}else if(this.value-0<f.value-0)this.value=f.value}})}
function attachPortLimit(a,b,c,d){d||(d=65535);var e=[1900,3800,3801,5E3,5050,9999,37776,37777,37778,39999,37780,37781];c!=void 0&&e.erase(c);$(a).addEvents({keyup:function(){limit(this,d)},blur:function(){this.value=this.value.replace(/[^\d]/g,"")-0;if(this.value-0>d+1)this.value=c==void 0?1025:c;if(!isNaN(this.value)&&this.value!=""){var a=this.value-0;if(a!=c&&(a<=1024||e.contains(a)))$(b)?remarkDisplay(b,tl("Port in use!"),3E3,2):alert(tl("Port in use!"));else if($(b))$(b).style.display="none"}else $(b)?remarkDisplay(b,tl("Numbers only!"),3E3,1):alert(tl("Numbers only!"))}})}
function chkPort(a,b){var c=[1900,3800,3801,5E3,5050,9999,37776,37777,37778,39999,37780,37781];b!=void 0&&c.erase(b);return a-0==b||a-0>1024&&!c.contains(a-0)?!0:!1}
function attachIpInput(a){var b=[],b=$type(a)!="array"?[$(a+"0"),$(a+"1"),$(a+"2"),$(a+"3")]:[$(a[0]),$(a[1]),$(a[2]),$(a[3])],a=function(a,d){b[a]&&(b[a].removeEvents("keyup"),b[a].removeEvents("blur"),b[a].removeEvents("focus"),b[a].addEvents({keyup:function(e){e=e.code;limit(this,d);e==110||e==190||e==39?a<3&&b[a+1].select():e!=9&&(e==37?a>0&&a<4&&b[a-1].select():(this.value.length>=3&&a<3&&b[a+1].select(),this.value.length>=3&&a==3&&b[0].select()))},blur:function(){limit(this,d);if(this.value=="")this.value=0},focus:function(){this.select()}}))};a(0,255);a(1,255);a(2,255);a(3,255)}
function attachMacInput(a){var b=[],b=$type(a)!="array"?[$(a+"0"),$(a+"1"),$(a+"2"),$(a+"3"),$(a+"4"),$(a+"5")]:[$(a[0]),$(a[1]),$(a[2]),$(a[3]),$(a[4]),$(a[5])],a=function(a,d){b[a]&&(b[a].removeEvents("keyup"),b[a].removeEvents("blur"),b[a].removeEvents("focus"),b[a].addEvents({keyup:function(e){e=e.code;limitMac(this,d);e==110||e==190||e==39?a<3&&b[a+1].select():e!=9&&(e==37?a>0&&a<6&&b[a-1].select():(this.value.length>=2&&a<5&&b[a+1].select(),this.value.length>=2&&a==5&&b[0].select()))},blur:function(){limitMac(this,d);if(this.value=="")this.value=0},focus:function(){this.select()}}))};a(0,99);a(1,99);a(2,99);a(3,99);a(4,99);a(5,99)}

var jsonLang="";function tl(a){return jsonLang&&jsonLang[a]?jsonLang[a].trim()?jsonLang[a].trim():a:jsonLang[a+" "]?jsonLang[a+" "]:a}

function puttime(){
	if($("GCFLAG")!=null){
		timer&&clearTimeout(timer);var a=timeT.split(":"),b=a[0]-0,c=a[1]-0,a=a[2]-0;
		if(++a>=60&&(a=0,++c>=60&&(c=0,++b>=24))){return}
		var d="",g="",f="";
		timeT=chk10(b)+":"+chk10(c)+":"+chk10(a);
		d=b<10?"0"+(b-0):""+b;g=c<10?"0"+c:""+c;f=a<10?"0"+a:""+a;
		if($("stm0")&&timeC)$("stm0").value=d,$("stm1").value=g,$("stm2").value=f;
		timer=setTimeout("puttime()",1E3);
	}
}
function putsystime(){
	if($("GCFLAG")!=null){
		stimer&&clearTimeout(stimer);
		var t = new Date(),h=t.getHours(),m=t.getMinutes(),s=t.getSeconds(),y=t.getFullYear(),d=t.getDate(),t=t.getMonth()+1;
		if($("sdt0")&&timeSC){$("sdt0").value=y;$("sdt1").value=t;$("sdt2").value=d;}
		if($("stm0")&&timeSC){$("stm0").value=h;$("stm1").value=m;$("stm2").value=s;}
		delete t;t=null;
		stimer=setTimeout("putsystime()",1E3);
	}
}
function reinitIP(a, b){
	var f=$(a+"0").value-0+"."+($(a+"1").value-0)+"."+($(a+"2").value-0)+"."+($(a+"3").value-0); $(b).value = f;
}
function initIP(a, b){
	attachIpInput(a); var iplist = b.split(".");
	iplist.each(function(c,d){$(a+d).value=c;});
	//if(iplist.length==4){$(a+"0").value=iplist[0]; $(a+"1").value=iplist[1]; $(a+"2").value=iplist[2]; $(a+"3").value=iplist[3];}
}
