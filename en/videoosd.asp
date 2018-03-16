<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>video</title>
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

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	var strtitle	= $("title").value;
	if(isBlank(strtitle)){
		remarkDisplay("divAlertHTML", "* " + ALERTVIDEOTITLENULL, 3E3, 1);
		$("title").focus();
		return false;
	}
	if(stringLength(strtitle)>63){
		remarkDisplay("divAlertHTML", "* " + ALERTVIDEOTITLEERROR, 3E3, 1);
		$("title").focus();
		$("title").select();
		return false;
	}
	setTimeout(do_submit,0);
}
function btnSettingOSDEx(paramflag, paramcmd, nchan){
	btnSettingEx(paramflag, paramcmd, nchan, 0, 0, '', '');
}
function chgcheck(){
	if($("cktitle").checked==true){
		$("ckuser").disabled	= false;
	}else{
		$("ckuser").checked	= false
		$("ckuser").value		= 0;
		$("ckuser").disabled	= true;
	}
}
function init(){
	ChangeLanguage('../xml/videoosd.xml', m_szLanguage);
	if(lanset != 1){
		$("Divbitrate").style.width= "120px"
		$("Divuser").style.width	= "120px"
	}
	initChannel();
	chgcheck();
	setTimeout("initvideo(0);", 320);
	
	$("btnSave").addEvent("click", Checkfrm);
	return true;
}
</script>
<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(0)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/videoOsdCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">字符叠加</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
		<ul id="show_Chan" style="padding-top:32px;">
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
			<table border="0" width="430" cellspacing="0" cellpadding="0">
               <tr>
                <td valign="top" style="padding-top:8px; padding-bottom:8px;">
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
				<tr>
				  <td width="100" height="35" align="right" id="Tdtitle"><LABEL id="laOSDTitle">视频标题</LABEL></td>
				  <td height="28" align="left"><textarea name="title" rows="3" class="text" id="title" style="width:230px;"></textarea></td>
				</tr>
				<tr>
				  <td height="35" align="right" id="Tdcolor"><LABEL id="laOSDColor">标题颜色</LABEL></td>
				  <td height="28" align="left">
				  <select name="tcolor" class="text" id="tcolor" style="width:230px;">
					<option id="opOSDColor1" value="0">White</option>
					<option id="opOSDColor2" value="1">Black</option>
					<option id="opOSDColor3" value="2">Yellow</option>
					<option id="opOSDColor4" value="3">Red</option>
					<option id="opOSDColor5" value="4">Blue</option>
				   </select></td>
				</tr>
				</table>
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
					<tr>
					  <td height="28">
					  <div id="Divtitle" class="divtitle" style="overflow:hidden;"><LABEL id="laPositionTitle">标题</LABEL></div>
					  <div id="divcktitle" class="divvalue"><input name="cktitle" type="checkbox" id="cktitle" onClick="checkClick('','cktitle');chgcheck();" value="checkbox" />
					  </div></td>
					  <td><img src="images/botton/up.gif" id="imgTitleUp" alt="上" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2001, nchannel-1);"><img src="images/botton/down.gif" id="imgTitleDown" alt="下" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2002, nchannel-1);"><img src="images/botton/left.gif" id="imgTitleLeft" alt="左" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2003, nchannel-1);"><img src="images/botton/right.gif" id="imgTitleRight" alt="右" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2004, nchannel-1);"></td>
				    </tr>
					<tr id="StrIsCodingCIF">
					  <td height="28">
					  <div id="Divdate" class="divtitle"><LABEL id="laPositionDate">日期</LABEL></div>
					  <div id="divckdate" class="divvalue"><input name="ckdate" type="checkbox" id="ckdate" value="checkbox" onClick="checkClick('','ckdate')"/></div>
					  <div id="Divtime" class="divtitle" style="width:36px;"><LABEL id="laPositionTime">时间</LABEL></div>
					   <div id="divcktime" class="divvalue"><input name="cktime" type="checkbox" id="cktime" value="checkbox" onClick="checkClick('vcfg_frm','cktime')"/></div>
					   <div id="Divweek" class="divtitle" style="width:36px;"><LABEL id="laPositionWeek">星期</LABEL></div>
				      <div id="divckweek" class="divvalue"><input name="ckweek" type="checkbox" id="ckweek" value="checkbox" onClick="checkClick('vcfg_frm','ckweek')"/></div></td>
					  <td><img src="images/botton/up.gif" id="imgDateUp" alt="上" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2005, nchannel-1);"><img src="images/botton/down.gif" id="imgDateDown" alt="下" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2006, nchannel-1);"><img src="images/botton/left.gif" id="imgDateLeft" alt="左" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2007, nchannel-1);"><img src="images/botton/right.gif" id="imgDateRight" alt="右" width="19" height="18" class="imgcls" onClick="btnSettingOSDEx(2000, 2008, nchannel-1);">					  </td>
				    </tr>
					
					  <tr id="StrDateFormat">
					  <td height="28" colspan="2"><div id="Divdateformat" class="divtitle" style="margin-right:4px;"><LABEL id="laDateFormat">日期格式</LABEL></div>
					  <select name="dateformat" id="dateformat">
						<option value="0" selected>YYYY-MM-DD</option>
						<option value="1">MM-DD-YYYY</option>
						<option value="2">DD-MM-YYYY</option>
					  </select></td>
					  </tr>
					
				   <tr id="StrCodeRate">
					  <td height="28" colspan="2">
					  <div id="Divbitrate" class="divtitle"><LABEL id="laBitrate">帧率/码率</LABEL></div>
					 <div id="divckbitrate" class="divvalue"> <input name="ckbitrate" type="checkbox" id="ckbitrate" value="checkbox" onClick="checkClick('','ckbitrate')"/></div></td>
				    </tr>
					  
				   <tr id="Strckuser">
					  <td height="28" colspan="2">
					  <div id="Divuser" class="divtitle" style="overflow:hidden; display:inline;"><LABEL id="laUser">用户连接数</LABEL></div>
					  <div id="divckuser" class="divvalue" style="display:inline;"><input name="ckuser" type="checkbox" id="ckuser" onClick="checkClick('vcfg_frm','ckuser')" value="0"/></div>					 </td>
				    </tr>
				</table>				</td>
              </tr>
               <tr id="Trautoload" style="display:none;">
                 <td valign="top" style="padding:0px;">
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
				<tr>
				  <td colspan="2"><LABEL id="laAutoLoad">&nbsp;&nbsp;&nbsp;&nbsp;自动更新参数</LABEL></td>
				  </tr>
				<tr>
				  <td width="86" align="right" id="Tdtxtautoload"><LABEL id="laAutoLoadText">自动更新文件</LABEL></td>
				  <td align="left"><input name="ckautoload" type="checkbox" id="ckautoload" value="0" onClick="checkClick('outcfg_frm','ckautoload')" /></td>
				</tr>
				<tr>
				  <td width="86" align="right" id="Tdtxttitle"><LABEL id="laAutoLoadTextAddr">文本地址</LABEL></td>
				  <td align="left"><input name="txttitle" type="text" class="text" id="txttitle" style="width:210px;" value="http://www.likam.it/text.txt" maxlength="63"></td>
				</tr>
				<tr>
				  <td width="86" align="right" id="Tdpicautoload"><LABEL id="laAutoLoadPic">自动更新图片</LABEL></td>
				  <td align="left"><input name="ckautoloadpic" type="checkbox" id="ckautoloadpic" value="0" onClick="checkClick('outcfg_frm','ckautoloadpic')" /></td>
				</tr>
				<tr>
				  <td align="right" id="Tdpictitle"><LABEL id="laAutoLoadPicAddr">图片地址</LABEL></td>
				  <td align="left"><input name="pictitle" type="text" class="text" id="pictitle" style="width:210px;" value="http://www.likam.it/banner.bmp" maxlength="63"></td>
				</tr>
				<tr>
				  <td align="right" id="Tdloadtime"><LABEL id="laAutoLoadInterval">更新间隔</LABEL></td>
				  <td align="left"><input name="autoloadtime" type="text" class="text" id="autoloadtime" style="width:38px;" value="360" maxlength="4">
				    S</td>
				  </tr>
				<tr>
				  <td colspan="2"><LABEL id="laAlert">&nbsp;&nbsp;&nbsp;&nbsp;文字信息要放在左下角的位置，文字信息包括两行，最大字符不超过50个，支持txt格式。
                   <br />
&nbsp;&nbsp;&nbsp;&nbsp;横幅图片的位置放在右下角，图片最大不超过320px *150px，支持BMP 24格式。
                   <br />
&nbsp;&nbsp;&nbsp;更新间隔要求大于等于60秒。</LABEL></td>
				  </tr>
				</table>				</td>
              </tr>
           </table>
				</li>
			</ul>
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn set_btn_pl430" style="width:156px;">
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</form>
<%outVideoOsdCfgEx();%>
</body>
</html>
