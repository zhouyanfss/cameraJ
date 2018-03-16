<html>
<head>
<title>videoLens</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT">
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./script/ajax.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/send.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/camera.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/lensex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
<script type="text/JavaScript" language="javascript" src="./js/hsvbtn.js"></script>
<style type="text/css">
<!--
.inputwidht{width:21px; height:18px;}
.lenssub{margin:0px; padding:0 0 0 21px;}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	remarkDisplay("divAlertHTML", "* " + ALERTSAVESUCCEED, 3E3, 1);
	//setCookies("SaveYes","ok",7);
	if($("btimevalue").value < 0){return false;}else{setTimeout(do_submit,0);}
}
var HZ50 = new Array(25, 50, 100, 150, 200, 250, 300, 400,  500, 1000, 2000, 4000, 6000, 8000);
var HZ60 = new Array(30, 60, 120, 180, 240, 300, 400, 500, 1000, 2000, 4000, 6000, 8000);
function chgaemaxtime(paramm){
	var devicetype 	= parseInt(getCookies("devicetype"));
	if(devicetype!=3516112) return false;
	var selindex	= $("selAEMaxTime").selectedIndex;
	var i;
	if(paramm==0){	//60HZ
		$("selAEMaxTime").length=0;
		for(i=0; i<HZ60.length; i++){
			$("selAEMaxTime").options[i] = new Option(HZ60[i],  HZ60[i]);
		}
	}else{
		$("selAEMaxTime").length=0;
		for(i=0; i<HZ50.length; i++){
			$("selAEMaxTime").options[i] = new Option(HZ50[i],  HZ50[i]);
		}
	}	
	$("selAEMaxTime").options[selindex].selected = true;
}
function ChangeTitleLanguage(){
	$("t_cbri").innerHTML	= getNodeValue('laBrightness');
	$("t_ccon").innerHTML	= getNodeValue('laContrast');
	$("t_chue").innerHTML	= getNodeValue('laHue');
	$("t_csat").innerHTML	= getNodeValue('laSaturation');
	$("t_cacu").innerHTML	= getNodeValue('laAcutance');
	$("t_cred").innerHTML	= getNodeValue('laRed');
	$("t_cblu").innerHTML	= getNodeValue('laBlue');
	$("t_cgam").innerHTML	= getNodeValue('laGamma');
	$s("t_wbred").innerHTML	= getNodeValue('laWBRed');
	$s("t_wbgre").innerHTML	= getNodeValue('laWBGreen');
	$s("t_wbblu").innerHTML	= getNodeValue('laWBBlue');
	$s("t_gclev").innerHTML	= getNodeValue('laGainValue');
	$s("t_blclev").innerHTML= getNodeValue('laBLCValue');
	$s("t_ssht").innerHTML	= getNodeValue('laSlowShutter');
	$s("t_irclev").innerHTML= getNodeValue('btnIRCFLevelvt');
	$s("t_wdrlev").innerHTML= getNodeValue('laWDRValue');
	$s("t_snrlev").innerHTML= getNodeValue('laSmartNRValue');
	$s("t_afclev").innerHTML= getNodeValue('laAntiFalseColor');
	$s("t_foclev").innerHTML= getNodeValue('laFocusLength');
	$s("t_aemax").innerHTML	= getNodeValue('laAEMaxValue');
	$s("t_autoagc").innerHTML	= getNodeValue('laAutoAGCValue');
	$s("t_irauto").innerHTML	= getNodeValue('laAutoAGCValue');
	$s("t_Iris").innerHTML		= getNodeValue('t_Iris');
	$s("t_irdetime").innerHTML	= getNodeValue('t_irdetime');
	$s("t_irdetimeuint").innerHTML	= getNodeValue('t_irdetimeuint');
}
function init(){
	ChangeLanguage('../xml/videolens.xml', m_szLanguage);
	ChangeTitleLanguage();
	initPage();
	initChannel();
	setTimeout("initvideo(0);", 320);
	attachLimit("irtime", 0, 60);
	
	$("btnSave").addEvent("click", Checkfrm);
	return true;
}
</script>
<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(0)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/videoLensCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">视频参数</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
		<ul id="show_Chan" style="padding-top:32px;">
			<li id="laChan">
		  <table id="TableChan" border="1" width="520" cellspacing="0" cellpadding="0" style="margin-bottom:12px; display:none;">
		   <tr>
			<td height="32" valign="middle">
			<div id="divChannelTitle"><LABEL id="laChannel">通道:</LABEL></div>
			<div id="divChannelOption"><img src="./images/botton/1.jpg" alt="1" name="channel1" width="26" height="21" id="channel1" style="cursor:pointer;" onClick="ChangeChannel(1,'');">
			<img src="./images/botton/2.jpg" alt="2" id="channel2" name="channel2" onClick="ChangeChannel(2,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/3.jpg" alt="3" id="channel3" name="channel3" onClick="ChangeChannel(3,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/4.jpg" alt="4" id="channel4" name="channel4" onClick="ChangeChannel(4,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/5.jpg" alt="5" id="channel5" name="channel5" onClick="ChangeChannel(5,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/6.jpg" alt="6" id="channel6" name="channel6" onClick="ChangeChannel(6,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/7.jpg" alt="7" id="channel7" name="channel7" onClick="ChangeChannel(7,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/8.jpg" alt="8" id="channel8" name="channel8" onClick="ChangeChannel(8,'');" style="cursor:pointer; display:none;">
			</div>
			<div id="divChannelSync"><input name="copysync" type="checkbox" id="copysync" value="0" onClick="checkClick('audio_frm','copysync')"></div>
			<div id="divChannelSyncTitle"><LABEL id="laChannelSync">复制到所有通道</LABEL></div>
			</td>
			</tr>
	   </table>
			</li>
		</ul>
		
		<div id="div_video" class="div_video">
		<object name="WebCMS" ID="WebCMS" width="320" height="262" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" codebase="/WebCMS.exe#Version=2,0,0,0"></object>
		</div>
        <div id="div_set" class="div_set" style="width:450px;overflow:hidden;">

			<ul id="show_Main">
				<li class="vrig" id="laMain">
<table width="512" border="0" cellspacing="0" cellpadding="0">
  <tr id="TrColorTitle">
    <td class="lenstitle" id="TdColort" onClick="lensDeployEx(1,'TdColor');"><LABEL id="laColorSet">亮色调节</LABEL></td>
  </tr>
  <tr id="TrColorTab">
    <td id="TdColor" class="lenssub" style="padding-left:0px;">
