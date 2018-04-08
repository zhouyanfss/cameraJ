// JavaScript Document
//window.addEvent("domready",function(){})
window.onload=function(){initPage();return;}
document.onkeypress=function(){$("lg_out").style.display==""&&event.keyCode==13&&login()}
window.onresize=function(){ resize();}
var HEADER_MENUS_ITEM=110;
var b_INIT_MENUS_LIVEVIEW=!1, b_INIT_MENUS_SETTING=!1, b_INIT_REPLAY_PAGE=!1, b_INIT_ONRESIZE=!1;
var timeProcess_RESIZE, sNowURLName = "local";
var Sys={},ua=navigator.userAgent.toLowerCase(),s;
(s=ua.match(/msie ([\d.]+)/))?Sys.ie=s[1]:(s=ua.match(/firefox\/([\d.]+)/))?Sys.firefox=s[1]:(s=ua.match(/chrome\/([\d.]+)/))?Sys.chrome=s[1]:(s=ua.match(/opera.([\d.]+)/))?Sys.opera=s[1]:(s=ua.match(/version\/([\d.]+).*safari/))&&(Sys.safari=s[1]);

function initPage(){
	try{
		parent.moveTo(0,0); parent.resizeTo(screen.width,screen.height-30); parent.focus();
	}catch(e){}
	initLanguage();
	if( parseInt($("digest").value)==1 ){
		$("username").value=$("uname").value; $("password").value=$("passwd").value; $("b_e").style.display="none";
		gotoLogin();
	}else{
		//showLogin();
		//debug模式，直接登录
		login("admin","admin");
		$("b_login").addEvent("click",login);$("b_cancel_l").addEvent("click",function(){window.close();});
		$("username").value	= "admin";$("password").focus();$("password").select();
	}
	setTimeout("ocxConfirm();", 300);
	return true;
}
function initLanguage(){
	var nlan = parseInt($("vlanguage").value); 
	if(isNaN(nlan)){
		var syslan = navigator.browserLanguage.toLowerCase();//得到浏览器所用的语言
		if(syslan.indexOf("zh-cn")>-1){lanset=1;}else{lanset=0;}
	}else{lanset = nlan; }
	if(lanset==1){m_szLanguage='cn';}else{m_szLanguage='en';} setCookies("nLANGUAGE", lanset, 7);
	ApplyXmlLang("login.xml", m_szLanguage);
	m_xmlDoc = null; 
	getXMLHandler("./xml/htmlalert.xml", m_szLanguage);	//加载语言xml
	getJsAlertText(); 
	return true;
}
function showLogin(){$("lg_out").style.top="0px";$("lg_out").style.display="";$("main").style.display="none";}

