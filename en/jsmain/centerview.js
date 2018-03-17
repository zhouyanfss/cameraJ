// JavaScript Document
//window.addEvent("domready",function(){})
window.onload=function(){initPage();return;}
var HEADER_MENUS_ITEM=110;
var b_INIT_MENUS_SETTING=!1, b_INIT_ONRESIZE=!1;
var timeProcess_RESIZE;
var Sys={},ua=navigator.userAgent.toLowerCase(),s;
(s=ua.match(/msie ([\d.]+)/))?Sys.ie=s[1]:(s=ua.match(/firefox\/([\d.]+)/))?Sys.firefox=s[1]:(s=ua.match(/chrome\/([\d.]+)/))?Sys.chrome=s[1]:(s=ua.match(/opera.([\d.]+)/))?Sys.opera=s[1]:(s=ua.match(/version\/([\d.]+).*safari/))&&(Sys.safari=s[1]);

function initPage(){
	try{
		parent.moveTo(0,0);
		parent.resizeTo(screen.width,screen.height-30);
		parent.focus();
	}catch(e){}
	initLanguage();
	initMainPage();
	reAutoFullWH();
	initMenus();
	return true;

}
function initLanguage(){
	var nlan = parseInt($("vlanguage").value);
	if(isNaN(nlan)){
		var syslan	= navigator.browserLanguage.toLowerCase();//得到浏览器所用的语言
		if(syslan.indexOf("zh-cn")>-1){lanset = 1;}else{lanset = 0;}
	}else{lanset = nlan;}
	if(lanset == 1){m_szLanguage = 'cn';}else{m_szLanguage = 'en';} setCookies("nLANGUAGE", lanset, 7);
	ApplyXmlLang("login.xml", m_szLanguage);
	m_xmlDoc = null;
	getXMLHandler("./xml/htmlalert.xml", m_szLanguage);	//加载语言xml
	getJsAlertText();
	return true;
}
function initMainPage(){
	$("main").style.display		= "";
	$("main").style.top			= "0px";
	$("mb0").style.display="";
	if(!b_INIT_MENUS_SETTING){
//加载设备功能菜单
		g_xmlhttp.open("get", "html/body_menus_setting.html", false);
		SafeHttpSend(g_xmlhttp, null);
//     g_xmlhttp.onreadystatechange = function()
		{
			if (g_xmlhttp.readyState != 4){
				return;
			}
			
			var configData;
			configData = g_xmlhttp.responseText;
			document.getElementById("mb0_setting_bar").innerHTML = configData;
		}
//加载脚本
		if(document.getElementById("setting_bar_js") == null){
			g_xmlhttp.open("get", "jsmain/set.js", false);
			SafeHttpSend(g_xmlhttp, null);
//       	 g_xmlhttp.onreadystatechange = function()
        	{
				if (g_xmlhttp.readyState == 4){
					DynAppendJS("setting_bar_js", g_xmlhttp.responseText);
					initConfigPage(0);
				}
			}
		}else{
			initConfigPage(0);
		}
		b_INIT_MENUS_SETTING=1;
		ApplyXmlLang("setting.xml", m_szLanguage);
	}
//加载设备功能菜单 结束

	return true;
}
function reAutoFullWH(){
	var a, b;
	a = document.documentElement.clientWidth;
	b = document.documentElement.clientHeight;
	if(a < 1000) a = 1000;
	if(b < 600) b = 600;
	$("mb0").setStyle("width", a);
	$("mb0").setStyle("height", (b-20));
	//$("divSetting").setStyle("width", (a-20));
	//$("divSetting").setStyle("height", (b-78));
	$("mb0_setting").setStyle("width", (a-207));
	$("mb0_setting").setStyle("height", "100%");
	return  true;
}
function initMenus(){
	var CMDVALUE = parseInt($("devicetype").value);
	setCookies("pageUname", $("uname").value, 7);
	setCookies("pagePassword", 	$("passwd").value, 7);
	setCookies("pageURL", $("url").value, 7);	
	setCookies("pagePort", $("port").value, 1);
	setCookies("intSDRecord", $("nstorage").value, 7);
	setCookies("intChannel", $("nchannel").value, 7);	//通道数
	setCookies("alarmoutputcount", $("noutput").value,1);	//报警输入路数
	setCookies("nUserLevel", $("nlevel").value,1);		//登录用户权限
	setCookies("devicetype", $("devicetype").value, 7);
	setCookies("iswifi", $("iswifi").value, 1);		//是否有探头WIFI
	switch(CMDVALUE){
//1:2路 4路DVS-0x01.2:单路DVS-0x02.3:960H-0x03.4:720P CCD-0x04.
//16:WDR-0x10.17:低端-0x11.18:中端,低照-0x12.19:高端,超低照-0x13.
//32:低照-0x20.33:低成本-0x21.49:500W-0x31.
	case 1:	case 2:	case 3:case 4:case 16:	case 17:case 18:case 19:case 32:case 33:case 49:
	break;
//34:一体机芯-0x22.80:日立110-0x50.81:日立220-0x51.82:SONY 6300-0x52.
	case 34:case 80:case 81:case 82:
	break;
	default:	//其他
	break;
	}
}