<div id="DivImages" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="setColordefault" class="setvideo" style="display:none;">
		<div id="strsdiv">
		<div id="divstandard"><input name="btnStandardDefault" type="checkbox" id="btnStandardDefault" value="0" onClick="shortcutset(0,'btnStandardDefault')" title="标准默认"><span id="sStandard"><LABEL id="laStandard">标准</LABEL></span></div>
		<div id="divcolorful"><input name="btnColorfulDefault" type="checkbox" id="btnColorfulDefault" value="0" onClick="shortcutset(1,'btnColorfulDefault')" title="鲜艳默认"><span id="sColorful"><LABEL id="laColorful">鲜艳</LABEL></span></div>
		</div>
	</div>
	<div id="divImagesItem" class="ca_set_set">
		<ul id="liImagesBri" style="display:none;">
			<li id="t_cbri" class="cs1">亮度</li>
			<li class="cs2"><a id="p_cbri" onClick="sendBTNSettingEx(1000, 1001, 11000, 0, 0, OcBri, 'v_cbri');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_cbri" class="sax"><div id="b_cbri" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_cbri">50</div></li>
		</ul>
		<ul id="liImagesCon" style="display:none;">
			<li id="t_ccon" class="cs1">对比度</li>
			<li class="cs2"><a id="p_ccon" onClick="sendBTNSettingEx(1000, 1002, 11000, 0, 0, OcCon, 'v_ccon');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_ccon" class="sax"><div id="b_ccon" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_ccon">50</div></li>
		</ul>
		<ul id="liImagesHue" style="display:none;">
			<li id="t_chue" class="cs1">色度</li>
			<li class="cs2"><a id="p_chue" onClick="sendBTNSettingEx(1000, 1003, 11000, 0, 0, OcHue, 'v_chue');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_chue" class="sax"><div id="b_chue" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_chue">50</div></li>
		</ul>
		<ul id="liImagesSat" style="display:none;">
			<li id="t_csat" class="cs1">饱和度</li>
			<li class="cs2"><a id="p_csat" onClick="sendBTNSettingEx(1000, 1004, 11000, 0, 0, OcSat, 'v_csat');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_csat" class="sax"><div id="b_csat" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_csat">50</div></li>
		</ul>
		<ul id="liImagesAcu" style="display:none;">
			<li id="t_cacu" class="cs1">锐度</li>
			<li class="cs2"><a id="p_cacu" onClick="sendBTNSettingEx(1000, 1005, 11000, 0, 0, OcAcu, 'v_cacu');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_cacu" class="sax"><div id="b_cacu" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_cacu">50</div></li>
		</ul>
		<ul id="liImagesRed" style="display:none;">
			<li id="t_cred" class="cs1">红色</li>
			<li class="cs2"><a id="p_cred" onClick="sendBTNSettingEx(1000, 1006, 11000, 0, 0, OcRed, 'v_cred');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_cred" class="sax"><div id="b_cred" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_cred">50</div></li>
		</ul>
		<ul id="liImagesBlu" style="display:none;">
			<li id="t_cblu" class="cs1">蓝色</li>
			<li class="cs2"><a id="p_cblu" onClick="sendBTNSettingEx(1000, 1008, 11000, 0, 0, OcBlu, 'v_cblu');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_cblu" class="sax"><div id="b_cblu" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_cblu">50</div></li>
		</ul>
		<ul id="liImagesGam" style="display:none;">
			<li id="t_cgam" class="cs1">Gamma</li>
			<li class="cs2"><a id="p_cgam" onClick="sendBTNSettingEx(1000, 1009, 11000, 0, 0, OcGam, 'v_cgam');"></a></li>
			<li class="cs3"><div class="wh160"><div id="g_cgam" class="sax"><div id="b_cgam" class="skx"></div></div></div></li>
			<li class="cs4"><div  id="v_cgam">50</div></li>
		</ul>
	</div>
</div>
	</td>
  </tr>
  <tr id="TrAWBTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdAWBt" class="lenstitle" onClick="lensDeployEx(2,'TdAWB');"><LABEL id="laWBTitle">白平衡(AWB)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdAWB" style="display:none" class="lenssub">
<div id="DivAWB" class="Imagescss">
	<input type="button" id="btnAWB" name="btnAWB" class="btn2" onClick="hsvctrlEx(1010, 1, 'btnAWB', 0, 0 ,0);" value="自动白平衡">
</div>
<div id="DivWBTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divWBItem" class="ca_set_set">
		<ul id="liWBRed" style="display:none;">
			<li id="t_wbred" class="cs1" onClick="sendBTNSettingEx(1000, 1011, 11000, 0, 0, OWBRed, 'v_wbred');">白平衡 红</li>
			<li class="cs3"><div class="wh160"><div id="g_wbred" class="sax"><div id="b_wbred" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbred">50</div></li>
		</ul>
		<ul id="liWBGre" style="display:none;">
			<li id="t_wbgre" class="cs1" onClick="sendBTNSettingEx(1000, 1012, 11000, 0, 0, OWBGre, 'v_wbgre');">白平衡 绿</li>
			<li class="cs3"><div class="wh160"><div id="g_wbgre" class="sax"><div id="b_wbgre" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbgre">50</div></li>
		</ul>
		<ul id="liWBBlu" style="display:none;">
			<li id="t_wbblu" class="cs1" onClick="sendBTNSettingEx(1000, 1013, 11000, 0, 0, OWBBlu, 'v_wbblu');">白平衡 蓝</li>
			<li class="cs3"><div class="wh160"><div id="g_wbblu" class="sax"><div id="b_wbblu" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbblu">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrAGCTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdAGCt" class="lenstitle" onClick="lensDeployEx(3,'TdAGC');"><LABEL id="laGainTitle">增益(AGC)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdAGC" style="display:none" class="lenssub">
<div id="DivAGC" class="Imagescss">
	<input type="button" id="btnAGC" name="btnAGC" class="btn2" onClick="hsvctrlEx(1014, 1, 'btnAGC', 0, 0 ,0);" value="手动增益">
</div>
<div id="DivAGCTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divGCItem" class="ca_set_set">
		<ul id="liGCLevel" style="display:none;">
			<li id="t_gclev" class="cs1" onClick="sendBTNSettingEx(1000, 1015, 11000, 0, 0, OGCLevel, 'v_gclev');">增益值</li>
			<li class="cs3"><div class="wh160"><div id="g_gclev" class="sax"><div id="b_gclev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_gclev">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrBLCTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdBLCt" class="lenstitle" onClick="lensDeployEx(4,'TdBLC');"><LABEL id="laBLCTitle">背光补偿(BLC)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdBLC" style="display:none" class="lenssub">
