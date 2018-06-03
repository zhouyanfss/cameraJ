<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>移动侦测区域设置</title>
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
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
<style type="text/css">
<!--
.inputwidht{width:21px;height:18px;}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	if($s("ismask").value=="1")
		sumbitok();
	else
		$s("BtnSubmit").click();
	//saveCookie("SaveYes","ok",7);
	return true;
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
	ChangeLanguage('../xml/motion.xml', m_szLanguage);
	initChannel();
	enablecount();
	
	setTimeout("initvideo(0);", 320);
	if(0==parseInt($p("bCenterWeb").value)){
		$s("stralarmrecPC").style.display	= "none";
	}else{
		$s("stralarmrecPC").style.display	= "";
	}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(1)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>
<script language="javascript" for="WebCMS" event="CBK_GetArea(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight)">
	SetGetArea(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight);
</script>
<div style="z-index: 0; position:absolute; margin:0px; padding:0px; top:460px; left: 210px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%;" id="DivUpdateAlert">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center 
bgColor=#ffffe7 border=1>
  <TBODY>
  <TR>
  <TD align=middle height=56 >
<form name=loading id="loading" style="margin:0px; padding:0px;">
 <p align=center> 
 <div style="text-align:center; height:38px; padding-top:18px;" id="Divloading" ><img src="images/loading.gif" width="32" height="32"></div>
 <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:12px;" id="Divtext" size="2" face="Arial"><LABEL id="laDateSubmitWaittin">数据提交中，请稍等......</LABEL></div>
 </p>
</form>
  </TD></TR>
  </TBODY></TABLE></div>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/motionCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
		<ul id="show_Chan" style="padding-top:32px;">
			<li id="laChan">
		  <table id="TableChan" border="0" width="520" cellspacing="0" cellpadding="0" style="margin-bottom:12px; display:none;">
		   <tr>
			<td height="32" valign="middle">
			<div id="divChannelTitle"><LABEL id="laChannel"></LABEL></div>
			<div id="divChannelOption"><img src="./images/botton/1.jpg" alt="1" name="channel1" width="26" height="21" id="channel1" style="cursor:pointer;" onClick="ChangeChannel(1,'');">
			<img src="./images/botton/2.jpg" alt="2" id="channel2" name="channel2" onClick="ChangeChannel(2,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/3.jpg" alt="3" id="channel3" name="channel3" onClick="ChangeChannel(3,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/4.jpg" alt="4" id="channel4" name="channel4" onClick="ChangeChannel(4,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/5.jpg" alt="5" id="channel5" name="channel5" onClick="ChangeChannel(5,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/6.jpg" alt="6" id="channel6" name="channel6" onClick="ChangeChannel(6,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/7.jpg" alt="7" id="channel7" name="channel7" onClick="ChangeChannel(7,'');" style="cursor:pointer; display:none;">
			<img src="./images/botton/8.jpg" alt="8" id="channel8" name="channel8" onClick="ChangeChannel(8,'');" style="cursor:pointer; display:none;">				</div>
			<div id="divChannelSync"><input name="copysync" type="checkbox" id="copysync" value="0" onClick="checkClick('audio_frm','copysync')"></div>
			<div id="divChannelSyncTitle"><LABEL id="laChannelSync"></LABEL></div>
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
				<table width="404" border="0" cellpadding="3" cellspacing="1">
				  <tr>
                    <td colspan="2" align="center">