function login(username,password){
	if(!username)
	{
		username = $("username").value;
	}
	
	if(!password)
	{
		password = $("password").value;
	}
	//登录交互
	var sURL = "/webs/loginCMS"; 
	var nRanstr=ranString(8);
	sURL = "./xml/loginxml.xml"; 
	sURL = sURL + "?username="+username;
	sURL = sURL + "&password="+password;
	sURL = sURL + "&UserID="+nRanstr+"";
	
	g_xmlhttp.open("get",  sURL,  false);
	try{
     g_xmlhttp.responseType = "msxml-document";
    }catch(e){
    }
	SafeHttpSend(g_xmlhttp,  null);
	//g_xmlhttp.onreadystatechange = function()
	{
		if (g_xmlhttp.readyState != 4){return false;}
	}
    if (g_xmlDoc!=null){delete g_xmlDoc;g_xmlDoc=null;}
 
    // g_xmlDoc = FormatToXmlDOM(g_xmlhttp.responseText); 
    // g_xmlDoc.async = false; 
	// if(g_xmlDoc.selectSingleNode("html/body/level")){
		// var nlevel = g_xmlDoc.selectSingleNode("html/body/level").text;
		// if(isNaN(nlevel)||nlevel<0){alert(ALERTLOGIN);return false; }
		// setCookies("nUserLevel", nlevel,  1);
	// }else{alert(ALERTLOGINCON+"~");return false; }
	
	if(jQuery(g_xmlhttp.responseText))
	{
		var tmpObj = jQuery(jQuery.parseXML(g_xmlhttp.responseText)).find("html body level");
		if(tmpObj && tmpObj.text())
		{
		var nlevel = tmpObj.text();
		if(isNaN(nlevel)||nlevel<0){alert(ALERTLOGIN);return false; }
		setCookies("nUserLevel", nlevel,  1);
		}
		else{
			alert(ALERTLOGINCON+"~");
			return false; 
		}
	}
	
	gotoLogin(); 
	return  true;
}
function gotoLogin(){
	initMainPage();	 initMenus(); //goMain(0);
	//setTimeout("loginNVS();",  350);
}
function initMainPage(){
	$("lg_out").style.display = "none";
	$("main").style.display = "";
	$("main").style.top = "0px";
	$("b_preview").addEvent("click",function(){goMain(0)});
	$("b_playback").addEvent("click",function(){goMain(1)});
	$("b_ptzctrl").addEvent("click",function(){goMain(2)});
	$("b_config").addEvent("click",function(){goMain(3)});
	$("b_alarm").addEvent("click",function(){goMain(4)});
	$("d_alarmtip").addEvent("click",function(){goMain(4)});
	$("b_quit").addEvent("click",function(){goMain(110)});
	return true;
}
function initMenus(){
	setCookies("pageUname", $("username").value, 7);
	setCookies("pagePassword", 	$("password").value, 7);
	setCookies("pageURL", $("url").value, 7);	
	setCookies("pagePort", $("port").value, 1);
	setCookies("intSDRecord", $("nstorage").value, 7);
	setCookies("intChannel", $("nchannel").value, 7);	//通道数
	setCookies("alarmoutputcount", $("noutput").value,1);	//报警输入路数
	setCookies("devicetype", $("devicetype").value, 7);
	setCookies("iswifi", $("iswifi").value, 1);		//是否有探头WIFI
}
function goMain(a){
	b_INIT_ONRESIZE=1;
	try{if(bInitReplayOcx==1){var nWindow = parseInt($("nwindows").value);$("ReVideoX").PLAY_Pause(nWindow);} }catch(e){}
	if(a!=0){
		var i, r=0, c=0; l=0, scf="";
		for(i=0; i<4; i++){r=1; if(bRECORD[i]>0){scf = ALERTVIEWRECORD;}}
		if(bCALL>0){c=1; if(scf!=""){scf = scf + "、" + ALERTVIEWCALL;}else{scf = ALERTVIEWCALL;}}
		for(i=0; i<4; i++){l=1; if(bLISTEN[i]>0){if(scf!=""){scf = scf + "、" + ALERTVIEWLISTEN;}else{scf = ALERTVIEWLISTEN;}}}
		if(scf!=""){if(!confirm(scf + " " + ALERTVIEWCHANGE)){return false;}else{
				if(r==1){$("WebCMS").StopRecord();}
				if(c==1){$("WebCMS").StopTalk();}
				if(l==1){$("WebCMS").PlayAudio(0);}
			}
		}
	}
	
	
	switch(a){
		case 0: goPreview(a); break;
		case 1:	goPlayback(a); break;
		case 2:	goPtzCtrl(a); break;
		case 3:	goSysConfig(a); break;
		case 4: goAlarm(a); break;
		case 110: goLogout(a); break;
		default: goLogout(a); break;
	}
	if(a!=0){initState(0);}
	HEADER_MENUS_ITEM=a;
}
//实时浏览
function goPreview(a){
	if(HEADER_MENUS_ITEM==0){return false;}
	$("mb0").style.display="none";
	$("mb1").style.display="none";
	$("mb2").style.display="none";
	$("mb").style.display="";
	$("set_fm").src="";
	changeNavStyle($("b_preview"));
	if(!b_INIT_MENUS_LIVEVIEW){
		g_xmlhttp.open("get", "html/body_menus_bar.html?"+ (new Date()).valueOf(), false);
		SafeHttpSend(g_xmlhttp, null);
		{
			if (g_xmlhttp.readyState != 4){return false;}
			document.getElementById("mb_btn_bar").innerHTML = g_xmlhttp.responseText;
		}
		b_INIT_MENUS_LIVEVIEW=1;
		if($("b_image"))$("b_image").className	= "Rightbtn image";
		if($("b_ptz"))$("b_ptz").className	= "Rightbtn ptz";
		RIGHT_FOCUS_SHOW=0;RIGHT_SIDE=0;
		if($("image_adjust"))$("image_adjust").style.display="none";	//亮色调节
		if($("focus_adjust"))$("focus_adjust").style.display="none";	//聚焦变倍
		//$("ptz_control").style.display="none";	//球机PTZ 聚焦变倍
		ApplyXmlLang("index.xml", m_szLanguage);
	}
	HEADER_MENUS_ITEM	= a;
	manualResize();
	var bStream	= $("WebCMS").GetStreamType();
	if(bStream){
		$("b_Stream1").className = "b_Stream1";
		$("b_Stream2").className = "b_Stream2";
	}else{
		$("b_Stream1").className = "b_Stream2";
		$("b_Stream2").className = "b_Stream1";
	}
	
	RIGHT_PTZ_SHOW=0;
	funPTZCtrl(null,0);
	setTimeout("startPreview();", 300);
}
//录像回放
function goPlayback(a){
	if(HEADER_MENUS_ITEM==1)return false;
	stopPreview();
	$("mb").style.display="none";
	$("mb0").style.display="none";
	$("mb2").style.display="none";
	$("mb1").style.display="";
	$("set_fm").src="";
	changeNavStyle($("b_playback"));
	if(!b_INIT_REPLAY_PAGE){
//加载设备功能菜单 
		g_xmlhttp.open("get", "html/body_replay_left.html", false);
		SafeHttpSend(g_xmlhttp, null);
//g_xmlhttp.onreadystatechange = function()
		{
			if (g_xmlhttp.readyState != 4){return;}
			
			var configData;
			configData = g_xmlhttp.responseText;
			document.getElementById("review_ctrl").innerHTML = configData;
		}
		g_xmlhttp.open("get", "html/body_replay_menus.html", false);
		SafeHttpSend(g_xmlhttp, null);
//g_xmlhttp.onreadystatechange = function()
		{
			if (g_xmlhttp.readyState != 4){return;}
			
			var configData;
			configData = g_xmlhttp.responseText;
			document.getElementById("div_replay_menus").innerHTML = configData;
		}
		initReplayPage();
		b_INIT_REPLAY_PAGE=1;
		ApplyXmlLang("replay.xml", m_szLanguage);
		changeStorage();
	}
	HEADER_MENUS_ITEM	= a;
	manualResize();
}
//PTZ控制 暂未使用
function goPtzCtrl(a){
	if(HEADER_MENUS_ITEM==2)return false;
	stopPreview();
	$("mb0").style.display="none";
	$("mb1").style.display="none";
	$("mb2").style.display="none";
	$("mb").style.display="";
	//$("set_fm").src="";
	RIGHT_SIDE			= 250;
	HEADER_MENUS_ITEM	= a;
	manualResize();
}
//参数设置
function goSysConfig(a){
	if(HEADER_MENUS_ITEM==3)return false;
	stopPreview();
	$("mb").style.display="none";
	$("mb1").style.display="none";
	$("mb2").style.display="none";
	$("mb0").style.display=""; 
	changeNavStyle($("b_config"));
	//$("set_fm").src="";
	if(!b_INIT_MENUS_SETTING){
//加载设备功能菜单
		g_xmlhttp.open("get", "html/body_menus_setting.html", false);
		SafeHttpSend(g_xmlhttp, null);
//     g_xmlhttp.onreadystatechange = function()
		{
			if (g_xmlhttp.readyState != 4){return;}
			
			var configData;
			configData = g_xmlhttp.responseText;
			document.getElementById("mb0_setting_bar").innerHTML = configData;
		}
		
		
//加载子菜单 by zhouyan
		g_xmlhttp.open("get", "html/body_menus_setting_subbar.html", false);
		SafeHttpSend(g_xmlhttp, null);
		if (g_xmlhttp.readyState != 4){return;}
		
		var subConfigData;
		subConfigData = g_xmlhttp.responseText;
		document.getElementById("mb0_setting_subbar").innerHTML = subConfigData;
//加载脚本
		if(document.getElementById("setting_bar_js") == null){
			g_xmlhttp.open("get", "jsmain/set.js", false);
			SafeHttpSend(g_xmlhttp, null);
//       	 g_xmlhttp.onreadystatechange = function()
        	{
				if (g_xmlhttp.readyState == 4){
					DynAppendJS("setting_bar_js", g_xmlhttp.responseText);
					initConfigPage(1);
				}
			}
		}else{
			initConfigPage(1);
		}
		b_INIT_MENUS_SETTING=1;
		ApplyXmlLang("setting.xml", m_szLanguage);
	}else{
		goDFPage("local", "la_local");
	}
//加载设备功能菜单 结束
	HEADER_MENUS_ITEM	= a;
	manualResize();
}
//报警
function goAlarm(a){
	if(HEADER_MENUS_ITEM==4)return false;
	stopPreview();
	$("mb").style.display="none";
	$("mb0").style.display="none";
	$("mb1").style.display="none";
	$("mb2").style.display="";
	changeNavStyle($("b_alarm"));
	$("d_alarmtip").style.display="none";
	$("alarm_fm").src="alarmlog.asp";
	HEADER_MENUS_ITEM	= a;
	manualResize();
}
//退出
function goLogout(a){
	stopViewLogout();
	$("mb").style.display="";
	$("mb0").style.display="none";
	$("mb1").style.display="none";
	$("mb2").style.display="none";
	//changeNavStyle($("b_quit"));
	HEADER_MENUS_ITEM	= a;
	manualResize();
	$("password").value="";$("password").focus();
}
function changeNavStyle(a){
	$("nav").getElements("a").each(function(a){a.className="nav_btn"});
	a.className = "nav_btn1";
	//alert(a.id);
}
function manualResize(){
	b_INIT_ONRESIZE =!1;
	resize();
}
function resize(){
	//if (onReTOS < 3 && b_INIT_ONRESIZE) {
	//	if (timeProcess_RESIZE) clearInterval(timeProcess_RESIZE);
	//	timeProcess_RESIZE = setTimeout("resize();", (3 - onReTOS) * 1000);
	//	return false
	//};
	var a, b;
	var myos = appInfo();
	a = document.documentElement.clientWidth;
	b = document.documentElement.clientHeight;
	//b = document.body.clientHeight;
	
	if(a < 1000) a = 1000;
	if(b < 600) b = 600;
	//alert("a. manualResize(); a=" + a +" b=" + b +" RIGHT_SIDE=" + RIGHT_SIDE +" videoH-width=" + $("videoH").getStyle("width") +" videoH-height=" + $("videoH").getStyle("height"));
	switch(HEADER_MENUS_ITEM){
		case 0:case 2:	//实时预览 PTZ
			if(myos.version==6){a = a - 17;b = b - 17;}
			if(bORIGINAL || bSCALE) return false;
			$("video1").setStyle("paddingTop", "0px");
			$("mb").setStyle("min-width", a + "px");
			//$("mb").setStyle("width", a + "px");
			//$("mb").setStyle("width", a + "px");
			$("mb").setStyle("height", (b-56) + "px");
			$("videoH").setStyle("min-width", a + "px");
			//$("videoH").setStyle("width", a + "px");
			$("videoH").setStyle("height", (b-56) + "px");
			$("videoCon").setStyle("width", "100%");
			$("videoCon").setStyle("height", "100%");
			if(RIGHT_SIDE){
				a = a - RIGHT_SIDE;
			}
			$("video1").setStyle("width", (a-7) + "px");
			$("video1").setStyle("height", "100%");
			$("WebCMS").style.width	= "100%";
			$("WebCMS").style.height= (b-91) + "px";
			$("videoBottom").style.width = "100%";
		break;
		case 1:	//录像回放
			$("mb1").setStyle("min-width", a + "px");
			$("mb1").setStyle("width", a + "px");
			$("mb1").setStyle("height", (b-56) + "px");
			$("revideoH").setStyle("min-width", a + "px");
			$("revideoH").setStyle("width", a + "px");
			$("revideoH").setStyle("height", "100%");
			$("review_video").setStyle("min-width", (a-240) + "px");
			$("review_video").setStyle("width", (a-240) + "px");
			$("review_video").setStyle("height", "100%");
			$("video2").setStyle("width", (a-240) + "px");	//200+30(左右空15px)
			$("video2").setStyle("height", (b-106) + "px");
			$("ReVideoX").style.width	= "100%";
			$("ReVideoX").style.height	= (b-106) + "px";
		break;
		case 3:	//设置
			if(myos.version==6){a = a - 17;b = b - 17;}
			$("mb0").setStyle("min-width", a + "px");
			$("mb0").setStyle("width", a + "px");
			$("mb0").setStyle("height", (b-56) + "px");
			// $("divSetting").setStyle("width", (a-30) + "px");
			// $("divSetting").setStyle("height", (b-78) + "px");
			$("mb0_setting").setStyle("width", (a-208) + "px");
			$("mb0_setting").setStyle("height", (b-78) + "px");
			if(myos.version==6){
				$("set_fm").setStyle("width", (a-208) + "px");
				$("set_fm").setStyle("height", (b-62) + "px");
			}
		break;
		case 4:	//报警
			$("mb2").setStyle("min-width", a + "px");
			$("mb2").setStyle("width", a + "px");
			$("mb2").setStyle("height", (b-56) + "px");
			$("alarmH").setStyle("min-width", (a-20) + "px");
			$("alarmH").setStyle("width", (a-20) + "px");
			$("alarmH").setStyle("height", (b-56) + "px");
			//$("alarm_body").setStyle("width", (a-230));	//200+30(左右空15px)
			//$("alarm_body").setStyle("height", "100%");
			$("alarm_fm").setStyle("width", (a-20) + "px");
			$("alarm_fm").setStyle("height", (b-56) + "px");
		break;
		default:	//否则显示登录
			$("main").style.display		= "none";
			$("lg_out").style.display	= "";
			$("lg_out").style.top		= "0px"
			$("lg_out").setStyle("height", (b-10) + "px");
		break;
	}
	onReTOS	= 0; b_INIT_ONRESIZE	= 1;
	clearInterval(timeProcess);
	//timeProcess = setInterval('setTimeProcess(10)', 1000);
	return  true;
}