<div id="DivBLC" class="Imagescss">
		<input type="button" id="btnBLC" name="btnBLC" class="btn2" onClick="hsvctrlEx(1016, 1, 'btnBLC', 0, 0 ,0);" value="背光补偿">
</div>
<div id="DivBLCTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divBLCItem" class="ca_set_set">
		<ul id="liBLCLevel" style="display:none;">
			<li id="t_blclev" class="cs1" onClick="sendBTNSettingEx(1000, 1017, 11000, 0, 0, OBLCLevel, 'v_blclev');">补偿值</li>
			<li class="cs3"><div class="wh160"><div id="g_blclev" class="sax"><div id="b_blclev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_blclev">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrExposureTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdExpt" class="lenstitle" onClick="lensDeployEx(6,'TdExp');"><LABEL id="laExposureTitle">曝光(Exposure)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdExp" style="display:none" class="lenssub">
<div id="DivExposure" class="Imagescss">
		<input type="button" id="btnAutoExp" name="btnAutoExp" class="btn2" onClick="hsvctrlEx(1020, 1, 'btnAutoExp', 0, 0 ,0);" value="自动曝光">
</div>
	
<div id="DivExposureTab" class="Imagescss">
	<div id="setvideoAutoExp" class="setvideo" style="display:none;">
		<select name="selAutoExposure" id="selAutoExposure" style="width:230px;" onChange="chghsvEx(1000,1020,this.value);">
			<option id="opAutoExposure1" value="1">自动曝光</option>
			<option id="opAutoExposure2" value="2">自动曝光+彩转黑+高灵敏度</option>
			<option id="opAutoExposure3" value="3">自动曝光+彩转黑+中灵敏度</option>
			<option id="opAutoExposure4" value="4">自动曝光带慢快门</option>
			<option id="opAutoExposure5" value="5">自动曝光带慢快门+彩转黑+高灵敏度</option>
			<option id="opAutoExposure6" value="6">自动曝光带慢快门+彩转黑+中灵敏度</option>
			<option id="opAutoExposure7" value="7">自动曝光带慢快门+彩转黑+低灵敏度</option>
	  </select>
	</div>
	<div id="setvideoExp" class="setvideo" style="display:none;">
		<select name="selExposureTime" id="selExposureTime" style="width:230px;" onChange="chghsvEx(1000,1021,this.value);">
		  <option value="16">F1.6</option>
		  <option value="22">F2.2</option>
		  <option value="36">F3.6</option>
		  <option value="44">F4.4</option>
		  <option value="64">F6.4</option>
		  <option value="88">F8.8</option>
		  <option value="120">F12.0</option>
		  <option value="170">F17.0</option>
		  <option value="240">F24.0</option>
		  <option value="340">F34.0</option>
	  </select>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrShutterTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdShuttert" class="lenstitle" onClick="lensDeployEx(7,'TdShutter');"><LABEL id="laShutterTitle">快门(Shutter)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdShutter" style="display:none" class="lenssub">
<div id="DivShutter" class="Imagescss">
	<div id="setvideoShutter" class="setvideo" style="display:none;">
		<input type="button" id="btnAutoShutter" name="btnAutoShutter" class="btn2" onClick="hsvctrlEx(1022, 1, 'btnAutoShutter', 0, 0 ,0);" value="自动快门">
	</div>
	<div id="setvideoAutoShutter" class="setvideo" style="display:none;">
		<select name="selShutterSpeed" id="selShutterSpeed" style="width:230px;" onChange="chghsvEx(1000,1023,this.value);">
		  <option value="1">1/1</option>
		  <option value="2">1/2</option>
		  <option value="4">1/4</option>
		  <option value="8">1/8</option>
		  <option value="15">1/15</option>
		  <option value="25">1/25</option>
		  <option value="30">1/30</option>
		  <option value="50">1/50</option>
		  <option value="60">1/60</option>
		  <option value="100">1/100</option>
		  <option value="120">1/120</option>
		  <option value="180">1/180</option>
		  <option value="250">1/250</option>
		  <option value="500">1/500</option>
		  <option value="1000">1/1000</option>
		  <option value="2000">1/2000</option>
		  <option value="4000">1/4000</option>
		  <option value="10000">1/10000</option>
	  </select>
	</div>
	
	<div id="setvideoSlowShutter" class="setvideo" style="display:none;">
		<input type="button" id="btnSlowShutter" name="btnSlowShutter" class="btn2" onClick="hsvctrlEx(1025, 1, 'btnSlowShutter', 0, 0 ,0);" value="慢快门">
	</div>	
	<div id="divSSHTItem" class="ca_set_set">
		<ul id="liSSHTLevel" style="display:none;">
			<li id="t_ssht" class="cs1" onClick="sendBTNSettingEx(1000, 1026, 11000, 0, 0, OSSHT, 'v_ssht');">慢快门调节</li>
			<li class="cs3"><div class="wh160"><div id="g_ssht" class="sax"><div id="b_ssht" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_ssht">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrIRTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdIRt" class="lenstitle" onClick="lensDeployEx(8,'TdIR');"><LABEL id="laIRTitle">红外(IR)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdIR" style="display:none" class="lenssub">
<div id="DivImages" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="setvideoIRCFMode" class="setvideo" style="display:none;">
		<input type="button" id="btnIRCFMode0" name="btnIRCFMode0" class="btn2" style="width:72px;" onClick="hsvctrlEx(1028, 2, 'btnIRCFMode0', 0, 0 ,0);" value="彩色">
		<input type="button" id="btnIRCFMode1" name="btnIRCFMode1" class="btn1" style="width:72px;" onClick="hsvctrlEx(1028, 2, 'btnIRCFMode1', 1, 0 ,0);" value="黑白">
	</div>
	<div id="setvideoIRLightType" class="setvideo" style="display:none;">
		<input type="button" id="btnIRLightType0" name="btnIRLightType0" class="btn2" style="width:72px;" onClick="hsvctrlEx(1029, 3, 'btnIRLightType0', 0, 0 ,0);" value="正常光">
		<input type="button" id="btnIRLightType1" name="btnIRLightType1" class="btn1" style="width:72px;" onClick="hsvctrlEx(1029, 3, 'btnIRLightType1', 1, 0 ,0);" value=" 850mm">
		<input type="button" id="btnIRLightType2" name="btnIRLightType2" class="btn1" style="width:72px;" onClick="hsvctrlEx(1029, 3, 'btnIRLightType2', 2, 0 ,0);" value=" 950mm">
	</div>