<a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfo()" id="btnMaskAreaSet"><LABEL id="laSet"></LABEL></a>
<a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselall()" id="btnMaskAll" disabled="disabled"><LABEL id="laAll"></LABEL></a>
<a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselclr()" id="btnMaskClear" disabled="disabled"><LABEL id="laCls"></LABEL></a>						</td>
                  </tr>
					<tr>
					  <td height="25" colspan="2" align="left" >					  </td>
				  </tr>
					<tr>
					  <td height="19" align="right"><LABEL id="laSensitivity"></LABEL></td>
					  <td align="left">
					  <select name="sens" id="sens" style="width:56px;">
					    <option value="0">1</option>
					    <option value="1">2</option>
					    <option value="2">3</option>
					    <option value="3">4</option>
					    <option value="4">5</option>
					    </select><span style="color:#FF0000;">*</span></td>
					</tr>
					<tr>
					  <td height="19" align="right"><LABEL id="laMotion"></LABEL></td>
					  <td align="left">
					  	<input name="ckdetect" type="checkbox" id="ckdetect" value="0" onClick="$s('ckshelter').checked=false; $s('ckshelter').value='0'; checkClick('motion_frm','ckdetect');"/>
					     <input name="ckshelter" type="checkbox" id="ckshelter" value="0" onClick="$s('ckdetect').checked=false; $s('ckdetect').value='0'; checkClick('motion_frm','ckshelter');" style="display:none;"/></td>
					</tr>
					<tr>
					  <td width="35%" height="19" align="right" id="Tdtime1"><LABEL id="laTime1">1</LABEL></td>
					  <td width="65%" align="left"><input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('record_frm','ckevery')" />
                        <input name="begh1" type="text" class="textmin" id="begh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm1" type="text" class="textmin" id="begm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
--
<input name="endh1" type="text" class="textmin" id="endh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="endm1" type="text" class="textmin" id="endm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
					</tr>
					<tr>
					  <td height="25" align="right" id="Tdtime2"><LABEL id="laTime2">2</LABEL></td>
					  <td align="left"><input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('record_frm','ckevery2')" />
					  <input name="begh12" type="text" class="textmin" id="begh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		:
		<input name="begm12" type="text" class="textmin" id="begm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		--
		<input name="endh12" type="text" class="textmin" id="endh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		:
		<input name="endm12" type="text" class="textmin" id="endm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
					</tr>
					<tr style="display:none;">
					  <td height="19" align="right" id="Tdtime3"><LABEL id="laTime3">3</LABEL></td>
						  <td align="left"><input name="cksun" type="checkbox" id="cksun" value="checkbox" onClick="checkClick('record_frm','cksun')"/>
                            <input name="begh2" type="text" class="textmin" id="begh2" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm2" type="text" class="textmin" id="begm2" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" />
