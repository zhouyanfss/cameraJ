<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云台设置</title>
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

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/lensex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>

<script type="text/JavaScript" language="javascript" src="./js/hsvbtn.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function ChangeTitleLanguage(){
	eval("var arrayPtion = " + getNodeValue('jsArrayPtion') + ";");
	var i;
	for(i = 0; i < arrayPtion.length; i++){
		$s("watchmode").options[i].innerHTML	= arrayPtion[i] ;
		$s("initmode").options[i].innerHTML		= arrayPtion[i] ;
	}
	for(i = 0; i < arrayPtion.length; i++){
		$s("selask1").options[i].innerHTML	= arrayPtion[i] ;
		$s("selask2").options[i].innerHTML	= arrayPtion[i] ;
		$s("selask3").options[i].innerHTML	= arrayPtion[i] ;
		$s("selask4").options[i].innerHTML	= arrayPtion[i] ;
		$s("selask5").options[i].innerHTML	= arrayPtion[i] ;
	}
}
function init(){
	ChangeLanguage('../xml/hsptz.xml', m_szLanguage);
	ChangeTitleLanguage();
	
	$s("hsvalue").length = 0;
	for(i=1;i<41;i++){
		$s("hsvalue").options[$s("hsvalue").length] = new Option(i,i);
	}
	$s("vsvalue").length = 0;
	for(i=1;i<21;i++){
		$s("vsvalue").options[$s("vsvalue").length] = new Option(i,i);
	}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);initv();">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult, 0);
</script>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/hsptzCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">云台设置</LABEL></li>
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
		  <table width="480" border="0" cellpadding="3" cellspacing="1">
					<tr>
					  <td width="35%" height="28" align="right" id="TdFlipt"><LABEL id="laAutoFlip">自动翻转</LABEL></td>
					  <td width="27%" align="center"><input name="ctrl2" type="button" class="btn2" id="ctrl2" onClick="hsvctrl('ctrl2',2,1,0,6001,1);" value="开"></td>
					  <td width="38%"><input name="ctrl1" type="button" class="btn1" id="ctrl1" onClick="hsvctrl('ctrl1',1,2,0,6001,0);" value="关"></td>
			  </tr>
					  
					<tr>
					  <td height="28" align="right" id="TdPant"><LABEL id="laLongFocusSpeedLimit">景深比例变速</LABEL></td>
					  <td align="center"><input name="ctrl4" type="button" class="btn2" id="ctrl4" onClick="hsvctrl('ctrl4',4,3,0,6002,1);" value="开"></td>
					  <td><input name="ctrl3" type="button" class="btn1" id="ctrl3" onClick="hsvctrl('ctrl3',3,4,0,6002,0);" value="关"></td>
			  </tr>
					  
					<tr>
					  <td height="28" align="right" id="TdZerot"><LABEL id="laVirtualZero">虚拟零位设置</LABEL></td>
					  <td align="center"><input name="ctrl5" type="button" class="btn1" id="ctrl5" onClick="hsvctrl('ctrl5',5,6,0,6003,1);" value="设置"></td>
					  <td>