<!--------------------------------//-->
	<div id="divIRCItem" class="ca_set_set">
		<ul id="liIRCLevel" style="display:none;">
			<li id="t_irclev" class="cs1"><input name="btnIRCFLevelvt" type="button" class="btn1" id="btnIRCFLevelvt" value="灵敏度" alt="灵敏度 默认值" align="right" style="width:75px;" onClick="btnSettingEx(1000,1047,11000, 0, 0,'myIRCFSlider','strIRCFLevel');"></li>
			<li class="cs3"><div class="wh160"><div id="g_irclev" class="sax"><div id="b_irclev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_irclev">50</div></li>
		</ul>
	</div>
<!--------------------------------//-->
	<div id="setvideoIRTimeControl" class="setvideo" style="display:none;">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#9EAFC3">
	  <tr>
		<td width="25%" height="28" bgcolor="#F5F5F5" id="tdcktime"><LABEL id="laTimeFirst">时间优先</LABEL></td>
		<td width="25%" bgcolor="#F5F5F5" id="tdtoday"><LABEL id="laToDay">转白天</LABEL></td>
		<td width="25%" bgcolor="#F5F5F5" id="tdtonight"><LABEL id="laToNight">转夜晚</LABEL></td>
		<td width="25%" bgcolor="#F5F5F5" id="tdirlink"><LABEL id="laIRLinkage">光敏联动</LABEL></td>
	  </tr>
	  <tr>
		<td height="28" bgcolor="#F5F5F5"><input name="cktime" type="checkbox" id="cktime" onClick="checkClick('vcfg_frm','cktime')" value="0"/></td>
		<td bgcolor="#F5F5F5"><input name="todayh" type="text" class="inputwidht text" id="todayh" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />:<input name="todaym" type="text" class="inputwidht text" id="todaym" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		<td bgcolor="#F5F5F5"><input name="tonighth" type="text" class="inputwidht text" id="tonighth" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />:<input name="tonightm" type="text" class="inputwidht text" id="tonightm" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		<td bgcolor="#F5F5F5"><input name="ckirlink" type="checkbox" id="ckirlink" onClick="checkClick('vcfg_frm','ckirlink')" value="0"/></td>
	  </tr>
	  <tr id="TrTimeShutter" style="display:none;">
		<td height="28" align="right" bgcolor="#F5F5F5" id="tdshutterdn"><LABEL id="laShutterValue">快门值:</LABEL></td>
		<td bgcolor="#F5F5F5">
		<select name="todayshutter" id="todayshutter" style="width:76px;">
		  <option value="1">1/1</option>
		  <option value="2">1/2</option>
		  <option value="4">1/4</option>
		  <option value="8">1/8</option>
		  <option value="15">1/15</option>
		  <option value="25">1/25</option>
		  <option value="30">1/30</option>
		  <option value="50">1/50</option>
		  <option value="60">1/60</option>
		  <option value="100">1/100</option>
		  <option value="120">1/120</option>
		  <option value="180">1/180</option>
		  <option value="250">1/250</option>
		  <option value="500">1/500</option>
		  <option value="1000">1/1000</option>
		  <option value="2000">1/2000</option>
		  <option value="4000">1/4000</option>
		  <option value="10000">1/10000</option>
		</select>
	  	</td>
		<td bgcolor="#F5F5F5">
		<select name="tonightshutter" id="tonightshutter" style="width:76px;">
		  <option value="1">1/1</option>
		  <option value="2">1/2</option>
		  <option value="4">1/4</option>
		  <option value="8">1/8</option>
		  <option value="15">1/15</option>
		  <option value="25">1/25</option>
		  <option value="30">1/30</option>
		  <option value="50">1/50</option>
		  <option value="60">1/60</option>
		  <option value="100">1/100</option>
		  <option value="120">1/120</option>
		  <option value="180">1/180</option>
		  <option value="250">1/250</option>
		  <option value="500">1/500</option>
		  <option value="1000">1/1000</option>
		  <option value="2000">1/2000</option>
		  <option value="4000">1/4000</option>
		  <option value="10000">1/10000</option>
		</select>
		</td>
		<td bgcolor="#F5F5F5">&nbsp;</td>
	  </tr>
	</table>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrOtherTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdOthert" class="lenstitle" onClick="lensDeployEx(9,'TdOther');"><LABEL id="laOtherTitle">其他(Other)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdOther" style="display:none" class="lenssub">
<div id="DivImages" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="setvideoMirrorFlip" class="setvideo" style="display:none;">
		<input type="button" id="btnMirror" name="btnMirror" class="btn2" style="width:72px;" onClick="hsvctrlEx(1031, 1, 'btnMirror', 0, 0 ,0);" value="镜像">
		<input type="button" id="btnFlip" name="btnFlip" class="btn1" style="width:72px;" onClick="hsvctrlEx(1032, 1, 'btnFlip', 1, 0 ,0);" value=" 翻转">
		<input type="button" id="btnAutoFlip" name="btnAutoFlip" class="btn1" style="width:72px;" onClick="hsvctrlEx(1033, 1, 'btnAutoFlip', 2, 0 ,0);" value=" 自动翻转">
	</div>
	<div id="setvideoPwdFreq1" class="setvideo" style="display:none;">
		<input type="button" id="btnPwdFreq0" name="btnPwdFreq0" class="btn2" style="width:72px;" onClick="hsvctrlEx(1034, 2, 'btnPwdFreq0', 0, 0 ,0);chgaemaxtime(0);" value="60HZ">
		<input type="button" id="btnPwdFreq1" name="btnPwdFreq1" class="btn1" style="width:72px;" onClick="hsvctrlEx(1034, 2, 'btnPwdFreq1', 1, 0 ,0);chgaemaxtime(1);" value="50HZ">
	</div>
	<div id="setvideoPwdFreq2" class="setvideo" style="display:none;">
		<input type="button" id="btnPwdFreq2" name="btnPwdFreq2" class="btn2" style="width:72px;" onClick="hsvctrlEx(1035, 3, 'btnPwdFreq2', 0, 0 ,0);" value="60HZ">
		<input type="button" id="btnPwdFreq3" name="btnPwdFreq3" class="btn1" style="width:72px;" onClick="hsvctrlEx(1035, 3, 'btnPwdFreq3', 1, 0 ,0);" value=" 50HZ">
		<input type="button" id="btnPwdFreq4" name="btnPwdFreq4" class="btn1" style="width:72px; display:none;" onClick="hsvctrlEx(1035, 3, 'btnPwdFreq4', 2, 0 ,0);" value=" 户外">
	</div>
	<div id="setvideoCTB" class="setvideo" style="display:none;">
		<input type="button" id="btnCTB" name="btnCTB" class="btn1" onClick="hsvctrlEx(1036, 1, 'btnCTB', 1, 0 ,0);" value="彩转黑">
	</div>
	
	<div id="setvideoWDR" class="setvideo" style="display:none;">
		<input type="button" id="btnWDR" name="btnWDR" class="btn2" onClick="hsvctrlEx(1037, 1, 'btnWDR', 0, 0 ,0);" value="宽动态">
	</div>	