function changeStreamSelect(selVal){
	//var selVal = jQuery("#" + selectId).val()[0];
	
	switch(selVal){
		case "6":	//局部放大
			funZoomIn(null);
		break;
		case "7":	//全屏
			funFull(null);
		case "8":	//宽高比
			funScale(null, 0);
		break;
		case "9":	//原始大小
			funOriginal(null, 0);
		break;
		case "61"://主码流
			changeStream(null, 61); initState(0);
		break;
		case "62"://辅码流
			changeStream(null, 62); initState(0);
		break;
		default://其他
		break;
	}
}

function btmShowChange(CTRL_OBJ){
	// e.stopPropagation();  
	// var floatDiv = jQuery(CTRL_OBJ).children("div.selectArea");
	// if(floatDiv.is(":visible")){
		// floatDiv.hide();
	// }
	// else{
		// floatDiv.show();
	// }
}

function btnLiveCtrl(CTRL_OBJ, CTRL_CMD){
	switch(CTRL_CMD){
		case 1:	//抓拍
			funSnap(CTRL_OBJ);
		break;
		case 2:	//录像
			funRecord(CTRL_OBJ);
		break;
		case 3:	//对讲
			funCall(CTRL_OBJ);
		break;
		case 4:	//监听
			funListen(CTRL_OBJ);
		break;
		case 5:	//报警
			funClrAlarm(CTRL_OBJ);
		break;
		case 6:	//局部放大
			funZoomIn(CTRL_OBJ);
		break;
		case 7:	//全屏
			funFull(CTRL_OBJ);
		break;
		case 8:	//宽高比
			funScale(CTRL_OBJ, 0);
		break;
		case 9:	//原始大小
			funOriginal(CTRL_OBJ, 0);
		break;
		case 51://云台控制
			funPTZCtrl(CTRL_OBJ, 0);
		break;
		case 52://图像调节
			funImageCtrl(CTRL_OBJ, 0);
		break;
		case 61://主码流
			changeStream(CTRL_OBJ, CTRL_CMD); initState(0);
		break;
		case 62://辅码流
			changeStream(CTRL_OBJ, CTRL_CMD); initState(0);
		break;
		case 101://码流控制层
			changeStreamArea(CTRL_OBJ);
		break;
		case 102://尺寸控制层			
			changeStreamArea(CTRL_OBJ);
		break;
		default://其他
			
		break;
	}	
	//alert("OBJ:" + CTRL_OBJ.id + " CMD:" + CTRL_CMD);
}
function preventM(a){Sys.ie?document.documentElement.releaseCapture():(a?a:event).preventDefault()}