--
<input name="endh2" type="text" class="textmin" id="endh2" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" />
:
<input name="endm2" type="text" class="textmin" id="endm2" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" /></td>
					</tr>
					<tr style="display:none;">
					  <td height="25" align="right" id="Tdtime4"><LABEL id="laTime4">4</LABEL></td>
					  <td align="left"><input name="cksun2" type="checkbox" id="cksun2" value="checkbox" onClick="checkClick('record_frm','cksun2')"/>
										
						  <input name="begh22" type="text" class="textmin" id="begh22" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
		:
		<input name="begm22" type="text" class="textmin" id="begm22" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" />
		--
		<input name="endh22" type="text" class="textmin" id="endh22" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" />
		:
		<input name="endm22" type="text" class="textmin" id="endm22" onKeyPress="event.returnValue=isDigit();" size="3" maxlength="2" /></td>
					</tr>
					<tr>
					  <td height="15" colspan="2"></td>
					</tr>
                </table>
				</li>
			</ul>
		</div>
	</div>
	<div class="maintab" style=" margin-top:12px; padding-left:12px;">
	<table width="823" border="1" cellpadding="5" cellspacing="1" bgcolor="#999999" style="margin:0px;">
		<tr>
		  <td height="21" colspan="5" bgcolor="#FFFFFF"><LABEL id="laLinkageAlarm"></LABEL></td>
	    </tr>
		<tr id="stralarmemail">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF"><div id="Divsendemail" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laEmail">E-mail</LABEL></div></td>
		  <td height="21" colspan="4" align="left" bgcolor="#FFFFFF"><input name="alarmoutemail" type="checkbox" id="alarmoutemail" value="checkbox" onClick="checkClick('motion_frm','alarmoutemail')"/></td>
	    </tr>
		<tr id="stralarmioout">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF"><div id="divoutput" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laIOOutput">&nbsp;&nbsp;IO</LABEL></div></td>
		  <td width="8%" height="21" align="left" bgcolor="#FFFFFF"><div id="strdivout1" style="padding:0px; margin:0px; width:36px; float:left;"><input name="ckalarmout" type="checkbox" id="ckalarmout" value="checkbox" onClick="checkClick('motion_frm','ckalarmout')"/></div>
			<div id="strdivout2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout2" type="checkbox" id="ckalarmout2" value="checkbox" onClick="checkClick('motion_frm','ckalarmout2')"/>2</div>	
		  <div id="strdivout3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout3" type="checkbox" id="ckalarmout3" value="checkbox" onClick="checkClick('motion_frm','ckalarmout3')"/>3</div>
		  <div id="strdivout4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout4" type="checkbox" id="ckalarmout4" value="checkbox" onClick="checkClick('motion_frm','ckalarmout4')"/>4</div>
		  <div id="strdivout5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout5" type="checkbox" id="ckalarmout5" value="checkbox" onClick="checkClick('motion_frm','ckalarmout5')"/>5</div>
		  <div id="strdivout6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout6" type="checkbox" id="ckalarmout6" value="checkbox" onClick="checkClick('motion_frm','ckalarmout6')"/>6</div>
		  <div id="strdivout7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout7" type="checkbox" id="ckalarmout7" value="checkbox" onClick="checkClick('motion_frm','ckalarmout7')"/>7</div>
		  <div id="strdivout8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmout8" type="checkbox" id="ckalarmout8" value="checkbox" onClick="checkClick('motion_frm','ckalarmout8')"/>8</div>		  </td>
		  <td height="21" colspan="1" align="center" bgcolor="#FFFFFF"><div id="Divtime" class="optimet"><LABEL id="laOutputDuration"></LABEL></div><div id="Divvalue" class="optimev"><input name="alarmclear" type="text" class="textmin" id="alarmclear" onKeyPress="event.returnValue=isDigit();" size="4" maxlength="16"  /></div><div id="Divunit" class="optimeu"><LABEL id="laDurationUnit"></LABEL></div></td>
		    <td align="right" bgcolor="#FFFFFF" ><LABEL id="btnSensorType02"></LABEL></td>
<td colspan="1" bgcolor="#FFFFFF" >
	<select name="type_motionIO" class="select3" id="type_motionIO" style="width:80px; min-width:80px;">
	<option id="opSensorType1" value="0"></option>
	<option id="opSensorType2" value="1"></option>
	</select>
	<span style="color:#FF0000;">*</span>