<!--------------------------------//-->
	<div id="divWDRItem" class="ca_set_set">
		<ul id="liWDRLevel" style="display:none;">
			<li id="t_wdrlev" class="cs1" onClick="sendBTNSettingEx(1000, 1038, 11000, 0, 0, OWDRLev, 'v_wdrlev');">宽动态调节</li>
			<li class="cs3"><div class="wh160"><div id="g_wdrlev" class="sax"><div id="b_wdrlev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wdrlev">50</div></li>
		</ul>
	</div>

	<div id="setvideoWDRTab2" class="setvideo" style="display:none;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="110" align="right" valign="middle"><input name="btnWDR1" type="button" class="btn1" id="btnWDR1" style="width:76px; " onClick="hsvctrlEx(1038, 3, 'btnWDR1', 1, 1 ,0);" value="宽动态-低"></td>
		  <td width="120" align="center" valign="middle"><input name="btnWDR2" type="button" class="btn1" id="btnWDR2" style="width:96px;" onClick="hsvctrlEx(1038, 3, 'btnWDR2', 2, 2 ,0);" value="宽动态-中"></td>
		  <td width="110"><input name="btnWDR3" type="button" class="btn1" id="btnWDR3" style="width:76px;" onClick="hsvctrlEx(1038, 3, 'btnWDR3', 3, 3 ,0);" value="宽动态-高"></td>
		</tr>
	  </table>
	</div>
	
	<div id="setvideoLowLightTitle" class="setvideo" style="display:none;">
		<LABEL id="laAutoFocusMode">低照度点光源环境自动聚焦功能优化开关</LABEL>
	</div>
	<div id="setvideoLowLight" class="setvideo" style="display:none;">
		<select name="selLowLight" id="selLowLight" style="width:230px;" onChange="chghsvEx(1000,1039,this.value);">
		<option id="opAutoFocusMode1" value="1">默认AF</option>
		<option id="opAutoFocusMode2" value="2">低照度AF优化开启</option>
		<option id="opAutoFocusMode3" value="3">低照度点光源AF优化开启</option>
	  </select>
	</div>
	
	<div id="setvideoImageMode" class="setvideo" style="display:none;">
		<input type="button" id="btnImageMode0" name="btnImageMode0" class="btn2" onClick="hsvctrlEx(1040, 2, 'btnImageMode0', 0, 0 ,0);" value="图像模式 1">
		<input type="button" id="btnImageMode1" name="btnImageMode1" class="btn1" onClick="hsvctrlEx(1040, 2, 'btnImageMode1', 1, 0 ,0);" value="图像模式 2">
	</div>
	<div id="setvideoLSC" class="setvideo" style="display:none;">
		<input type="button" id="btnLSC" name="btnLSC" class="btn1" onClick="hsvctrlEx(1048, 1, 'btnLSC', 0, 0 ,0);" value="镜头矫正">
	</div>
	<div id="setvideo2DNR" class="setvideo" style="display:none;">
		<input type="button" id="btn2DNR" name="btn2DNR" class="btn1" onClick="hsvctrlEx(1065, 1, 'btn2DNR', 0, 0 ,0);" value="2D降噪">
	</div>
	<div id="setvideo3DNR" class="setvideo" style="display:none;">
		<input type="button" id="btn3DNR" name="btn3DNR" class="btn1" onClick="hsvctrlEx(1049, 1, 'btn3DNR', 0, 0 ,0);" value="3D降噪">
	</div>
	<div id="setvideo3DNRTab" class="setvideo" style="display:none;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td width="110" align="right" valign="middle"><input name="btn3DNR1" type="button" class="btn1" id="btn3DNR1" style="width:76px; " onClick="hsvctrlEx(1050, 3, 'btn3DNR1', 1, 1 ,0);" value="低"></td>
		  <td width="120" align="center" valign="middle"><input name="btn3DNR2" type="button" class="btn1" id="btn3DNR2" style="width:76px;" onClick="hsvctrlEx(1050, 3, 'btn3DNR2', 2, 2 ,0);" value="中"></td>
		  <td width="110"><input name="btn3DNR3" type="button" class="btn1" id="btn3DNR3" style="width:76px;" onClick="hsvctrlEx(1050, 3, 'btn3DNR3', 3, 3 ,0);" value="高"></td>
		</tr>
	  </table>
	</div>
	
	<div id="setvideoSmartNR" class="setvideo" style="display:none;">
		<input type="button" id="btnSmartNR" name="btnSmartNR" class="btn2" onClick="hsvctrlEx(1051, 1, 'btnSmartNR', 0, 0 ,0);" value="智能降噪">
	</div>
<!--------------------------------//-->
	<div id="divSNRItem" class="ca_set_set">
		<ul id="liSNRLevel" style="display:none;">
			<li id="t_snrlev" class="cs1" onClick="sendBTNSettingEx(1000, 1052, 11000, 0, 0, OSNRLev, 'v_snrlev');">阀值调节</li>
			<li class="cs3"><div class="wh160"><div id="g_snrlev" class="sax"><div id="b_snrlev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_snrlev">50</div></li>
		</ul>
	</div>
<!--20130306------------------------------//-->
	<div id="setvideoAntiFogging" class="setvideo" style="display:none;">
		<input type="button" id="btnAntiFogging" name="btnAntiFogging" class="btn2" onClick="hsvctrlEx(1059, 1, 'btnAntiFogging', 0, 0 ,0);" value="去雾">
	</div>	
<!--20130306------------------------------//-->
	<div id="divAFCItem" class="ca_set_set">
		<ul id="liAFCLevel" style="display:none;">
			<li id="t_afclev" class="cs1" style="width:96px;" onClick="sendBTNSettingEx(1000, 1060, 11000, 0, 0, OAFCLev, 'v_afclev');">去伪彩</li>
			<li class="cs3"><div class="wh160"><div id="g_afclev" class="sax"><div id="b_afclev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_afclev">50</div></li>
		</ul>
	</div>
