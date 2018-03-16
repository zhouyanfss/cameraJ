<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>探头检测设置</title>
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
<style type="text/css">
<!--
.inputwidht{
width:25px;
height:18px;
}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){

	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function enablecount(){
	var alarmoutputcount 	= parseInt(getCookies("alarmoutputcount"));
	var ChannelCount 		= parseInt(getCookies("intChannel"));
	if(isNaN(alarmoutputcount) || alarmoutputcount < 1 ){alarmoutputcount = 1;}
	if(isNaN(ChannelCount) || ChannelCount < 1){ChannelCount = 1;}
	chgcountfun(alarmoutputcount,	"strdivout",	1);
	chgcountfun(ChannelCount,		"strdivrecdev",	1);
	chgcountfun(ChannelCount,		"strdivcapdev",	1);
	chgcountfun(ChannelCount,		"strdivrecpc",	1);
}
function init(){
	ChangeLanguage('../xml/sensor.xml', m_szLanguage);
	try{
		var devicetype = getCookies("devicetype");
		if(devicetype == 82){
			$s("type").remove(1);
		}
	}catch(e){}
	//initSensorChannel();
	enablecount();
	
	if(0==parseInt($p("bCenterWeb").value)){
		$s("stralarmrecPC").style.display	= "none";
	}else{
		$s("stralarmrecPC").style.display	= "";
	}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/sensorCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">探头报警</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Chan">
				<li id="laChan">
			  <table id="TableChan" border="0" width="520" cellspacing="0" cellpadding="0" style="margin-bottom:12px; display:none;">
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
				<img src="./images/botton/8.jpg" alt="8" id="channel8" name="channel8" onClick="ChangeChannel(8,'');" style="cursor:pointer; display:none;">				</div>
				<div id="divChannelSync"><input name="copysync" type="checkbox" id="copysync" value="0" onClick="checkClick('audio_frm','copysync')"></div>
				<div id="divChannelSyncTitle"><LABEL id="laChannelSync">复制到所有通道</LABEL></div>				</td>
                </tr>
           </table>
				</li>
			</ul>

			<ul id="show_Main">
				<li class="vrig" id="laMain">
	<table width="680" border="1" cellpadding="5" cellspacing="1" bgcolor="#999999" style="margin:0px;">
		<tr>
		  <td height="21" align="right" valign="bottom" bgcolor="#FFFFFF"><LABEL id="btnEnable">检测开关</LABEL></td><td bgcolor="#FFFFFF" ><input name="ckdetect" type="checkbox" id="ckdetect" value="checkbox" onClick="checkClick('motion_frm','ckdetect')"/></td>
		  <td align="right" bgcolor="#FFFFFF" ><LABEL id="btnSensorType">探头类型</LABEL></td>
		  <td colspan="2" bgcolor="#FFFFFF" >
			  <select name="type" class="select3" id="type" style="width:86px;">
				<option id="opSensorType1" value="0">常开</option>
				<option id="opSensorType2" value="1">常闭</option>
			  </select><span style="color:#FF0000;">*</span></td>
		  </tr>
		<tr>
		  <td height="21" align="right" valign="bottom" bgcolor="#FFFFFF"><LABEL id="laTime1">布防时间段1</LABEL></td><td colspan="4" bgcolor="#FFFFFF" ><input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('record_frm','ckevery')" />
                <input name="begh1" type="text" class="textmin" id="begh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm1" type="text" class="textmin" id="begm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
--
<input name="endh1" type="text" class="textmin" id="endh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="endm1" type="text" class="textmin" id="endm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		  </tr>
		<tr>
		  <td height="21" align="right" valign="bottom" bgcolor="#FFFFFF"><LABEL id="laTime2">布防时间段2</LABEL></td><td colspan="4" bgcolor="#FFFFFF" ><input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('record_frm','ckevery2')" />
			  <input name="begh12" type="text" class="textmin" id="begh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm12" type="text" class="textmin" id="begm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
--
<input name="endh12" type="text" class="textmin" id="endh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="endm12" type="text" class="textmin" id="endm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
		  </tr>
		<tr>
		  <td height="21" colspan="5" valign="bottom" bgcolor="#FFFFFF"><LABEL id="laLinkageAlarm">报警联动</LABEL></td>
		</tr>
		<tr id="stralarmemail">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF"><div id="Divsendemail" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laEmail">发送E-mail</LABEL></div></td>
		  <td height="21" colspan="4" align="left" bgcolor="#FFFFFF"><input name="alarmoutemail" type="checkbox" id="alarmoutemail" value="checkbox" onClick="checkClick('motion_frm','alarmoutemail')"/></td>
		  </tr>
		<tr id="stralarmioout">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF"><div id="divoutput" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laIOOutput">&nbsp;&nbsp;IO输出</LABEL></div></td>
		  <td width="25%" height="21" align="left" bgcolor="#FFFFFF"><div id="strdivout1" style="padding:0px; margin:0px; width:36px; float:left;"><input name="ckalarmout" type="checkbox" id="ckalarmout" value="checkbox" onClick="checkClick('motion_frm','ckalarmout')"/></div>
			<div id="strdivout2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout2" type="checkbox" id="ckalarmout2" value="checkbox" onClick="checkClick('motion_frm','ckalarmout2')"/>2</div>	
		  <div id="strdivout3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout3" type="checkbox" id="ckalarmout3" value="checkbox" onClick="checkClick('motion_frm','ckalarmout3')"/>3</div>
		  <div id="strdivout4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout4" type="checkbox" id="ckalarmout4" value="checkbox" onClick="checkClick('motion_frm','ckalarmout4')"/>4</div>
		  <div id="strdivout5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout5" type="checkbox" id="ckalarmout5" value="checkbox" onClick="checkClick('motion_frm','ckalarmout5')"/>5</div>
		  <div id="strdivout6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout6" type="checkbox" id="ckalarmout6" value="checkbox" onClick="checkClick('motion_frm','ckalarmout6')"/>6</div>
		  <div id="strdivout7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout7" type="checkbox" id="ckalarmout7" value="checkbox" onClick="checkClick('motion_frm','ckalarmout7')"/>7</div>
		  <div id="strdivout8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout8" type="checkbox" id="ckalarmout8" value="checkbox" onClick="checkClick('motion_frm','ckalarmout8')"/>8</div>		  </td>
		  <td height="21" colspan="3" align="center" bgcolor="#FFFFFF"><div id="Divtime" class="optimet"><LABEL id="laOutputDuration">报警输出持续时间</LABEL></div><div id="Divvalue" class="optimev"><input name="alarmclear" type="text" class="textmin" id="alarmclear" onKeyPress="event.returnValue=isDigit();" size="4" maxlength="16"  /></div><div id="Divunit" class="optimeu"><LABEL id="laDurationUnit">秒</LABEL></div></td>
		  </tr>
		<tr id="stralarmcapdev">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divcapdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laSnapshot">&nbsp;&nbsp;联动抓拍</LABEL></div>							  </td>
		  <td width="25%" height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivcapdev1" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap" type="checkbox" id="ckcap" value="checkbox" onClick="checkClick('motion_frm','ckcap')"/></div>
		  <div id="strdivcapdev2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap2" type="checkbox" id="ckcap2" value="checkbox" onClick="checkClick('motion_frm','ckcap2')"/>2</div>
		  <div id="strdivcapdev3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap3" type="checkbox" id="ckcap3" value="checkbox" onClick="checkClick('motion_frm','ckcap3')"/>3</div>
		  <div id="strdivcapdev4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap4" type="checkbox" id="ckcap4" value="checkbox" onClick="checkClick('motion_frm','ckcap4')"/>4</div>
		  <div id="strdivcapdev5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap5" type="checkbox" id="ckcap5" value="checkbox" onClick="checkClick('motion_frm','ckcap5')"/>5</div>
		  <div id="strdivcapdev6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap6" type="checkbox" id="ckcap6" value="checkbox" onClick="checkClick('motion_frm','ckcap6')"/>6</div>
		  <div id="strdivcapdev7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap7" type="checkbox" id="ckcap7" value="checkbox" onClick="checkClick('motion_frm','ckcap7')"/>7</div>
		  <div id="strdivcapdev8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap8" type="checkbox" id="ckcap8" value="checkbox" onClick="checkClick('motion_frm','ckcap8')"/>8</div>		  </td>
		  <td width="10%" height="21" align="center" bgcolor="#FFFFFF"><div id="Divcapnum" class="optimev"><input name="capnum" type="text" class="textmin" id="capnum" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		 <div id="Divcapnumunit" class="optimeu"><LABEL id="laSnapshotUnit">张</LABEL></div></td>
		  <td width="24%" height="21" align="center" bgcolor="#FFFFFF">
		<div id="Divcapt" class="optimet2"><LABEL id="laInterval">*抓拍间隔</LABEL></div>
		<div class="optimev"><input name="capclear" type="text" class="textmin" id="capclear" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		<div id="Divsunit" class="optimeu"><LABEL id="laIntervalUnit">秒</LABEL></div></td>
		  <td width="27%" height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivcapd" style="padding:0px; margin:0px; width:23px; float:left; display:none;"><input name="cap_device" type="checkbox" id="cap_device" value="checkbox" onClick="checkClick('motion_frm','cap_device')"/></div><div id="Divsde" style="float:left; width:76px;display:none;"><LABEL id="laSnapDevice">设备存储</LABEL></div>
		  <div id="strdivcape" style="padding:0px; margin:0px; width:23px; float:left;"><input name="cap_email" type="checkbox" id="cap_email" value="checkbox" onClick="checkClick('motion_frm','cap_email')"/></div><div id="Divsemail" style="float:left; width:66px; "><LABEL id="laSnapEmail">发送E-mail</LABEL></div>
		  <div id="strdivcapf" style="padding:0px; margin:0px; width:23px; float:left;"><input name="cap_ftp" type="checkbox" id="cap_ftp" value="checkbox" onClick="checkClick('motion_frm','cap_ftp')"/></div><div id="Divsftp" style="float:left; width:56px;"><LABEL id="laSnapFtp">Ftp上传</LABEL></div></td>
		</tr>
		<tr id="stralarmrecdev">
		  <td height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divrecdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laRecord">&nbsp;&nbsp;联动录像</LABEL></div>							  </td>
		  <td height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivrecdev1" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev" type="checkbox" id="ckalarmrecdev" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev')"/></div>
		  <div id="strdivrecdev2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev2" type="checkbox" id="ckalarmrecdev2" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev2')"/>2</div>
		  <div id="strdivrecdev3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev3" type="checkbox" id="ckalarmrecdev3" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev3')"/>3</div>
		  <div id="strdivrecdev4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev4" type="checkbox" id="ckalarmrecdev4" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev4')"/>4</div>
		  <div id="strdivrecdev5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev5" type="checkbox" id="ckalarmrecdev5" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev5')"/>5</div>
		  <div id="strdivrecdev6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev6" type="checkbox" id="ckalarmrecdev6" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev6')"/>6</div>
		  <div id="strdivrecdev7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev7" type="checkbox" id="ckalarmrecdev7" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev7')"/>7</div>
		  <div id="strdivrecdev8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecdev8" type="checkbox" id="ckalarmrecdev8" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecdev8')"/>8</div>		  </td>
		  <td height="21" align="center" bgcolor="#FFFFFF">&nbsp;</td>
		  <td height="21" align="center" bgcolor="#FFFFFF">
		<div id="Divrect" class="optimet2"><LABEL id="laRecordTime">*录像时间</LABEL></div>
		<div class="optimev"><input name="rectime" type="text" class="textmin" id="rectime" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		<div id="Divrunit" class="optimeu"><LABEL id="laRecordUnit">秒</LABEL></div></td>
		  <td height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivrecd" style="padding:0px; margin:0px; width:23px; float:left; display:none;"><input name="rec_device" type="checkbox" id="rec_device" value="checkbox" onClick="checkClick('motion_frm','rec_device')"/></div><div id="Divrde" style="float:left; width:76px;display:none;"><LABEL id="laRecordDevice">设备存储</LABEL></div>
		  <div id="strdivrece" style="padding:0px; margin:0px; width:23px; float:left; color:#999999;"><input name="rec_email" type="checkbox" id="rec_email" disabled="disabled" value="checkbox" onClick="checkClick('motion_frm','rec_email')"/></div><div id="Divremail" style="float:left; width:66px; "><LABEL id="laRecordEmail">发送E-mail</LABEL></div>
		  <div id="strdivrecf" style="padding:0px; margin:0px; width:23px; float:left;"><input name="rec_ftp" type="checkbox" id="rec_ftp" value="checkbox" onClick="checkClick('motion_frm','rec_ftp')"/></div><div id="Divrftp" style="float:left; width:56px;"><LABEL id="laRecordFtp">Ftp上传</LABEL></div></td>
		</tr>
		<tr id="stralarmrecPC" style="display:none;">
		  <td height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divrecPC" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laRecordPC">&nbsp;&nbsp;PC端录像</LABEL></div>							  </td>
		  <td height="21" colspan="4" align="left" bgcolor="#FFFFFF">
		  <div id="strdivrecpc1" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc" type="checkbox" id="ckalarmrecpc" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc')"/></div>
		  <div id="strdivrecpc2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc2" type="checkbox" id="ckalarmrecpc2" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc2')"/>2</div>
		  <div id="strdivrecpc3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc3" type="checkbox" id="ckalarmrecpc3" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc3')"/>3</div>
		  <div id="strdivrecpc4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc4" type="checkbox" id="ckalarmrecpc4" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc4')"/>4</div>
		  <div id="strdivrecpc5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc5" type="checkbox" id="ckalarmrecpc5" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc5')"/>5</div>
		  <div id="strdivrecpc6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc6" type="checkbox" id="ckalarmrecpc6" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc6')"/>6</div>
		  <div id="strdivrecpc7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc7" type="checkbox" id="ckalarmrecpc7" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc7')"/>7</div>
		  <div id="strdivrecpc8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc8" type="checkbox" id="ckalarmrecpc8" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc8')"/>8</div>		  </td>
		  </tr>
  </table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl90">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
<div id="StrNotice" class="divnotice">
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laAlert1">抓拍时间间隔可以为小数,如:0.5秒,1.5秒等等</LABEL><br />
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laAlert2">当设备上有挂存储器(硬盘、SD卡、U盘)时，联动抓拍、联动录像文件首先存储到存储器，同时根据文件存储方式再做相应的处理。否则会暂存在内存中，然后根据文件存储方式再做相应的处理</LABEL></div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input name="channelnum" type="hidden" id="channelnum" value="1">
</form>
<%outSensorCfgEx();%>
</body>
</html>
