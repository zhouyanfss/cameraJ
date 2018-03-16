// JavaScript Document
var ishasIntellent=!1;
function initConfigPage(nCMD){
	$("set").getElements("ul").each(function(a){a.style.display="none"});
	$("set").getElements("div").each(
		 function(a){
			 a.getElement("a").addEvent("click",
				function(){var b=a.getElement("ul");if(b.style.display=="none"){
					$("set").getElements("ul").each(function(a){a.style.display="none"});
					if($("set").getElement("a[class=set_1]"))$("set").getElement("a[class=set_1]").className="set_2";
					b.style.display="";this.className="set_1";
				}else b.style.display="none",this.className="set_2"}
			)
		}
	);
	$("la_local").addEvent("click",function(){clkMenuStyle(this);goFrameURL("local")});
	$("la_audio").addEvent("click",function(){clkMenuStyle(this);goFrameURL("audio")});
	$("la_videoosd").addEvent("click",function(){clkMenuStyle(this);goFrameURL("videoosd")});
	$("la_videocoding").addEvent("click",function(){clkMenuStyle(this);goFrameURL("videocoding")});
	$("la_videomask").addEvent("click",function(){clkMenuStyle(this);goFrameURL("videomask")});
	$("la_videolens").addEvent("click",function(){clkMenuStyle(this);goFrameURL("videolens")});
	$("la_picture").addEvent("click",function(){clkMenuStyle(this);goFrameURL("picture")});
	
	$("la_netbasic").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netbasic")});
	$("la_netlan").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netlan")});
	$("la_netwifi").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netwifi")});
	$("la_netpppoe").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netpppoe")});
	$("la_3gcfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("3gcfg")});
	$("la_netupnp").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netupnp")});
	$("la_netemail").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netemail")});
	$("la_netftp").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netftp")});
	$("la_netddns").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netddns")});
	$("la_netvpn").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netvpn")});
	$("la_netrtsp").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netrtsp")});
	$("la_netipemail").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netipemail")});
	$("la_netntp").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netntp")});
	$("la_netping").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netping")});
	$("la_netcenter").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netcenter")});
	$("la_netdirective").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netdirective")});
	$("la_mobilecfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("mobilecfg")});
	$("la_gpscfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("gpscfg")});
	$("la_netsnmp").addEvent("click",function(){clkMenuStyle(this);goFrameURL("netsnmp")});
	$("la_httpscfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("httpscfg")});

	$("la_storage").addEvent("click",function(){clkMenuStyle(this);goFrameURL("storage")});
	$("la_record").addEvent("click",function(){clkMenuStyle(this);goFrameURL("record")});
	$("la_snap").addEvent("click",function(){clkMenuStyle(this);goFrameURL("snap")});
	$("la_motion").addEvent("click",function(){clkMenuStyle(this);goFrameURL("motion")});
	$("la_sensor").addEvent("click",function(){clkMenuStyle(this);goFrameURL("sensor")});
	$("la_failure").addEvent("click",function(){clkMenuStyle(this);goFrameURL("failure")});
	$("la_wireless").addEvent("click",function(){clkMenuStyle(this);goFrameURL("wireless")});
	$("la_videolose").addEvent("click",function(){clkMenuStyle(this);goFrameURL("videolose")});
	$("la_terminal").addEvent("click",function(){clkMenuStyle(this);goFrameURL("terminal")});
	$("la_hscamera").addEvent("click",function(){clkMenuStyle(this);goFrameURL("hscamera")});
	$("la_hsptz").addEvent("click",function(){clkMenuStyle(this);goFrameURL("hsptz")});

	$("la_sysinfo").addEvent("click",function(){clkMenuStyle(this);goFrameURL("sysinfo")});
	$("la_systime").addEvent("click",function(){clkMenuStyle(this);goFrameURL("systime")});
	$("la_umanage").addEvent("click",function(){clkMenuStyle(this);goFrameURL("umanage")});
	$("la_sysupgrade").addEvent("click",function(){clkMenuStyle(this);goFrameURL("sysupgrade")});
	$("la_ptzupgrade").addEvent("click",function(){clkMenuStyle(this);goFrameURL("ptzupgrade")});
	$("la_sysrestore").addEvent("click",function(){clkMenuStyle(this);goFrameURL("sysrestore")});
	$("la_sysreboot").addEvent("click",function(){clkMenuStyle(this);goFrameURL("sysreboot")});
	$("la_syslog").addEvent("click",function(){clkMenuStyle(this);goFrameURL("syslog")});
	
	$("la_zxlwcfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("zxlwcfg")});
	$("la_hxhtcfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("hxhtcfg")});
	$("la_xdtxcfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("xdtxcfg")});
	$("la_accesscfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("accesscfg")});
	$("la_smcfg").addEvent("click",function(){clkMenuStyle(this);goFrameURL("smcfg")});
	$("la_gb28181").addEvent("click",function(){clkMenuStyle(this);goFrameURL("gb28181")});
	selectMenus();
	selectModel();
	selectPlatform();
	
	if(nCMD==1){goDFPage("local", "la_local");
	}else{$("m_local").style.display="none";goDFPage("system", "la_sysinfo");}
	//alert("1.initConfigPage()");
	//isEnable("show_auto_register")?$("m_autoreg").style.display="":$("m_autoreg").style.display="none";
}
function clkMenuStyle(a){
	$("set").getElement("a[class=linow]")&&$("set").getElement("a[class=linow]").removeClass("linow");a.className="linow";
}
function goFrameURL(a){
	var nRanstr	= ranString(8);
	$("set_fm").src=a+".asp?UserId="+nRanstr;
}
function goDFPage(a, b){
	$(a).style.display=="none";
	$(a).click();
	$(b).click();

}
//根据设备返回设置功能菜单
function selectMenus(){
	setDisplay("l_wireless", 	parseInt($("iswifi").value));		//探头WIFI
	setDisplay("l_netwifi", 	parseInt($("wifi").value));			//WIFI
	setDisplay("l_videolose", 	!parseInt($("ipc").value));			//DVS有 视频丢失
	setDisplay("l_3gcfg", 		parseInt($("IsCDMA").value));		//3G
	setDisplay("l_mobilecfg", 	parseInt($("mobilecfg").value));	//手机P2P监控接入 /CS模式
	setDisplay("l_gpscfg", 		parseInt($("IsGPS").value));		//GPS接入配置
	setDisplay("l_netsnmp", 	parseInt($("netsnmp").value));		//SNMP选项
	setDisplay("l_httpscfg", 	parseInt($("httpscfg").value));		//HTTPS选项
}

/*
CCD_D1_TW2864		= 0x01,	//2路 4路DVS
CCD_D1_ADV7180		= 0x02,	//单路DVS
CCD_960_AD			= 0x03,		//960H
CCD_720P_SONY692	= 0x04,		//720P CCD
CMOS_720P_OV10633	= 0x10,		//WDR
CMOS_720P_OV9712	= 0x11,		//低端
CMOS_720P_AR0130	= 0x12,		//中端，低照
CMOS_720P_IMX138	= 0x13,		//高端，超低照
CMOS_1080P_IMX122	= 0x20,		//低照
CMOS_1080P_OV2715	= 0x21,		//低成本
CMOS_1080P_MN34041	= 0x22,		//一体机芯
CMOS_500W_MT9P006	= 0x31,		//500W
//机芯
CCD_720P_SC110		= 0x50,		//日立110
CMOS_1080P_SC220	= 0x51,		//日立220
CMOS_1080P_SONY6300	= 0x52,		//SONY 6300
*/
//根据机型设置功能菜单
function selectModel(){
	var CMDVALUE 		= parseInt($("devicetype").value);
	switch(CMDVALUE){
//1:2路 4路DVS-0x01.2:单路DVS-0x02.3:960H-0x03.4:720P CCD-0x04.
//16:WDR-0x10.17:低端-0x11.18:中端,低照-0x12.19:高端,超低照-0x13.
//32:低照-0x20.33:低成本-0x21.49:500W-0x31.
	case 1:	case 2:	case 3:case 4:case 16:	case 17:case 18:case 19:case 32:case 33:case 49:
		$("m_camera").style.display 	= "none";	//球机设置
		$("l_videolens").style.display 	= "";		//视频镜头设置
		$("m_terminal").style.display 	= "";		//串口设置
		$("l_ptzupgrade").style.display = "";		//云台协议升级
	  break;
//34:一体机芯-0x22.80:日立110-0x50.81:日立220-0x51.82:SONY 6300-0x52.
	case 34:case 80:case 81:case 82:
		$("m_camera").style.display 	= "";//球机设置
		$("l_videolens").style.display 	= "none";	//视频镜头设置
		$("m_terminal").style.display 	= "none";	//串口设置
		$("l_ptzupgrade").style.display = "none";	//云台协议升级
	  break;
	default:	//其他???
		$("m_camera").style.display 	= "none";	//球机设置
		$("l_videolens").style.display 	= "";		//视频镜头设置
		$("m_terminal").style.display 	= "";		//串口设置
		$("l_ptzupgrade").style.display = "";		//云台协议升级
	  break;
	}
}
//平台功能菜单
function selectPlatform(){
	setDisplay("l_zxlwcfg", 	parseInt($("zxlwcfg").value));		//中兴力维
	setDisplay("l_hxhtcfg", 	parseInt($("hxhtcfg").value));		//互信互通
	setDisplay("l_xdtxcfg", 	parseInt($("xdtxcfg").value));		//现代通讯
	setDisplay("l_accesscfg", 	parseInt($("accesscfg").value));	//中兴通信
	setDisplay("l_smcfg", 		parseInt($("smcfg").value));		//神州数码
	setDisplay("l_gb28181", 	parseInt($("gb28181").value));		//GB28181
	$("m_extensions").getElements("li").each(function(a){if(a.style.display=="")$("m_extensions").style.display=""});
}