<!--20130306------------------------------//-->
	<div id="setvideoAntiTrembling" class="setvideo" style="display:none;">
		<input type="button" id="btnAntiTrembling" name="btnAntiTrembling" class="btn2" onClick="hsvctrlEx(1061, 1, 'btnAntiTrembling', 0, 0 ,0);" value="数字防抖">
	</div>	
<!--20130306------------------------------//-->
	<div id="setvideoRotationTitle" class="setvideo" style="display:none222;">
		<LABEL id="laRotationTitle">旋转控制(修改此设置，设备立即自动重启)</LABEL>
	</div>
	<div id="setvideoRotation" class="setvideo" style="display:none;">
		<select name="selrotation" id="selrotation" style="width:230px;" onChange="chghsvEx(1000,1062,this.value);">
		  <option id="opRotation1" value="0">不旋转</option>
		  <option id="opRotation2" value="1">90度旋转</option>
		  <option id="opRotation3" value="2">270度旋转</option>
	  </select>
	</div>
<!--20130306------------------------------//-->
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  
  <tr id="TrFocusTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdFocust" class="lenstitle" onClick="lensDeployEx(11,'TdFocus');"><LABEL id="laFocusTitle">聚焦(Focus)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdFocus" style="display:none" class="lenssub">
<div id="DivFocus" class="Imagescss">
	<input type="button" id="btnFocus" name="btnFocus" class="btn2" onClick="hsvctrlEx(1043, 1, 'btnFocus', 0, 0 ,0);" value="自动聚焦">
</div>

<div id="DivFocusTab" class="Imagescss" onMouseOut="OperableEx(0);">
<!--------------------------------//-->
	<div id="divFocusItem" class="ca_set_set">
		<ul id="liFocusLevel" style="display:none;">
			<li id="t_foclev" class="cs1" onClick="sendBTNSettingEx(1000, 1044, 11000, 0, 0, OFocusLev, 'v_foclev');">焦距</li>
			<li class="cs3"><div class="wh160"><div id="g_foclev" class="sax"><div id="b_foclev" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_foclev">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  
  <tr id="TrZoomTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdZoomt" class="lenstitle" onClick="lensDeployEx(12,'TdZoom');"><LABEL id="laZoomTitle">变倍(Zoom)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdZoom" style="display:none" class="lenssub">
<div id="DivImages" class="Imagescss">
	<div id="setvideoZoomSpeed" class="setvideo" style="display:none;">
		<input type="button" id="btnZoomSpeed0" name="btnZoomSpeed0" class="btn2" style="width:72px;" onClick="hsvctrlEx(1045, 2, 'btnZoomSpeed0', 0, 0 ,0);" value="高速">
		<input type="button" id="btnZoomSpeed1" name="btnZoomSpeed1" class="btn1" style="width:72px;" onClick="hsvctrlEx(1045, 2, 'btnZoomSpeed1', 1, 0 ,0);" value="正常速度">
	</div>
	<div id="setvideoPTZSpeed" class="setvideo" style="display:none;">
		<input type="button" id="btnAutoPTZSpeed" name="btnAutoPTZSpeed" class="btn2" onClick="hsvctrlEx(1046, 1, 'btnAutoPTZSpeed', 0, 0 ,0);" value="景深比例变速">
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>

  <tr id="TrAEMaxTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdAEMaxt" class="lenstitle" onClick="lensDeployEx(13,'TdAEMax');"><LABEL id="laAEMaxShutterTitle">自动曝光快门最大值设置</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdAEMax" style="display:none" class="lenssub">
<div id="DivAEMax" class="Imagescss" style="display:none">
		<input type="button" id="btnAEMax" name="btnAEMax" class="btn2" onClick="hsvctrlEx(1053, 1, 'btnAEMax', 0, 0 ,0);" value="开关">
</div>
	
<div id="DivAEMaxTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divAEMaxItem" class="ca_set_set">
		<ul id="liAEMaxLevel" style="display:none;">
			<li id="t_aemax" class="cs1" onClick="sendBTNSettingEx(1000, 1054, 11000, 0, 0, OAEMax, 'v_aemax');">调节值</li>
			<li class="cs3"><div class="wh160"><div id="g_aemax" class="sax"><div id="b_aemax" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_aemax">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>

  <tr id="TrAEMaxTimeTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdAEMaxTimet" class="lenstitle" onClick="lensDeployEx(15,'TdAEMaxTime');"><LABEL id="laAutoMaxTimeTitle">自动曝光最大曝光时间</LABEL></td>
	  </tr>
	   <tr>
		<td height="32" class="lenssub" id="TdAEMaxTime" style="display:none">
		  <select name="selAEMaxTime" id="selAEMaxTime" style="width:230px;" onChange="chghsvEx(1000,1058,this.value);">
		  <option value="25">25</option>
		  <option value="50">50</option>
		  <option value="100">100</option>
		  <option value="150">150</option>
		  <option value="200">200</option>
		  <option value="250">250</option>
		  <option value="300">300</option>
		  <option value="400">400</option>
		  <option value="500">500</option>
		  <option value="1000">1000</option>
		  <option value="2000">2000</option>
		  <option value="4000">4000</option>
		  <option value="6000">6000</option>
		  <option value="8000">8000</option>
	  </select></td>
	  </tr>
	</table>
	</td>
  </tr>
  
  <tr id="TrAutoAGCTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdAutoAGCt" class="lenstitle" onClick="lensDeployEx(14,'TdAutoAGC');"><LABEL id="laAutoGCTitle">自动增益限制</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdAutoAGC" style="display:none" class="lenssub">
<div id="DivAutoAGC" class="Imagescss" style="display:none">
		<input type="button" id="btnAutoAGC" name="btnAutoAGC" class="btn2" onClick="hsvctrlEx(1055, 1, 'btnAutoAGC', 0, 0 ,0);" value="开关">
</div>
	
<div id="DivAutoAGCTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divAutoAGCItem" class="ca_set_set">
		<ul id="liAutoAGCLevel" style="display:none;">
			<li id="t_autoagc" class="cs1" onClick="sendBTNSettingEx(1000, 1056, 11000, 0, 0, OAutoAGC, 'v_autoagc');">调节值</li>
			<li class="cs3"><div class="wh160"><div id="g_autoagc" class="sax"><div id="b_autoagc" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_autoagc">50</div></li>
		</ul>
	</div>
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr id="TrIrisTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td id="TdIrist2" class="lenstitle" onClick="hsDeployEx(8,'TdIris');"><LABEL id="laIrisTitle">光圈镜头(Iris)</LABEL></td>
	  </tr>
	   <tr>
		<td id="TdIris" style="display:none;" class="lenssub">
