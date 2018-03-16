var USERCHECKSTRING   = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_.";
var lanset;	//0 English	1 Chinese //登录界面返回
var DEVICEIPC	= parseInt(getCookies("DEVICEIPC"));
var nlan		= parseInt(getCookies("nLANGUAGE"));
var m_szLanguage 	= 'en';	//en:English	cn:Chinese
var bReboot=0;

var Timeouts=0, onReTOS=0;
var timeProcess;	//setInterval 返回的句柄 函数：setTimeProcess 菜单切换延时
var intervalProcess;//setInterval 返回的句柄 函数：setTimeoutProcess
timeProcess 	= setInterval('setTimeProcess(10)', 1000);
intervalProcess	= setInterval('setTimeoutProcess()', 512);

if(!isNaN(nlan)){lanset = nlan;
}else{
	var syslan	= navigator.browserLanguage.toLowerCase();//得到浏览器所用的语言
	if(syslan.indexOf("zh-cn")>-1){lanset = 1;
	}else{lanset = 0;}
}
if(lanset == 1){m_szLanguage = 'cn';
}else{m_szLanguage = 'en';}
setCookies("nLANGUAGE", lanset, 7);
if(isNaN(DEVICEIPC)){DEVICEIPC	= 1;}

var pageUNAME, pagePASSWORD, pagePort, pageURL;
if(top.location.href == self.location.href){
	pageUNAME		= getCookies("pageUname");
	pagePASSWORD	= getCookies("pagePassword");
	pagePort		= parseInt(getCookies("pagePort"));
	pageURL			= getDocURL();		//getCookies("pageURL");
}else{
	if($p("bCenterWeb").value=="1"){
		pageUNAME		= $p("uname").value;	//getCookies("pageUname");
		pagePASSWORD	= $p("passwd").value;	//getCookies("pagePassword");
	}else{
		pageUNAME		= $p("username").value;	//getCookies("pageUname");
		pagePASSWORD	= $p("password").value;	//getCookies("pagePassword");
	}
	pagePort		= parseInt($p("port").value);	//parseInt(getCookies("pagePort"));
	pageURL			= getDocURL();		//getCookies("pageURL");
	var nlevel	= parseInt(getCookies("nUserLevel"));
	var bValue	= isGoTo();
	if(isNaN(nlevel)&&bValue){window.parent.location='outtime.html';}
	if(nlevel<4&&bValue){window.location='outtimeadmin.html';}		//非管理员则跳出
}
if(isNaN(pagePort)){pagePort=5000;}
if(pageUNAME==null||pageUNAME==""||pageUNAME=="undefined"){pageUNAME="admin";}
if(pagePASSWORD==null||pagePASSWORD==""||pagePASSWORD=="undefined"){pagePASSWORD="admin";}

//计数
function setTimeProcess(a){
	Timeouts	= Timeouts + 1;
	onReTOS		= onReTOS + 1;
	if(Timeouts>a&&onReTOS>a)
		clearInterval(timeProcess);
}
//执行超时处理
function setTimeoutProcess(){
	var dDate=new Date(), nowTimes = dDate.getTime(), expireDays=7;
	dDate.setTime(dDate.getTime()+expireDays*24*3600*1000);
	document.cookie="setTimes=" + nowTimes + "; ";
	delete dDate; dDate = null; CollectGarbage(); 
}

function chgcountfun(countnum,strdiv,flags){
	var nCountnum = countnum, Strdivs;
	if(nCountnum > 8) nCountnum = 8;
	if(nCountnum>1){
		Strdivs = strdiv + "1"; $s(Strdivs).innerHTML = $s(Strdivs).innerHTML + "1";
	}
	for(i=1;i<=nCountnum;i++){
		Strdivs = strdiv + i; $s(Strdivs).style.display="";
	}
}
function parentinit(param1,param2,param3){return true;}
function funptzmsg(Pobj,ptop,pflag){
	//if(Initflag==true){
		var tmpleft	= document.all("divMain").offsetLeft;
		var tmptop	= document.all("divMain").offsetTop-ptop;	//event.y-230;
		tmptop = event.y-ptop;
		if(pflag==2){
			tmptop = event.y-ptop; tmpleft= event.x+180;
		}else if(pflag==3){
			tmptop = event.y-ptop; tmpleft= event.x-30;
		}else if(pflag > 50){
			tmptop = event.y-ptop; tmpleft= event.x-pflag;
		}
		if(tmpleft<0) tmpleft=0;
		if(tmptop<0) tmptop=0;
		document.all(Pobj).style.display='';
		document.all(Pobj).style.left=tmpleft + "px";
		document.all(Pobj).style.top=tmptop + "px";
		Initflag = false;
	//}
	if(document.all(Pobj).style.visibility=='visible'&&pflag==1){
		document.all(Pobj).style.visibility='hidden';
	}else{
		document.all(Pobj).style.visibility='visible';
	}
}
function getFileName(){
	var filename, url = this.location.href, pos = url.lastIndexOf("/");
	if(pos == -1){pos = url.lastIndexOf("\\");}
	url	= url.substr(pos+1);
	pos = url.indexOf("?");
	if(pos == -1){filename = url.substr(pos+1);}else{filename = url.substr(0, pos);}
	return filename;
}
function isGoTo(){
	var bAdmin, sFileName	= getFileName();
	if(sFileName=="btnhit.htm"||sFileName=="error.asp"||sFileName=="outtime.html"||sFileName=="outtimeadmin.html"||sFileName=="relogin.asp"||sFileName=="setchannel.asp"||sFileName=="centerview.asp"||sFileName=="login.asp"||sFileName=="local.asp"){bAdmin=false;}else{bAdmin=true;}
	return bAdmin;
}

<!--实现层移动--> 
var Obj='', Initflag = true;
document.onmouseup=MUp; 
document.onmousemove=MMove;
function   MDown(Object){ 
	Obj=Object.id 
	document.all(Obj).setCapture();
	pX=event.x-document.all(Obj).style.pixelLeft; 
	pY=event.y-document.all(Obj).style.pixelTop; 
}
function   MMove(){ 
	if(Obj!=''){ document.all(Obj).style.left=event.x-pX; document.all(Obj).style.top=event.y-pY;} 
}
function   MUp(){ 
	if(Obj!=''){ document.all(Obj).releaseCapture(); Obj=''; } 
} 