</td>
	    </tr>
		<tr id="stralarmcapdev">
		  <td width="14%" height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divcapdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laSnapshot">&nbsp;&nbsp;</LABEL></div>							  </td>
		  <td width="8%" height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivcapdev1" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap" type="checkbox" id="ckcap" value="checkbox" onClick="checkClick('motion_frm','ckcap')"/></div>
		  <div id="strdivcapdev2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap2" type="checkbox" id="ckcap2" value="checkbox" onClick="checkClick('motion_frm','ckcap2')"/>2</div>
		  <div id="strdivcapdev3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap3" type="checkbox" id="ckcap3" value="checkbox" onClick="checkClick('motion_frm','ckcap3')"/>3</div>
		  <div id="strdivcapdev4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap4" type="checkbox" id="ckcap4" value="checkbox" onClick="checkClick('motion_frm','ckcap4')"/>4</div>
		  <div id="strdivcapdev5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap5" type="checkbox" id="ckcap5" value="checkbox" onClick="checkClick('motion_frm','ckcap5')"/>5</div>
		  <div id="strdivcapdev6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap6" type="checkbox" id="ckcap6" value="checkbox" onClick="checkClick('motion_frm','ckcap6')"/>6</div>
		  <div id="strdivcapdev7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap7" type="checkbox" id="ckcap7" value="checkbox" onClick="checkClick('motion_frm','ckcap7')"/>7</div>
		  <div id="strdivcapdev8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckcap8" type="checkbox" id="ckcap8" value="checkbox" onClick="checkClick('motion_frm','ckcap8')"/>8</div>		  </td>
		  <td width="28%" height="21" align="center" bgcolor="#FFFFFF"><div id="Divcapnum" class="optimev"><input name="capnum" type="text" class="textmin" id="capnum" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		 <div id="Divcapnumunit" class="optimeu"><LABEL id="laSnapshotUnit"></LABEL></div></td>
		  <td width="27%" height="21" align="center" bgcolor="#FFFFFF">
		<div id="Divcapt" class="optimet2"><LABEL id="laInterval">*</LABEL></div>
		<div class="optimev"><input name="capclear" type="text" class="textmin" id="capclear" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		<div id="Divsunit" class="optimeu"><LABEL id="laIntervalUnit"></LABEL></div></td>
		  <td width="23%" height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivcapd" style="padding:0px; margin:0px; width:23px; float:left; display:none;"><input name="cap_device" type="checkbox" id="cap_device" value="checkbox" onClick="checkClick('motion_frm','cap_device')"/></div><div id="Divsde" style="float:left; width:76px;display:none;"><LABEL id="laSnapDevice"></LABEL></div>
		  <div id="strdivcape" style="padding:0px; margin:0px; width:23px; float:left;"><input name="cap_email" type="checkbox" id="cap_email" value="checkbox" onClick="checkClick('motion_frm','cap_email')"/></div><div id="Divsemail" style="float:left; width:66px; "><LABEL id="laSnapEmail">E-mail</LABEL></div>
		  <div id="strdivcapf" style="padding:0px; margin:0px; width:23px; float:left;"><input name="cap_ftp" type="checkbox" id="cap_ftp" value="checkbox" onClick="checkClick('motion_frm','cap_ftp')"/></div><div id="Divsftp" style="float:left; width:56px;"><LABEL id="laSnapFtp">Ftp</LABEL></div></td>
		</tr>
		<tr id="stralarmrecdev">
		  <td height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divrecdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laRecord">&nbsp;&nbsp;</LABEL></div>							  </td>
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
		<div id="Divrect" class="optimet2"><LABEL id="laRecordTime">*</LABEL></div>
		<div class="optimev"><input name="rectime" type="text" class="textmin" id="rectime" onKeyPress="event.returnValue=isDigit();" maxlength="16"  /></div>
		<div id="Divrunit" class="optimeu"><LABEL id="laRecordUnit"></LABEL></div></td>
		  <td height="21" align="left" bgcolor="#FFFFFF">
		  <div id="strdivrecd" style="padding:0px; margin:0px; width:23px; float:left; display:none;"><input name="rec_device" type="checkbox" id="rec_device" value="checkbox" onClick="checkClick('motion_frm','rec_device')"/></div><div id="Divrde" style="float:left; width:76px;display:none;"><LABEL id="laRecordDevice"></LABEL></div>
		  <div id="strdivrece" style="padding:0px; margin:0px; width:23px; float:left; color:#999999;"><input name="rec_email" type="checkbox" id="rec_email" disabled="disabled" value="checkbox" onClick="checkClick('motion_frm','rec_email')"/></div><div id="Divremail" style="float:left; width:66px; "><LABEL id="laRecordEmail">E-mail</LABEL></div>
		  <div id="strdivrecf" style="padding:0px; margin:0px; width:23px; float:left;"><input name="rec_ftp" type="checkbox" id="rec_ftp" value="checkbox" onClick="checkClick('motion_frm','rec_ftp')"/></div><div id="Divrftp" style="float:left; width:56px;"><LABEL id="laRecordFtp">Ftp</LABEL></div></td>
		</tr>
		<tr id="stralarmrecPC" style="display:none;">
		  <td height="21" align="right" bgcolor="#FFFFFF">
		  <div id="divrecPC" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL id="laRecordPC">&nbsp;&nbsp;PC</LABEL></div>							  </td>
		  <td height="21" colspan="4" align="left" bgcolor="#FFFFFF">
		  <div id="strdivrecpc1" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc" type="checkbox" id="ckalarmrecpc" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc')"/></div>
		  <div id="strdivrecpc2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc2" type="checkbox" id="ckalarmrecpc2" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc2')"/>2</div>
		  <div id="strdivrecpc3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc3" type="checkbox" id="ckalarmrecpc3" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc3')"/>3</div>
		  <div id="strdivrecpc4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc4" type="checkbox" id="ckalarmrecpc4" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc4')"/>4</div>
		  <div id="strdivrecpc5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc5" type="checkbox" id="ckalarmrecpc5" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc5')"/>5</div>
		  <div id="strdivrecpc6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc6" type="checkbox" id="ckalarmrecpc6" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc6')"/>6</div>
		  <div id="strdivrecpc7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc7" type="checkbox" id="ckalarmrecpc7" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc7')"/>7</div>
		  <div id="strdivrecpc8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="ckalarmrecpc8" type="checkbox" id="ckalarmrecpc8" value="checkbox" onClick="checkClick('motion_frm','ckalarmrecpc8')"/>8</div></td>
	    </tr>
		<tr>
		 <td align="right" bgcolor="#FFFFFF" ><LABEL id="lavadio"></LABEL></td>
		  <td colspan="4" bgcolor="#FFFFFF" >
			 <input name="alarmAudioOut" type="checkbox" id="alarmAudioOut" value="0" onClick="checkClick('net_frm','alarmAudioOut');"/>
		  </td>
		</tr>
  </table>
	</div>

    <div class="foottab">
		<div class="set_btn set_btn_pl90">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