<div id="DivIris" class="Imagescss" style="float:left;">
		<input type="button" id="btnIris0" name="btnIris0" class="btn1" onClick="hsvctrlEx(1041, 2, 'btnIris0', 0, 0 ,0);" value="非自动光圈">
		<input type="button" id="btnIris1" name="btnIris1" class="btn1" onClick="hsvctrlEx(1041, 2, 'btnIris1', 1, 1 ,0);" value="DC自动光圈">
</div>

<div id="DivIrisTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divIrisItem" class="ca_set_set">
		<ul id="liIris" style="display:none;">
			<li id="t_Iris" class="cs1" onClick="sendBTNSettingEx(5000, 5304, 11000, 0, 0, OIRIS, 'v_iris');">光圈电平</li>
			<li class="cs3"><div class="wh160"><div id="g_iris" class="sax"><div id="b_iris" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_iris">50</div></li>
		</ul>
	</div>
</div>
<div id="DivAutoIrisShading" class="Imagescss" style="display:none; float:left;">
	<input type="button" id="btnIris2" name="btnIris2" class="btn1" onClick="hsvctrlEx(1041, 10000, 'btnIris2', 2, 2 ,0);" value="自动光圈矫正">
</div>

<div id="DivLensShading" class="Imagescss" style="display:none;">
	<input type="button" id="btnLensShading" name="btnLensShading" class="btn1" onClick="hsvctrlEx(1057, 10000, 'btnLensShading', 0, 0 ,0);" value="镜头矫正">
</div>
		</td>
	  </tr>
	</table>
	</td>
  </tr>

  <tr id="TrIRDetectionModeTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td class="lenstitle" onClick="lensDeployEx(16,'TrIRDetectionMode');"><LABEL id="laIRDetectionModeTitle">红外检测模式</LABEL></td>
	  </tr>
	   <tr>
		<td height="32" class="lenssub" id="TrIRDetectionMode" style="display:none">
		  <select name="selIRDetectionMode" id="selIRDetectionMode" style="width:230px;" onChange="chghsvEx(1000,1063,this.value);lensDeployEx(17,'TrIRDetection');">
		  <option value="0" id="opIRDetectionMode0">视频检测</option>
		  <option value="1" id="opIRDetectionMode1">时间控制</option>
		  <option value="2" id="opIRDetectionMode2">光敏电阻检测</option>
	  	</select>
	  </td>
	  </tr>
	   <tr id="TrAutoDetection" style="display:none">
		<td height="32" valign="top" class="lenssub">
	<div id="divIRAutoItem" class="ca_set_set">
		<ul id="liIRAutoLevel" style="display:none;">
			<li id="t_irauto" class="cs1" onClick="sendBTNSettingEx(1000, 1047, 11000, 0, 0, OIRAuto, 'v_irauto');">灵敏度</li>
			<li class="cs3"><div class="wh160"><div id="g_irauto" class="sax"><div id="b_irauto" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_irauto">50</div></li>
		</ul>
	</div>
		</td>
	  </tr>
	   <tr id="TrTimeDetection" style="display:none">
		<td height="56" valign="top" class="lenssub">
	 <table width="240" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
	  <tr>
		<td width="120" height="21" bgcolor="#D6D5D5" id="tdtoday"><LABEL id="laIRToDay">转白天</LABEL></td>
		<td width="120" bgcolor="#D6D5D5" id="tdtonight"><LABEL id="laIRToNight">转夜晚</LABEL></td>
		</tr>
	  <tr>
		<td height="21" bgcolor="#D6D5D5" class="timesub"><input name="irtodayh" type="text" class="inputwidht text" id="irtodayh" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		 : <input name="irtodaym" type="text" class="inputwidht text" id="irtodaym" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		 : <input name="irtodays" type="text" class="inputwidht text" id="irtodays" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		<td bgcolor="#D6D5D5" class="timesub"><input name="irtonighth" type="text" class="inputwidht text" id="irtonighth" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		: <input name="irtonightm" type="text" class="inputwidht text" id="irtonightm" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		 : <input name="irtonights" type="text" class="inputwidht text" id="irtonights" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		</tr>
	</table>
	  </td>
	  </tr>
	   <tr id="TrIRDetection" style="display:none">
		<td height="32" valign="top" class="lenssub">
		<ul id="liIRDetection"><li>
		  <select name="selIRDetection" id="selIRDetection" style="width:230px;" onChange="chghsvEx(1000,1064,this.value);">
		  <option value="0" id="opIRDetection0">低电平有效</option>
		  <option value="1" id="opIRDetection1">高电平有效</option>
		  <option value="2" id="opIRDetection2">自动检测</option>
	  	</select></li>
		</ul>
		<ul id="liIRDeteTime">
			<li id="t_irdetime" class="cs1" style="width:80px;text-align:right;">转换时间</li>
			<li class="cs3"><input name="irtime" type="text" style="width:130px;" class="text" id="irtime" value="2" maxlength="3" /></li>
			<li id="t_irdetimeuint" class="cs1" style="width:12px;">秒</li>
		</ul>
		</td>
	  </tr>
	</table>
	</td>
  </tr>
  
  <tr id="TrIRIOTable" style="display:none;">
    <td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td class="lenstitle" onClick="lensDeployEx(18,'TrIRIOMode');"><LABEL id="laIRIOTitle">红外机器输出控制</LABEL></td>
	  </tr>
	   <tr id="TrIRIOMode" style="display:none">
		<td height="32" class="lenssub">
		<div id="divIRIOICR" class="Imagescss" style="display:none; float:left;">
			<div class="divSlidert"><LABEL id="laIRIOICR">ICR控制</LABEL></div>
			<div class="divSlider" style="width:210px;">
			<select name="selIRIOICR" id="selIRIOICR" style="width:180px;" onChange="chghsvEx(1000,1066,this.value);">
			  <option value="0" id="opIRIOICR0">低电平有效</option>
			  <option value="1" id="opIRIOICR1">高电平有效</option>
			</select>
			</div>
		</div>
		<div id="divIRIOIR" class="Imagescss" style="display:none; float:left;">
			<div class="divSlidert"><LABEL id="laIRIOIR">红外灯控制</LABEL></div>
			<div class="divSlider" style="width:210px;">
			<select name="selIRIOIR" id="selIRIOIR" style="width:180px;" onChange="chghsvEx(1000,1067,this.value);">
			  <option value="0" id="opIRIOIR0">低电平有效</option>
			  <option value="1" id="opIRIOIR1">高电平有效</option>
			</select>
			</div>
		</div>
	  </td>
	  </tr>
	</table>
	</td>
  </tr>

