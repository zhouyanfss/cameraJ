<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定时录像</title>
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
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/record.xml', m_szLanguage);
	initChannel();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/recordCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">录像计划</LABEL></li>
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
				<img src="./images/botton/8.jpg" alt="8" id="channel8" name="channel8" onClick="ChangeChannel(8,'');" style="cursor:pointer; display:none;">
				</div>
				<div id="divChannelSync"><input name="copysync" type="checkbox" id="copysync" value="0" onClick="checkClick('audio_frm','copysync')"></div>
				<div id="divChannelSyncTitle"><LABEL id="laChannelSync">复制到所有通道</LABEL></div>
				</td>
                </tr>
           </table>
				</li>
			</ul>

			<ul id="show_Main">
				<li class="vrig" id="laMain">
			<table width="520" cellpadding="5" cellspacing="1">
	<tr>
	  <td width="136" height="19" align="right" id="Tdtime1"><LABEL id="laRecordTime1">布防时间段1</LABEL></td>
	  <td align="left"><input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('record_frm','ckevery')" />
		<input name="begh1" type="text" class="textmin" id="begh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm1" type="text" class="textmin" id="begm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
--
<input name="endh1" type="text" class="textmin" id="endh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="endm1" type="text" class="textmin" id="endm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
	</tr>
	<tr>
	  <td height="25" align="right" id="Tdtime2"><LABEL id="laRecordTime2">布防时间段2</LABEL></td>
	  <td align="left"><input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('record_frm','ckevery2')" />
	  <input name="begh12" type="text" class="textmin" id="begh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="begm12" type="text" class="textmin" id="begm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
--
<input name="endh12" type="text" class="textmin" id="endh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
:
<input name="endm12" type="text" class="textmin" id="endm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
	</tr>
 		<tr>
		  <td height="23" align="right" ><LABEL id="laStorageMode">录像文件存储</LABEL></td>
		  <td height="23" align="left" >
				<div id="strdivrecl" style="padding:0px; margin:0px; width:21px; float:left; display:none;"><input name="rec_local" type="checkbox" id="rec_local" value="checkbox" onClick="checkClick('record_frm','rec_local')"/></div><div id="Divpc" style="float:left; width:76px;display:none;"><LABEL id="laRecordPC">PC存储</LABEL></div>
				<div id="strdivrecd" style="padding:0px; margin:0px; width:21px; float:left;display:none;"><input name="rec_device" type="checkbox" id="rec_device" value="checkbox" onClick="checkClick('record_frm','rec_device')"/></div><div id="Divde" style="float:left; width:76px;display:none;"><LABEL id="laRecordDevice">设备存储</LABEL></div>
				<div id="strdivrece" style="padding:0px; margin:0px; width:21px; float:left; color:#999999;"><input name="rec_email" type="checkbox" id="rec_email" value="checkbox" disabled="disabled" onClick="checkClick('record_frm','rec_email')"/></div><div id="Divemail" style="float:left; width:76px; "><LABEL id="laRecordEmail">发送E-mail</LABEL></div>
				<div id="strdivrecf" style="padding:0px; margin:0px; width:21px; float:left;"><input name="rec_ftp" type="checkbox" id="rec_ftp" value="checkbox" onClick="checkClick('record_frm','rec_ftp')"/></div><div id="Divftp" style="float:left; width:76px;"><LABEL id="laRecordFtp">Ftp上传</LABEL></div>
		  </td>
		</tr>
	 </table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn set_btn_pl140">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div id="StrNotice" class="divnotice">
		<span style="color:#FF0000; padding-right:5px;">*</span><LABEL id="laRecordAlert">默认只保存在设备端的存储设备里</LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>				
</form>
<%outRecordCfgEx();%>
</body>
</html>
