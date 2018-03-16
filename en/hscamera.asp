<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>摄像机设置</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57 GMT">
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
.lenssub { padding:3 0 5 0;}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	submitFrm(0);
}
function submitFrm(num){
	
	$s("resetvalue").value = num;
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function SetHsMODE(){
  try{
	var devicetype 	= parseInt(getCookies("devicetype"));
	var i;
	if(devicetype==82){
		$s("afvalue").options[0].innerHTML	= HscamAF1;
		$s("afvalue").options[1].innerHTML	= HscamAF2;
		$s("afvalue").options[2].innerHTML	= HscamAF3;	
		$s("strircftitle").style.display	= "none";
		$s("strircfset").style.display		= "none";
		$s("TrIRcf").style.display			= "none"; 
		$s("TrIRcfset").style.display		= "none"; 
		$s("TrIRcfCH6300t").style.display	= ""; 
		$s("TrIRcfCH6300").style.display	= ""; 
		$s("TrIRTitle").style.display		= "none"; 
		$s("TrIRCtrl").style.display		= "none"; 
		$s("TdIRcf").innerHTML				= "";
		//$s("TdIRcf2").innerHTML			= "";
	}
	if(devicetype==82){
		$s("awbmode").options[0].innerHTML	= HscamAWBMODE1;
		$s("awbmode").options[1].innerHTML	= HscamAWBMODE2;
		$s("awbmode").options[2].innerHTML	= HscamAWBMODE3;
		$s("TrSlowAuto").style.display		= ""; 
		$s("TrRestrain").style.display		= ""; 
		$s("TrResolusion").style.display	= ""; 
		$s("TrBright").style.display		= ""; 
		$s("TrSlowShutter").style.display	= ""; 
	}
  }catch(e){}
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
	$s("t_blclev").innerHTML= getNodeValue('laBLCValue');
	$s("t_Res").innerHTML	= getNodeValue('laRestraintValue');
	$s("t_ircf").innerHTML	= getNodeValue('laAutoIRcfValue');
	$s("t_ircf2").innerHTML	= getNodeValue('laAutoIRcf6300Value');
	$s("t_autoagc").innerHTML= getNodeValue('laGainValue');
	$s("t_slowlev").innerHTML= getNodeValue('laSlowValue');
	$s("t_agcmax").innerHTML= getNodeValue('laMaxGainValue');
	$s("t_Iris").innerHTML	= getNodeValue('t_Iris');
}

function init(){
	ChangeLanguage('../xml/hscamera.xml', m_szLanguage);
	ChangeTitleLanguage();
	SetHsMODE();
	initv();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult, 0);
</script>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/hscameraCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">摄像机设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
		<div id="div_video" class="div_video">
		<object name="WebCMS" ID="WebCMS" width="320" height="262" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" codebase="/WebCMS.exe#Version=2,0,0,0"></object>
		</div>
        <div id="div_set" class="div_set" style="width:480px;overflow:hidden;">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
<table width="480" border="0" cellspacing="0" cellpadding="0" id="Tablemain">
  <tr id="TrColorTitle">
    <td id="TdColort" class="lenstitle" onClick="hsDeployEx(1,'TdColor');"><LABEL id="laColorSet">亮色调节</LABEL></td>
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
  <tr>
    <td id="TdLenst" class="lenstitle" onClick="hsDeployEx(2,'TdLens');"><LABEL id="laParametersTitle">参数设置</LABEL></td>
  </tr>
   <tr>
    <td id="TdLens" class="lenssub" style="display:none;">
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
		<tr id="TrZoom">
		  <td width="28%" height="28" align="right" id="TdZoomt"><LABEL id="laZoomingSpeed">变倍速度控制</LABEL></td>
		  <td width="30%" align="center"><input name="ctrl1" type="button" class="btn2" id="ctrl1" onClick="hsvctrl('ctrl1',1,2,0,5001,0);" value="高速"></td>
		  <td width="42%"><input name="ctrl2" type="button" class="btn1" id="ctrl2" onClick="hsvctrl('ctrl2',2,1,0,5001,1);" value="正常速度"></td>
  </tr>
		  
		<tr style="display:none;">
		  <td height="28" align="right" id="TdFocust"><LABEL id="laFocus">焦距控制</LABEL></td>
		  <td align="center"><input name="ctrl3" type="button" class="btn2" id="ctrl3" onClick="hsvctrl('ctrl3',3,4,0,5002,0);" value="自动"></td>
		  <td><input name="ctrl4" type="button" class="btn1" id="ctrl4" onClick="hsvctrl('ctrl4',4,3,0,5002,1);" value="手动"></td>
  </tr>
		  
		<tr style="display:none;">
		  <td height="28" align="right" id="TdIrist"><LABEL id="laIris">光圈控制</LABEL></td>
		  <td align="center"><input name="ctrl5" type="button" class="btn2" id="ctrl5" onClick="hsvctrl('ctrl5',5,6,0,5003,0);" value="自动"></td>
		  <td><input name="ctrl6" type="button" class="btn1" id="ctrl6" onClick="hsvctrl('ctrl6',6,5,0,5003,1);" value="手动"></td>
  </tr>
		  
		<tr>
		  <td height="28" align="right" id="TdAWBt"><LABEL id="laWB">白平衡控制</LABEL></td>
		  <td align="center"><input name="ctrl7" type="button" class="btn2" id="ctrl7" onClick="hsvctrl('ctrl7',7,8,0,5004,0);" value="自动"></td>
		  <td><input name="ctrl8" type="button" class="btn1" id="ctrl8" onClick="hsvctrl('ctrl8',8,7,0,5004,1);" value="手动"></td>
  </tr>
	  <tr id="TrAWBCtrl" style="display:none;">
		<td height="28" colspan="3" style="padding:0 0 0 123;">
		  <select name="awbmode" id="awbmode" class="input2" style="width:186px;" onChange="chghsv(5000,5011,this.value);">
			<option id="opWBMode1" value="0">正常模式</option>
			<option id="opWBMode2" value="1">钠气灯模式</option>
			<option id="opWBMode3" value="2">汞蒸气灯模式</option>
		  </select>
		 </td>
	  </tr>							  
	  <tr id="TrAWBTable" style="display:none;">
		 <td id="TdAWB" colspan="3" style="padding:0 8px 0 100px;">
<div id="DivWBTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divWBItem" class="ca_set_set">
		<ul id="liWBRed" style="display:none;">
			<li id="t_wbred" class="cs1">白平衡 红</li>
			<li class="cs3"><div class="wh160"><div id="g_wbred" class="sax"><div id="b_wbred" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbred">50</div></li>
		</ul>
		<ul id="liWBGre" style="display:none;">
			<li id="t_wbgre" class="cs1">白平衡 绿</li>
			<li class="cs3"><div class="wh160"><div id="g_wbgre" class="sax"><div id="b_wbgre" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbgre">50</div></li>
		</ul>
		<ul id="liWBBlu" style="display:none;">
			<li id="t_wbblu" class="cs1">白平衡 蓝</li>
			<li class="cs3"><div class="wh160"><div id="g_wbblu" class="sax"><div id="b_wbblu" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_wbblu">50</div></li>
		</ul>
	</div>
</div>
          </td>
		</tr>							  
		  
		<tr id="strctrl12" style="display:none;">
		  <td height="28" align="right" id="TdWDRt"><LABEL id="btnWDR">宽动态模式</LABEL></td>
		  <td align="center"><input name="ctrl12" type="button" class="btn2" id="ctrl12" onClick="hsvctrl('ctrl12',12,11,0,5006,1);" value="开"></td>
		  <td><input name="ctrl11" type="button" class="btn1" id="ctrl11" onClick="hsvctrl('ctrl11',11,12,0,5006,0);" value="关"></td>
		</tr>
		<tr id="TrWDRCtrl" style="display:none;">
		<td height="28" colspan="3" style="padding:0 0 0 123;">
		  <select name="wdrmode" id="wdrmode" class="input2" style="width:186px;" onChange="chghsv(5000,5012,this.value);">
			<option id="opWDRMode1" value="0">一般宽动态</option>
			<option id="opWDRMode2" value="1">高级宽动态</option>
			<option id="opWDRMode3" value="2">一般对比偏移宽动态</option>
			<option id="opWDRMode4" value="3">高级对比偏移宽动态</option>
			<option id="opWDRMode5" value="4">对比偏移宽动态</option>
		 </select>
		 </td>
		</tr>							  
		  
		<tr id="strctrl10" style="display:none;">
		  <td height="28" align="right" id="TdBLCt"><LABEL id="laBLC">背光补偿</LABEL></td>
		  <td align="center"><input name="ctrl10" type="button" class="btn2" id="ctrl10" onClick="hsvctrl('ctrl10',10,9,0,5005,1);" value="开"></td>
		  <td><input name="ctrl9" type="button" class="btn1" id="ctrl9" onClick="hsvctrl('ctrl9',9,10,0,5005,0);" value="关"></td>
		</tr>
		<tr id="TrBLCTable" style="display:none;">
		 <td id="TdBLC" colspan="3" style="padding:0 8px 0 100px;">
		<div id="DivBLCTab" class="Imagescss" onMouseOut="OperableEx(0);">
			<div id="divBLCItem" class="ca_set_set">
				<ul id="liBLCLevel" style="display:none;">
					<li id="t_blclev" class="cs1">补偿值</li>
					<li class="cs3"><div class="wh160"><div id="g_blclev" class="sax"><div id="b_blclev" class="skx"></div></div></div></li>
					<li class="cs4"><div id="v_blclev">50</div></li>
				</ul>
			</div>
		</div>
			</td>
		  </tr>							  
		  
	  <tr>
		  <td height="28" align="right" id="TdMirrort"><LABEL id="laMirror">镜像</LABEL></td>
		  <td align="center"><input name="ctrl14" type="button" class="btn2" id="ctrl14" onClick="hsvctrl('ctrl14',14,13,0,5007,1);" value="开"></td>
		  <td><input name="ctrl13" type="button" class="btn1" id="ctrl13" onClick="hsvctrl('ctrl13',13,14,0,5007,0);" value="关"></td>
	  </tr>
	  <tr id="TrMirrorCtrl" style="display:none;">
		<td height="28" colspan="3" style="padding:0 0 0 123;">
		  <select name="mirrormode" id="mirrormode" class="input2" style="width:186px;" onChange="chghsv(5000,5013,this.value);">
			<option id="opMirrorMode1" value="0">翻转镜像</option>
			<option id="opMirrorMode2" value="1">水平镜像</option>
			<option id="opMirrorMode3" value="2">颠倒镜像</option>
		  </select>
		  </td>
	  </tr>							  
		  
		<tr style="display:none;">
		  <td height="28" align="right" id="TdFreezet"><LABEL id="laImageFrozen">视频冻结</LABEL></td>
		  <td align="center"><input name="ctrl16" type="button" class="btn2" id="ctrl16" onClick="hsvctrl('ctrl16',16,15,0,5008,1);" value="开"></td>
			  <td><input name="ctrl15" type="button" class="btn1" id="ctrl15" onClick="hsvctrl('ctrl15',15,16,0,5008,0);" value="关"></td>
		</tr>
		  
		<tr style="display:none;">
		  <td height="28" align="right" id="TdBlankt"><LABEL id="laInstantBlank">瞬间黑屏</LABEL></td>
		  <td align="center"><input name="ctrl18" type="button" class="btn2" id="ctrl18" onClick="hsvctrl('ctrl18',18,17,0,5009,1);" value="开"></td>
		  <td><input name="ctrl17" type="button" class="btn1" id="ctrl17" onClick="hsvctrl('ctrl17',17,18,0,5009,0);" value="关"></td>
		</tr>
		  
		<tr id="TrMode">
		  <td height="28" align="right" id="TdModet"><LABEL id="laImageMode">图像模式</LABEL></td>
		  <td align="center"><input name="ctrl19" type="button" class="btn2" id="ctrl19" onClick="hsvctrl('ctrl19',19,20,0,5010,0);" value="图像模式一"></td>
		  <td><input name="ctrl20" type="button" class="btn1" id="ctrl20" onClick="hsvctrl('ctrl20',20,19,0,5010,1);" value="图像模式二"></td>
		</tr>
		<tr id="TrRestrain" style="display:none;">
		  <td height="28" align="right" id="TdRestraint"><LABEL id="laRestraint">噪声抑制</LABEL></td>
		  <td align="center"><input name="ctrl22" type="button" class="btn2" id="ctrl22" onClick="hsvctrl('ctrl22',22,21,0,5015,1);" value="开"></td>
		  <td><input name="ctrl21" type="button" class="btn1" id="ctrl21" onClick="hsvctrl('ctrl21',21,22,0,5015,0);" value="关"></td>
		</tr>
		<tr id="TrRestrainLev" style="display:none;">
		  <td colspan="3" style="padding:0 8px 0 100px;">
			<div id="divResItem" class="ca_set_set">
				<ul id="liRestrain" style="display:none;">
					<li id="t_Res" class="cs1">抑制值</li>
					<li class="cs3"><div class="wh160"><div id="g_Res" class="sax"><div id="b_Res" class="skx"></div></div></div></li>
					<li class="cs4"><div id="v_Res">50</div></li>
				</ul>
			</div>
		  </td>
		</tr>	
								  
		<tr id="TrResolusion" style="display:none;">
		  <td height="28" align="right" id="TdResolusiont"><LABEL id="laResolusiont">高解析度</LABEL></td>
		  <td align="center"><input name="ctrl24" type="button" class="btn2" id="ctrl24" onClick="hsvctrl('ctrl24',24,23,0,5017,1);" value="开"></td>
		  <td><input name="ctrl23" type="button" class="btn1" id="ctrl23" onClick="hsvctrl('ctrl23',23,24,0,5017,0);" value="关"></td>
		</tr>
		</table>
		</td>
  </tr>
  
   <tr id="strircftitle">
    <td id="TdIRcft" class="lenstitle" onClick="hsDeployEx(3,'TdIRcf');"><LABEL id="laManualIRcfTitle">手动彩转黑(滤光片控制)</LABEL></td>
  </tr>
   <tr id="strircfset">
    <td id="TdIRcf" class="lenssub" style="display:none;">
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
			<tr>
			  <td width="110" height="23" align="right">&nbsp;</td>
			  <td width="120" height="23" align="center"><input name="ctrl31" type="button" class="btn2" id="ctrl31" onClick="hsvctrl('ctrl31',31,32,0,5101,0);" value="彩色"></td>
			  <td height="23" align="left"><input name="ctrl32" type="button" class="btn1" id="ctrl32" onClick="hsvctrl('ctrl32',32,31,0,5101,1);" value="黑白"></td>
			</tr>
		</table>	</td>
  </tr>
  
  <tr id="TrIRcf" style="display:none;">
    <td id="TdIRcft2" class="lenstitle" onClick="hsDeployEx(4,'TdIRcf2');"><LABEL id="laAutoIRcfTitle">自动彩转黑阀值(滤光片控制)</LABEL></td>
  </tr>
   <tr id="TrIRcfset" style="display:none;">
    <td id="TdIRcf2" class="lenssub" style="display:none; padding-left:100px;">
	<div id="divIRcfItem" class="ca_set_set">
		<ul id="liIRcf" style="display:none;">
			<li id="t_ircf" class="cs1">彩转黑阀值</li>
			<li class="cs3"><div class="wh160"><div id="g_ircf" class="sax"><div id="b_ircf" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_ircf">50</div></li>
		</ul>
	</div>
	</td>
  </tr>
  
   <tr id="TrIRcfCH6300t" style="display:none;">
    <td id="TdIRcfCH6300t" class="lenstitle" onClick="hsDeployEx(9,'TdIRcfCH6300');"><LABEL id="laIRcf6300Title">彩转黑(滤光片控制)</LABEL></td>
  </tr>
   <tr id="TrIRcfCH6300" style="display:none;">
    <td id="TdIRcfCH6300" class="lenssub" style="display:none;">
		<table width="100%" border="0" cellpadding="3" cellspacing="1">
			<tr id="TrIRcfCH6300Manual">
			  <td width="28%" height="23" align="right" id="TrIRcfCH6300Manualt"><LABEL id="laManualIRcf6300">手动彩转黑</LABEL></td>
			  <td width="32%" height="23" align="center"><input name="ctrl31" type="button" class="btn1" id="ctrl31" onClick="hsvctrl('ctrl31',31,32,0,5101,0);" value="黑白"></td>
			  <td width="40%" height="23" align="left"><input name="ctrl32" type="button" class="btn2" id="ctrl32" onClick="hsvctrl('ctrl32',32,31,0,5101,1);" value="彩色"></td>
			</tr>
			<tr>
			  <td width="28%" height="23" align="right" id="TrIRcfCH6300Autot"><LABEL id="laAutoIRcf6300">自动彩转黑</LABEL></td>
			  <td width="32%" height="23" align="center"><input name="ctrl39" type="button" class="btn1" id="ctrl39" onClick="hsvctrl('ctrl39',39,38,0,5104,0);" value="开"></td>
			  <td width="40%" height="23" align="left"><input name="ctrl38" type="button" class="btn2" id="ctrl38" onClick="hsvctrl('ctrl38',38,39,0,5104,1);" value="关"></td>
			</tr>
			<tr id="TrIRcfsetCH6300" style="display:none;">
			  <td height="23" colspan="3" id="TdIRcf2CH6300" style="padding-left:100px;">
	<div id="divIRcf2Item" class="ca_set_set">
		<ul id="liIRcf2" style="display:none;">
			<li id="t_ircf2" class="cs1">彩转黑阀值</li>
			<li class="cs3"><div class="wh160"><div id="g_ircf2" class="sax"><div id="b_ircf2" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_ircf2">50</div></li>
		</ul>
	</div>
			  </td>
			  </tr>
		</table>
		</td>
  </tr>


   <tr id="TrIRTitle">
    <td id="TdIRt" class="lenstitle" onClick="hsDeployEx(5,'TdIR');"><LABEL id="laIRTitle">红外灯</LABEL></td>
  </tr>
   <tr id="TrIRCtrl">
    <td id="TdIR" class="lenssub" style="display:none;">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			  <td width="110" align="right" valign="middle"><input name="ctrl33" type="button" class="btn2" id="ctrl33" onClick="hsvctrl('ctrl33',34,35,3,5102,0);" value="正常光"></td>
			  <td width="120" align="center" valign="middle"><input name="ctrl34" type="button" class="btn1" id="ctrl34" onClick="hsvctrl('ctrl34',33,35,3,5102,1);" value="850nm"></td>
			  <td><input name="ctrl35" type="button" class="btn1" id="ctrl35" onClick="hsvctrl('ctrl35',33,34,3,5102,2);" value="950nm"></td>
			</tr>
		  </table>	</td>
  </tr>
  
  
   <tr id="strAETitle">
    <td id="TdAEt" class="lenstitle" onClick="hsDeployEx(6,'TdAE');"><LABEL id="laAETitle">可编程自动曝光控制模式</LABEL></td>
  </tr>
   <tr id="strAESet">
    <td id="TdAE" class="lenssub" style="display:none; margin:0px; padding:0px;">
		<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin:0px; padding:0px;">
		<tr>
		  <td width="130" height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl47" type="button" class="btn1" id="ctrl47" onClick="hsvctrl('ctrl47',47,47,10,5201,0);" value="自动曝光"></td>
		  <td width="254" align="left" valign="bottom" class="aesubcss">
		  <select name="aevalue" id="aevalue" class="input2" style="width:220px;display:none;" onChange="chghsv(5000,5201,this.value);">
			<option id="opAutoExposure1" value="1">自动曝光</option>
			<option id="opAutoExposure2" value="2">自动曝光+彩转黑+高灵敏度</option>
			<option id="opAutoExposure3" value="3">自动曝光+彩转黑+中灵敏度</option>
			<option id="opAutoExposure4" value="4">自动曝光带慢快门</option>
			<option id="opAutoExposure5" value="5">自动曝光带慢快门+彩转黑+高灵敏度</option>
			<option id="opAutoExposure6" value="6">自动曝光带慢快门+彩转黑+中灵敏度</option>
			<option id="opAutoExposure7" value="7">自动曝光带慢快门+彩转黑+低灵敏度</option>
		  </select></td>
		</tr>
		<tr>
		  <td height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl48" type="button" class="btn1" id="ctrl48" onClick="hsvctrl('ctrl48',48,48,10,5201,8);" value="快门优先">                               </td>
		  <td align="left" valign="bottom" class="aesubcss">
		  <select name="spvalue" id="spvalue" class="input2" style="width:88px;display:none;" onChange="chghsv(5000,5301,this.value);">
			  <option value="1">1/1</option>
			  <option value="2">1/2</option>
			  <option value="4">1/4</option>
			  <option value="8">1/8</option>
			  <option value="15">1/15</option>
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
			</select></td>
		</tr>
		<tr id="Trepvalue">
		  <td height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl49" type="button" class="btn1" id="ctrl49" onClick="hsvctrl('ctrl49',49,49,10,5201,9);" value="光圈优先"></td>
		  <td align="left" valign="bottom" class="aesubcss">
		  <select name="epvalue" id="epvalue" class="input2" style="width:88px;display:none;" onChange="chghsv(5000,5302,this.value);">
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
			</select>		  </td>
		</tr>
	   <tr id="TrAGCSC110T">
		  <td height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl50" type="button" class="btn1" id="ctrl50" onClick="hsvctrl('ctrl50',50,50,10,5201,10);" value="自动增益控制"></td>
		  <td align="left" valign="bottom" class="aesubcss">
	<div id="DivAutoAGCTab" class="Imagescss" onMouseOut="OperableEx(0);">
		<div id="divAutoAGCItem" class="ca_set_set">
			<ul id="liAutoAGCLevel" style="display:none;">
				<li id="t_autoagc" class="cs1">增益值</li>
				<li class="cs3"><div class="wh160"><div id="g_autoagc" class="sax"><div id="b_autoagc" class="skx"></div></div></div></li>
				<li class="cs4"><div id="v_autoagc">50</div></li>
			</ul>
		</div>
	</div>
		 </td>
		</tr>
		
		<tr id="TrBright" style="display:none;">
		  <td height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl51" type="button" class="btn1" id="ctrl51" onClick="hsvctrl('ctrl51',51,51,10,5201,11);" value="亮度优先">
		  </td>
		  <td align="left" valign="bottom" class="aesubcss">
		   </td>
		</tr>
		
	   <tr id="TrSlowAuto" style="display:none;">
		  <td height="28" align="center" valign="middle" style="margin:0px; padding:0px;"><input name="ctrl52" type="button" class="btn1" id="ctrl52" onClick="hsvctrl('ctrl52',52,52,10,5201,12);" value="慢速自动"></td>
		  <td align="left" valign="bottom" class="aesubcss" >
	<div id="DivSlowLevTab" class="Imagescss" onMouseOut="OperableEx(0);">
		<div id="divSlowLevItem" class="ca_set_set">
			<ul id="liSlowLevel" style="display:none;">
				<li id="t_slowlev" class="cs1">调节值</li>
				<li class="cs3"><div class="wh160"><div id="g_slowlev" class="sax"><div id="b_slowlev" class="skx"></div></div></div></li>
				<li class="cs4"><div id="v_slowlev">50</div></li>
			</ul>
		</div>
	</div>
		 </td>
		</tr>
		
		<tr id="TrSlowShutter" style="display:none;">
		  <td height="28" align="center" valign="middle"><input name="ctrl53" type="button" class="btn1" id="ctrl53" onClick="hsvctrl('ctrl53',53,53,10,5201,13);" value="慢速快门"></td>
		  <td align="left" valign="bottom" class="aesubcss">
		   </td>
		</tr>
		
		</table>
	</td>
  </tr>

   <tr id="TrAGCSC220T" style="display:none;">
    <td id="TdAGCt" class="lenstitle" onClick="hsDeployEx(7,'TdAGC');"><LABEL id="laMaxGainTitle">最大增益值设置</LABEL></td>
  </tr>
   <tr id="TrAGCSC220TSet">
    <td id="TdAGC" class="lenssub" style="display:none; padding-left:100px;">
	<div id="DivAGCMaxTab" class="Imagescss" onMouseOut="OperableEx(0);">
		<div id="divAGCMaxItem" class="ca_set_set">
			<ul id="liAGCMax" style="display:none;">
				<li id="t_agcmax" class="cs1">调节值</li>
				<li class="cs3"><div class="wh160"><div id="g_agcmax" class="sax"><div id="b_agcmax" class="skx"></div></div></div></li>
				<li class="cs4"><div id="v_agcmax">50</div></li>
			</ul>
		</div>
	</div>
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
<div id="DivIris" class="Imagescss">
		<input type="button" id="btnIris0" name="btnIris0" class="btn1" onClick="hsvctrlEx(1041, 2, 'btnIris0', 0, 0 ,0);" value="非自动光圈">
		<input type="button" id="btnIris1" name="btnIris1" class="btn1" onClick="hsvctrlEx(1041, 2, 'btnIris1', 1, 1 ,0);" value="DC自动光圈">
</div>

<div id="DivIrisTab" class="Imagescss" onMouseOut="OperableEx(0);">
	<div id="divIrisItem" class="ca_set_set">
		<ul id="liIris" style="display:none;">
			<li id="t_Iris" class="cs1">光圈电平</li>
			<li class="cs3"><div class="wh160"><div id="g_iris" class="sax"><div id="b_iris" class="skx"></div></div></div></li>
			<li class="cs4"><div id="v_iris">50</div></li>
		</ul>
	</div>
</div>
<div id="DivAutoIrisShading" class="Imagescss" style="display:none;">
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
</table>

<table width="480" border="0" cellpadding="1" cellspacing="1" class="ts">
<tr id="trPower">
  <td height="23" colspan="2" align="left" class="ttitlebg" id="TdPowert" onClick="hsDeployEx(10,'trPowerSet');"><LABEL id="laLighteningFrequencyTitle">照明频率</LABEL></td>
</tr>
<tr id="trPowerSet" style="display:none;">
  <td width="160" height="23" align="center"><input name="ctrl36" type="button" class="btn1" id="ctrl36" onClick="hsvctrl('ctrl36',36,37,0,5103,0);" value="60Hz"></td>
  <td height="23" align="left"><input name="ctrl37" type="button" class="btn1" id="ctrl37" onClick="hsvctrl('ctrl37',37,36,0,5103,1);" value="50Hz"></td>
</tr>
<tr>
  <td height="23" colspan="2" align="left" class="ttitlebg" id="TdAutoZoomt" onClick="hsDeployEx(11,'trAutoZoomSet');"><LABEL id="laAutoFocusMode">低照度点光源环境自动聚焦功能优化开关</LABEL></td>
</tr>
<tr id="trAutoZoomSet" style="display:none;">
  <td height="23" colspan="2">
  <select name="afvalue" id="afvalue" class="input2" style="width:310px;" onChange="chghsv(5000,5401,this.value);">
	<option id="opAutoFocusMode1" value="1">默认AF</option>
	<option id="opAutoFocusMode2" value="2">低照度AF优化开启</option>
	<option id="opAutoFocusMode3" value="3">低照度点光源AF优化开启</option>
	</select>
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
			<a hidefocus="true" href="javascript:;" id="btnResetSumbit" onClick="return submitFrm(1)" style="display:none;">恢复默认值</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>	
<input name="resetvalue" type="hidden" id="resetvalue" value="0">
<input name="hstype" type="hidden" id="hstype" value="0">
<input name="status1" type="hidden" id="status1" value="-1">
<input name="status2" type="hidden" id="status2" value="0">
<input name="status3" type="hidden" id="status3" value="0">
<input name="status4" type="hidden" id="status4" value="0">
<input name="status5" type="hidden" id="status5" value="0">
<input name="status6" type="hidden" id="status6" value="0">
<input name="status7" type="hidden" id="status7" value="0">
<input name="status8" type="hidden" id="status8" value="0">
<input name="status9" type="hidden" id="status9" value="0">
<input name="status10" type="hidden" id="status10" value="0">
<input name="status11" type="hidden" id="status11" value="0">
<input name="status12" type="hidden" id="status12" value="0">
<input name="status13" type="hidden" id="status13" value="0">
<input name="status14" type="hidden" id="status14" value="0">
<input name="blcvalue" type="hidden" id="blcvalue" value="0">
<input type="hidden" value="-1" name="vBLCLevel" 	id="vBLCLevel">
<input type="hidden" value="-1" name="vAWBRed" 		id="vAWBRed">
<input type="hidden" value="-1" name="vAWBGreen" 	id="vAWBGreen">
<input type="hidden" value="-1" name="vAWBBlue" 	id="vAWBBlue">
<input type="hidden" value="-1" name="ircfvalue" 	id="ircfvalue">
<input type="hidden" value="-1" name="agcpvalue" 	id="agcpvalue">

<input type="hidden" value="12" name="maximumagc" 	id="maximumagc">

<input type="hidden" value="25" name="vBrightness" 	id="vBrightness">
<input type="hidden" value="-1" name="vHue" 		id="vHue">
<input type="hidden" value="-1" name="vContrast" 	id="vContrast">
<input type="hidden" value="-1" name="vSaturation" 	id="vSaturation">
<input type="hidden" value="-1" name="vSharpness" 	id="vSharpness">
<input type="hidden" value="-1" name="vRed" 		id="vRed">
<input type="hidden" value="-1" name="vBlue" 		id="vBlue">
<input type="hidden" value="-1" name="vGamma" 		id="vGamma">

<input type="hidden" value="-1" name="reductionvalue" 	id="reductionvalue">
<input type="hidden" value="-1" name="reductionlevel" 	id="reductionlevel">
<input type="hidden" value="-1" name="resolusionvalue" 	id="resolusionvalue">
<input type="hidden" value="-1" name="autoircfvalue" 	id="autoircfvalue">
<input type="hidden" value="-1" name="slowautolevel" 	id="slowautolevel">

<input type="hidden" value="-1" name="vAutoIris" 		id="vAutoIris">
<input type="hidden" value="-1" name="vIrisLevel" 		id="vIrisLevel">
<input type="hidden" value="-1" name="vautoirisshading" id="vautoirisshading">
<input type="hidden" value="-1" name="vlensshading" 	id="vlensshading">

<div id="StrNotice" class="divnotice" style="width:1px;" >
	<input type="hidden" value="-1" name="btimeshutter" 	id="btimeshutter">
	<div id="TrTimeShutter" class="divnotice" style="width:1px;" ></div>
</div>
</form>
<%outHscameraCfgEx();%>
</body>
</html>