<div id="StrNotice" class="divnotice">
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laAlert1"></LABEL><br />
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laAlert2"></LABEL><br /><span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laAlert3"></LABEL></div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input name="BtnSubmit" type="submit" class="button" id="BtnSubmit"  style="width:86px; display:none;" value="Submit"/>
<input name="nLeft1" type="hidden" id="nLeft1" value="0" />
<input name="nTop1" type="hidden" id="nTop1" value="0" />
<input name="nWidth1" type="hidden" id="nWidth1" value="0" />
<input name="nHeight1" type="hidden" id="nHeight1" value="0" />
<input name="nLeft2" type="hidden" id="nLeft2" value="0" />
<input name="nTop2" type="hidden" id="nTop2" value="0" />
<input name="nWidth2" type="hidden" id="nWidth2" value="0" />
<input name="nHeight2" type="hidden" id="nHeight2" value="0" />
<input name="nLeft3" type="hidden" id="nLeft3" value="0" />
<input name="nTop3" type="hidden" id="nTop3" value="0" />
<input name="nWidth3" type="hidden" id="nWidth3" value="0" />
<input name="nHeight3" type="hidden" id="nHeight3" value="0" />
<input name="nLeft4" type="hidden" id="nLeft4" value="0" />
<input name="nTop4" type="hidden" id="nTop4" value="0" />
<input name="nWidth4" type="hidden" id="nWidth4" value="0" />
<input name="nHeight4" type="hidden" id="nHeight4" value="0" />				 
<input name="MAnum" type="hidden" id="MAnum" value="0">
<input name="ismask" type="hidden" id="ismask" value="0">
<input name="islens" type="hidden" id="islens" value="0">
<input name="fanzhuan" type="hidden" id="fanzhuan" value="0" />	
<input name="jingxiang" type="hidden" id="jingxiang" value="0" />	
<input name="xuanzhuan" type="hidden" id="xuanzhuan" value="0" />	
<input name="nEncWidth" type="hidden" id="nEncWidth" value="0" />	
<input name="nEncHeight" type="hidden" id="nEncHeight" value="0" />	
</form>
<%outMotionCfgEx();%>
</body>
</html>