<a hidefocus="true" class="btn69 act" href="javascript:;" onClick="hsvctrl('ctrl6',6,5,9,6003,0);" id="ctrl6"><LABEL id="laOK">确认</LABEL></a>
<a hidefocus="true" class="btn69 act" href="javascript:;" onClick="hsvctrl('ctrl60',60,5,9,6003,-1);" id="ctrl60"><LABEL id="laCancel">取消</LABEL></a>
					  </td>
			  </tr>
					  
					<tr>
					  <td height="28" align="right" id="TdLimitMt"><LABEL id="laManualLimitSwitch">手动限位</LABEL></td>
					  <td align="center"><input name="ctrl8" type="button" class="btn2" id="ctrl8" onClick="hsvctrl('ctrl8',8,7,0,6004,1);" value="开"></td>
					  <td><input name="ctrl7" type="button" class="btn1" id="ctrl7" onClick="hsvctrl('ctrl7',7,8,0,6004,0);" value="关"></td>
			  </tr>
					  
					<tr>
					  <td height="28" align="right" id="TdLimitSt"><LABEL id="laScanLimitSwitch">扫描限位</LABEL></td>
					  <td align="center"><input name="ctrl10" type="button" class="btn2" id="ctrl10" onClick="hsvctrl('ctrl10',10,9,0,6005,1);" value="开"></td>
					  <td><input name="ctrl9" type="button" class="btn1" id="ctrl9" onClick="hsvctrl('ctrl9',9,10,0,6005,0);" value="关"></td>
			  </tr>

					<tr>
					  <td height="23" colspan="3" align="left">
					<table width="100%" border="0" cellpadding="3" cellspacing="1" class="ts">  
					<tr>
					  <td height="23" colspan="4" align="left" class="ttitlebg" id="TdScant"><LABEL id="laScanSpeed">扫描速度设置</LABEL></td>
				</tr>
					<tr>
					  <td width="30%" height="23" align="right" id="TdPanSt"><LABEL id="laPanScanSpeed">水平扫描速度</LABEL></td>
					  <td width="26%" height="23">
						<select name="hsvalue" id="hsvalue" style="width:88px;">
					  </select></td>
					  <td width="29%" height="23" align="right" id="TdTitlSt"><LABEL id="laTiltScanSpeed">俯仰扫描速度</LABEL></td>
					  <td width="15%">
					  <select name="vsvalue" id="vsvalue" style="width:88px;">
					  </select></td>
					</tr>
					<tr>
					  <td height="23" colspan="4" align="left" class="ttitlebg" id="TdParkt"><LABEL id="laPark">看守位</LABEL></td>
				 </tr>
					<tr>
					  <td height="23" align="right" id="TdParkMode"><LABEL id="laParkMode">看守位模式</LABEL></td>
					  <td height="23"><select name="watchmode" id="watchmode" style="width:88px;">
						<option value="0">无</option>
						<option value="1">预置位1</option>
						<option value="2">预置位2</option>
						<option value="3">预置位3</option>
						<option value="4">预置位4</option>
						<option value="5">预置位5</option>
						<option value="6">预置位6</option>
						<option value="7">预置位7</option>
						<option value="8">预置位8</option>
						<option value="9">自动扫描</option>
						<option value="10">削苹果扫描</option>
						<option value="11">预置位巡视1</option>
						<option value="12">预置位巡视2</option>
						<option value="13">花样扫描1</option>
						<option value="14">花样扫描2</option>
					  </select></td>
					  <td height="23" align="right" id="TdParkTime"><LABEL id="laParkTime">看守位起动时间</LABEL></td>
					  <td><input name="watchtime" type="text" id="watchtime" style="width:32px;" value="60" maxlength="2" onKeyPress="event.returnValue=isDigit();">
					   <LABEL id="laParkTimeUnit">分</LABEL></td>
					  </tr>
					<tr style="display:none;">
					  <td height="23" colspan="4" align="left" class="ttitlebg" id="TdElectrifyt"><LABEL id="laPowerOnModeT">上电模式设置</LABEL></td>
				 </tr>
					<tr style="display:none;">
					  <td height="23" align="right" id="TdElectrify"><LABEL id="laPowerOnMode">上电模式选项</LABEL></td>
					  <td height="23"><select name="initmode" id="initmode" style="width:88px;">
						<option value="0">无</option>
						<option value="1">预置位1</option>
						<option value="2">预置位2</option>
						<option value="3">预置位3</option>
						<option value="4">预置位4</option>
						<option value="5">预置位5</option>
						<option value="6">预置位6</option>
						<option value="7">预置位7</option>
						<option value="8">预置位8</option>
						<option value="9">自动扫描</option>
						<option value="10">削苹果扫描</option>
						<option value="11">预置位巡视1</option>
						<option value="12">预置位巡视2</option>
						<option value="13">花样扫描1</option>
						<option value="14">花样扫描2</option>
					  </select></td>
					  <td height="23" align="right" id="TdElectrifyTime"><LABEL id="laPowerOnTime">上电模式时间</LABEL></td>
					  <td><input name="inittime" type="text" id="inittime" style="width:32px;" value="10" maxlength="2" onKeyPress="event.returnValue=isDigit();">
						 <LABEL id="laPowerOnTimeUnit">分</LABEL></td>
					  </tr>
					</table>							</td>
					</tr>
					
					<tr>
					  <td height="23" colspan="3" align="left">
					  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="ts"> 
					  <tr>
					  <td height="23" colspan="3" align="left" class="ttitlebg" id="TdTour1"><LABEL id="laPresetTour1">预置位巡视1</LABEL></td>
					  <td height="23" colspan="3" align="left" class="ttitlebg" id="TdTour2"><LABEL id="laPresetTour2">预置位巡视2</LABEL></td>
					  </tr>
					<tr>
					  <td width="40" height="23" align="center" id="TdNOt"><LABEL id="laTourPoint1">巡视点</LABEL></td>
					  <td width="70" height="23" align="center" id="TdPresetNOt"><LABEL id="laPresetNO1">预置位号</LABEL></td>
					  <td width="50" height="23" align="left" id="TdTimet"><LABEL id="laTime1">时间(秒)</LABEL></td>
					  <td width="38" align="center" id="TdNOt2"><LABEL id="laTourPoint2">巡视点</LABEL></td>
					  <td width="70" align="left" id="TdPresetNOt2"><LABEL id="laPresetNO2">预置位号</LABEL></td>
					  <td width="56" align="left" id="TdTimet2"><LABEL id="laTime2">时间(秒)</LABEL></td>
					</tr>
					<tr>
					  <td height="23" align="center">1</td>
					  <td height="23" align="center"><input name="presetno1" type="text" class="inputtime" id="presetno1" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime1" type="text" class="inputtime" id="pretime1" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">1</td>
					  <td align="left"><input name="pre2no1" type="text" class="inputtime" id="pre2no1" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time1" type="text" class="inputtime" id="pre2time1" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">2</td>
					  <td height="23" align="center"><input name="presetno2" type="text" class="inputtime" id="presetno2" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime2" type="text" class="inputtime" id="pretime2" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">2</td>
					  <td align="left"><input name="pre2no2" type="text" class="inputtime" id="pre2no2" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time2" type="text" class="inputtime" id="pre2time2" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">3</td>
					  <td height="23" align="center"><input name="presetno3" type="text" class="inputtime" id="presetno3" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime3" type="text" class="inputtime" id="pretime3" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">3</td>
					  <td align="left"><input name="pre2no3" type="text" class="inputtime" id="pre2no3" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time3" type="text" class="inputtime" id="pre2time3" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">4</td>
					  <td height="23" align="center"><input name="presetno4" type="text" class="inputtime" id="presetno4" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime4" type="text" class="inputtime" id="pretime4" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">4</td>
					  <td align="left"><input name="pre2no4" type="text" class="inputtime" id="pre2no4" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time4" type="text" class="inputtime" id="pre2time4" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">5</td>
					  <td height="23" align="center"><input name="presetno5" type="text" class="inputtime" id="presetno5" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime5" type="text" class="inputtime" id="pretime5" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">5</td>
					  <td align="left"><input name="pre2no5" type="text" class="inputtime" id="pre2no5" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time5" type="text" class="inputtime" id="pre2time5" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">6</td>
					  <td height="23" align="center"><input name="presetno6" type="text" class="inputtime" id="presetno6" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime6" type="text" class="inputtime" id="pretime6" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">6</td>
					  <td align="left"><input name="pre2no6" type="text" class="inputtime" id="pre2no6" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time6" type="text" class="inputtime" id="pre2time6" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">7</td>
					  <td height="23" align="center"><input name="presetno7" type="text" class="inputtime" id="presetno7" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime7" type="text" class="inputtime" id="pretime7" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">7</td>
					  <td align="left"><input name="pre2no7" type="text" class="inputtime" id="pre2no7" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time7" type="text" class="inputtime" id="pre2time7" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					<tr>
					  <td height="23" align="center">8</td>
					  <td height="23" align="center"><input name="presetno8" type="text" class="inputtime" id="presetno8" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td height="23" align="left"><input name="pretime8" type="text" class="inputtime" id="pretime8" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					  <td align="center">8</td>
					  <td align="left"><input name="pre2no8" type="text" class="inputtime" id="pre2no8" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3"></td>
					  <td align="left"><input name="pre2time8" type="text" class="inputtime" id="pre2time8" style="width:36px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="5"></td>
					</tr>
					 </table>
					 </td>
					</tr>
		</table>

		  <table width="450" border="0" cellpadding="3" cellspacing="1" class="ts">  
		<tr>
		  <td height="23" colspan="4" align="left" class="ttitlebg" id="TdTimeSett"><LABEL id="laSchedule">定时设置</LABEL></td>
  </tr>
		<tr>
		  <td width="25%" height="23" align="center" id="Tdonofft"><LABEL id="laEnable">开关</LABEL></td>
		  <td width="25%" height="23" align="center" id="Tdtaskt"><LABEL id="laTask">任务</LABEL></td>
		  <td width="25%" height="23" align="center" id="Tdstarttimet"><LABEL id="laStart">开始时间</LABEL></td>
		  <td width="25%" id="Tdendtimet"><LABEL id="laClose">结束时间</LABEL></td>
		</tr>
		<tr>
		  <td height="23" align="center"><input name="cktask1" type="checkbox" id="cktask1" value="0" onClick="checkClick('hsp_frm','cktask1')" /></td>
		  <td height="23" align="center"><select name="selask1" id="selask1" style="width:100px;">
			<option value="0">无</option>
			<option value="1">预置位1</option>
			<option value="2">预置位2</option>
			<option value="3">预置位3</option>
			<option value="4">预置位4</option>
			<option value="5">预置位5</option>
			<option value="6">预置位6</option>
			<option value="7">预置位7</option>
			<option value="8">预置位8</option>
			<option value="9">自动扫描</option>
			<option value="10">削苹果扫描</option>
			<option value="11">预置位巡视1</option>
			<option value="12">预置位巡视2</option>
			<option value="13">花样扫描1</option>
			<option value="14">花样扫描2</option>
		  </select></td>
		  <td height="23" align="right"><input name="begh1" type="text" maxlength="2" id="begh1" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm1" type="text" maxlength="2" id="begm1" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-</td>
		  <td><input name="endh1" type="text" id="endh1" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm1" type="text" id="endm1" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
		</tr>
		<tr>
		  <td height="23" align="center"><input name="cktask2" type="checkbox" id="cktask2" value="0" onClick="checkClick('hsp_frm','cktask2')" /></td>
		  <td height="23" align="center"><select name="selask2" id="selask2" style="width:100px;">
			<option value="0">无</option>
			<option value="1">预置位1</option>
			<option value="2">预置位2</option>
			<option value="3">预置位3</option>
			<option value="4">预置位4</option>
			<option value="5">预置位5</option>
			<option value="6">预置位6</option>
			<option value="7">预置位7</option>
			<option value="8">预置位8</option>
			<option value="9">自动扫描</option>
			<option value="10">削苹果扫描</option>
			<option value="11">预置位巡视1</option>
			<option value="12">预置位巡视2</option>
			<option value="13">花样扫描1</option>
			<option value="14">花样扫描2</option>
		  </select></td>
		  <td height="23" align="right"><input name="begh2" type="text" maxlength="2" id="begh2" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm2" type="text" maxlength="2" id="begm2" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-</td>
		  <td><input name="endh2" type="text" id="endh2" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm2" type="text" id="endm2" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
		</tr>
		<tr>
		  <td height="23" align="center"><input name="cktask3" type="checkbox" id="cktask3" value="0" onClick="checkClick('hsp_frm','cktask3')" /></td>
		  <td height="23" align="center"><select name="selask3" id="selask3" style="width:100px;">
			<option value="0">无</option>
			<option value="1">预置位1</option>
			<option value="2">预置位2</option>
			<option value="3">预置位3</option>
			<option value="4">预置位4</option>
			<option value="5">预置位5</option>
			<option value="6">预置位6</option>
			<option value="7">预置位7</option>
			<option value="8">预置位8</option>
			<option value="9">自动扫描</option>
			<option value="10">削苹果扫描</option>
			<option value="11">预置位巡视1</option>
			<option value="12">预置位巡视2</option>
			<option value="13">花样扫描1</option>
			<option value="14">花样扫描2</option>
		  </select></td>
		  <td height="23" align="right"><input name="begh3" type="text" maxlength="2" id="begh3" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm3" type="text" maxlength="2" id="begm3" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-</td>
		  <td><input name="endh3" type="text" id="endh3" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm3" type="text" id="endm3" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
		</tr>
		<tr>
		  <td height="23" align="center"><input name="cktask4" type="checkbox" id="cktask4" value="0" onClick="checkClick('hsp_frm','cktask4')" /></td>
		  <td height="23" align="center"><select name="selask4" id="selask4" style="width:100px;">
			<option value="0">无</option>
			<option value="1">预置位1</option>
			<option value="2">预置位2</option>
			<option value="3">预置位3</option>
			<option value="4">预置位4</option>
			<option value="5">预置位5</option>
			<option value="6">预置位6</option>
			<option value="7">预置位7</option>
			<option value="8">预置位8</option>
			<option value="9">自动扫描</option>
			<option value="10">削苹果扫描</option>
			<option value="11">预置位巡视1</option>
			<option value="12">预置位巡视2</option>
			<option value="13">花样扫描1</option>
			<option value="14">花样扫描2</option>
		  </select></td>
		  <td height="23" align="right"><input name="begh4" type="text" maxlength="2" id="begh4" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm4" type="text" maxlength="2" id="begm4" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-</td>
		  <td><input name="endh4" type="text" id="endh4" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm4" type="text" id="endm4" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
		</tr>
		<tr>
		  <td height="23" align="center"><input name="cktask5" type="checkbox" id="cktask5" value="0" onClick="checkClick('hsp_frm','cktask5')" /></td>
		  <td height="23" align="center"><select name="selask5" id="selask5" style="width:100px;">
			<option value="0">无</option>
			<option value="1">预置位1</option>
			<option value="2">预置位2</option>
			<option value="3">预置位3</option>
			<option value="4">预置位4</option>
			<option value="5">预置位5</option>
			<option value="6">预置位6</option>
			<option value="7">预置位7</option>
			<option value="8">预置位8</option>
			<option value="9">自动扫描</option>
			<option value="10">削苹果扫描</option>
			<option value="11">预置位巡视1</option>
			<option value="12">预置位巡视2</option>
			<option value="13">花样扫描1</option>
			<option value="14">花样扫描2</option>
		  </select></td>
		  <td height="23" align="right"><input name="begh5" type="text" maxlength="2" id="begh5" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm5" type="text" maxlength="2" id="begm5" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-</td>
		  <td><input name="endh5" type="text" id="endh5" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm5" type="text" id="endm5" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
		</tr>
		<tr>
		  <td height="23" colspan="4" align="left" valign="middle" id="Tdalertt"><LABEL id="laScheduleAlert">&nbsp;注意:五个任务之间时间不能重叠</LABEL></td>
		</tr>
		<tr>
		  <td height="25" colspan="4" align="left" class="ttitlebg" id="TdPTZdefaultt"><LABEL id="laPTZDefault">球机云台默认设置</LABEL></td>
	</tr>
		<tr>
		  <td height="56" colspan="4" align="center" valign="middle">
<a hidefocus="true" class="btn200 act" href="javascript:;" onClick="hsvctrl('ctrl51',51,51,5,6900,0);" id="ctrl51"><LABEL id="laPTZReset">球机云台复位</LABEL></a>
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
			<input name="btnResetSumbit" type="submit" class="button" id="btnResetSumbit" value="恢复默认值" align="right" style="width:86px; margin-left:18px; display:none;" onClick="return Checkfrm(1)">
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>	
<input name="hstype" type="hidden" id="hstype" value="1">
<input name="status1" type="hidden" id="status1" value="0">
<input name="status2" type="hidden" id="status2" value="0">
<input name="status3" type="hidden" id="status3" value="0">
<input name="status4" type="hidden" id="status4" value="0">
<input name="status5" type="hidden" id="status5" value="0">
<input name="status6" type="hidden" id="status6" value="0">
<input name="status7" type="hidden" id="status7" value="0">
</form>
<script language="javascript">
	init();
</script>
<%outHsptzCfgEx();%>
</body>
</html>
