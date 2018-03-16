<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetPPPOE</title>
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
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/netpppoe.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netPPPOECfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">PPPOE 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td width="160" height="21" align="right" valign="middle" id="Tdpppoe"><LABEL id="laEnable">开关</LABEL></td>
						  <td height="21" align="left" valign="middle">
					      <input name="ckpppoe" type="checkbox" id="ckpppoe" value="0" onClick="checkClick('net_frm','ckpppoe')" /></td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdaddr"><LABEL id="laIP">IP</LABEL></td>
						  <td height="18" align="left" colspan="2" valign="middle"><input name="pppoeaddr" type="text" disabled="disabled" class="text distext" id="pppoeaddr" maxlength="32" /></td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdname"><LABEL id="laName">用户名</LABEL></td>
						  <td height="18" align="left" colspan="2" valign="middle"><input name="pppoename" type="text" class="text" id="pppoename" maxlength="32" /></td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdpassword"><LABEL id="laPassword">密码</LABEL></td>
						  <td height="18" align="left" colspan="2" valign="middle"><input name="pppoepassword" type="password" class="text" id="pppoepassword" maxlength="32" style="width:150px;" /></td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdonlinetime"><LABEL id="laOnlineTime">在线时间</LABEL></td>
						  <td height="18" align="left" colspan="2" valign="middle"><input name="onlinetime" type="text" disabled="disabled" class="text distext" id="onlinetime" maxlength="16" /></td>
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
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"><div id="StrAlertDiv"></div></div>
		</div>
	</div>
</div>
</form>
<%outNetPPPOECfgEx();%>
</body>
</html>
