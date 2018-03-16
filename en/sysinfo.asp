<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBasic</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

</head>
<script language="javascript">
function Checkfrm(){
	var sys_name=$("sys_name").value;
	if(isBlank(sys_name)){
		remarkDisplay("divAlertHTML", "* " + ALERTDEVICENAMENULL, 3E3, 1);
		$("sys_name").focus();
		return false;
	}
	if(stringLength(sys_name)>31){
		remarkDisplay("divAlertHTML", "* " + ALERTDEVICENAMEERROR, 3E3, 1);
		$("sys_name").focus();
		$("sys_name").select();
		return false;
	}
	
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function enablepal(){
	var tmpdev	= parseInt(getCookies("DEVICEIPC"));
	if(tmpdev==0){
		$("Tdchan").style.display = "";
	}
}
function init(){
	ChangeLanguage('../xml/sysinfo.xml', m_szLanguage);
	enablepal();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/sysInfoCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">基本参数</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td width="160" height="21" align="right" id="Tddevname"><LABEL id="laSystemName">设备名称</LABEL></td>
						  <td height="21" align="left"><input name="sys_name" type="text" class="text" id="sys_name" style="width:186px;" maxlength="32" /></td>
</tr>
						<tr id="Tdpal">
						  <td height="21" align="right" id="Tdpanntsc"><LABEL id="laSystemPal">VO环出制式</LABEL></td>
						  <td height="21" align="left">
						  <select name="sys_pal" id="sys_pal" class="text" style="width:186px;">
							<option value="0" selected="selected">PAL</option>
							<option value="1">NTSC</option>
						  </select></td>
						</tr>
						<tr id="Tdlanguage">
						  <td height="21" align="right" id="Tdlanguage"><LABEL id="laSystemLanguage">设备语言</LABEL></td>
						  <td height="21" align="left">
						  <select name="sys_language" id="sys_language" class="text" style="width:186px;">
							<option id="opLanguage1" value="0" >English</option>
							<option id="opLanguage2" value="1" selected="selected">简体中文</option>
						  </select></td>
						</tr>
						<tr id="Tdchan" style="display:none;">
						  <td height="21" align="right" id="Tdchannel"><LABEL id="laChannel">路&nbsp;&nbsp;数</LABEL></td>
						  <td width="500" height="21" align="left"><input name="sys_channel_count" type="text" disabled="disabled" class="text distext" id="sys_channel_count" style="width:186px;" value="1" /></td>
						</tr>
						<tr>
						  <td align="right" valign="top" id="Tddevid"><LABEL id="laDeviceID">设备编号</LABEL></td>
						  <td height="21" align="left" valign="top"><input name="sys_device_id" type="text" disabled="disabled" class="text distext" id="sys_device_id" style="width:186px;" /></td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="top" id="Tdversion"><LABEL id="laVersion">内核版本</LABEL></td>
						  <td align="left" valign="top"><input name="sys_ver" type="text" disabled="disabled" class="text distext" id="sys_ver" style="width:186px;" value="4.2.0.0 " /></td>
						</tr>
						<tr style="display:none;">
						  <td height="21" align="right" valign="top" id="Tdstate"><LABEL id="laState">状态信息</LABEL></td>
						  <td align="left" valign="top"><input name="sysstate" type="text" disabled="disabled" class="text distext" id="sysstate" style="width:186px;" value="OK " /></td>
						</tr>
							<tr>
						  <td height="21" align="right" valign="top"><LABEL id="laWebVersion">WEB版本</LABEL></td>
						  <td align="left" valign="top">
						    <input name="page_ver" type="text" disabled="disabled" id="page_ver" class="text distext" style="width:186px;" value="2.1.0.2" />
						  </td>
						</tr>
              </table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn set_btn_pl166">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div id="StrNotice" class="divnotice">
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice">修改完设备语言,请关闭浏览器重新登录.</LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>				
</form>
<%outSysInfoCfgEx();%>
</body>
</html>