</table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div id="StrNotice" class="divnotice">
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice">点击对应的图标或标题,设置默认值.</LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input type="hidden" value="50" name="vBrightness" 	id="vBrightness">
<input type="hidden" value="-1" name="vHue" 		id="vHue">
<input type="hidden" value="51" name="vContrast" 	id="vContrast">
<input type="hidden" value="-1" name="vSaturation" 	id="vSaturation">
<input type="hidden" value="-1" name="vSharpness" 	id="vSharpness">
<input type="hidden" value="-1" name="vRed" 		id="vRed">
<input type="hidden" value="-1" name="vBlue" 		id="vBlue">
<input type="hidden" value="-1" name="vGamma" 		id="vGamma">
<input type="hidden" value="-1" name="vAutoAWB" 	id="vAutoAWB">
<input type="hidden" value="-1" name="vAWBRed" 		id="vAWBRed">
<input type="hidden" value="-1" name="vAWBGreen" 	id="vAWBGreen">
<input type="hidden" value="-1" name="vAWBBlue" 	id="vAWBBlue">
<input type="hidden" value="-1" name="vAutoAGC" 	id="vAutoAGC">
<input type="hidden" value="-1" name="vAGCLevel" 	id="vAGCLevel">
<input type="hidden" value="-1" name="vAutoBLC" 	id="vAutoBLC">
<input type="hidden" value="-1" name="vBLCLevel" 	id="vBLCLevel">
<input type="hidden" value="-1" name="vAutoShutter" id="vAutoShutter">
<input type="hidden" value="-1" name="vSlowShutter" id="vSlowShutter">
<input type="hidden" value="-1" name="vSlowShutterLevel" id="vSlowShutterLevel">
<input type="hidden" value="-1" name="vIRCFMode" 	id="vIRCFMode">
<input type="hidden" value="-1" name="vIRLightType" id="vIRLightType">
<input type="hidden" value="-1" name="vMirror" 		id="vMirror">
<input type="hidden" value="-1" name="vFlip" 		id="vFlip">
<input type="hidden" value="-1" name="vAutoFlip" 	id="vAutoFlip">
<input type="hidden" value="-1" name="vPwdFreq1" 	id="vPwdFreq1">
<input type="hidden" value="-1" name="vPwdFreq2" 	id="vPwdFreq2">
<input type="hidden" value="-1" name="vCTB" 		id="vCTB">
<input type="hidden" value="-1" name="vWDR" 		id="vWDR">
<input type="hidden" value="-1" name="vWDRLevel" 	id="vWDRLevel">
<input type="hidden" value="-1" name="vWDRLevel2" 	id="vWDRLevel2">
<input type="hidden" value="-1" name="vImageMode" 	id="vImageMode">
<input type="hidden" value="-1" name="vAutoFocus" 	id="vAutoFocus">
<input type="hidden" value="-1" name="vFocusLevel" 	id="vFocusLevel">
<input type="hidden" value="-1" name="vZoomSpeed" 	id="vZoomSpeed">
<input type="hidden" value="-1" name="vAutoPTZSpeed" id="vAutoPTZSpeed">

<input type="hidden" value="-1" name="vAutoExposure" id="vAutoExposure">
<input type="hidden" value="-1" name="vExposureTime" id="vExposureTime">
<input type="hidden" value="-1" name="vShutterSpeed" id="vShutterSpeed">
<input type="hidden" value="-1" name="vLowLight" 	 id="vLowLight">

<input type="hidden" value="-1" name="vIRCFLevel" 	id="vIRCFLevel">

<input type="hidden" value="-1" name="vLSC" 	id="vLSC">
<input type="hidden" value="-1" name="v2DNR" 	id="v2DNR">
<input type="hidden" value="-1" name="v3DNR" 	id="v3DNR">
<input type="hidden" value="-1" name="v3DNRLevel" 	id="v3DNRLevel">
<input type="hidden" value="-1" name="vSmartNR" 	id="vSmartNR">
<input type="hidden" value="-1" name="vSmartNRLevel" 	id="vSmartNRLevel">

<input type="hidden" value="-1"  name="vmaximumae" 	id="vmaximumae">
<input type="hidden" value="-1" name="maximumae" 	id="maximumae">
<input type="hidden" value="-1"  name="vmaximumagc" id="vmaximumagc">
<input type="hidden" value="-1" name="maximumagc" 	id="maximumagc">

<input type="hidden" value="-1" name="vmaxaetime" 	id="vmaxaetime">

<input type="hidden" value="-1"  name="vantifogging"  	id="vantifogging">
<input type="hidden" value="-1"  name="vantifalsecolor"	id="vantifalsecolor">
<input type="hidden" value="-1"  name="vantitrembling"  id="vantitrembling">
<input type="hidden" value="-1"  name="vrotation"  		id="vrotation">

<input type="hidden" value="-1"  name="virdetectionmode"  	id="virdetectionmode">
<input type="hidden" value="-1"  name="vautodetection"  	id="vautodetection">
<input type="hidden" value="-1"  name="vtimedetection"  		id="vtimedetection">
<input type="hidden" value="-1"  name="virdetection"  		id="virdetection">
<input type="hidden" value="-1"  name="virio"  				id="virio">
<input type="hidden" value="-1"  name="virioicr"  			id="virioicr">
<input type="hidden" value="-1"  name="virioir"  			id="virioir">

<input type="hidden" value="-1"  name="vAutoIris" 		id="vAutoIris">
<input type="hidden" value="-1"  name="vIrisLevel" 		id="vIrisLevel">
<input type="hidden" value="-1"  name="vautoirisshading" id="vautoirisshading">
<input type="hidden" value="-1"  name="vlensshading" 	id="vlensshading">

<input name="hstype" type="hidden" id="hstype" value="0">
<input type="hidden" value="11"  name="status13" 	id="status13">
<input type="hidden" value="-1"  name="btimevalue" 	id="btimevalue">
<input type="hidden" value="-1"  name="btimeshutter" 	id="btimeshutter">
</form>
<%outVideoLensCfgEx();%>
</body>
</html>
