<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设备主动连接中心设置</title>
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
	if(bReboot==1&&window.confirm(ALERTREBOOTCFM)==false) {return false;}
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function altReboot(){bReboot=1;}
function init(){
	ChangeLanguage('../xml/netcenter.xml', m_szLanguage);
	attachLimit("centerport",1,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netCenterCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">中心连接</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="520" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="160" height="18" align="right" valign="middle" id="Tdcenter"><LABEL id="laEnable">开关</LABEL></td>
                  <td height="18" colspan="2" align="left" valign="middle"><input name="ckcenter" type="checkbox" id="ckcenter" value="0" onClick="checkClick('net_frm','ckcenter');altReboot();" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdurl"><LABEL id="laServerURL">服务器地址</LABEL></td>
                  <td height="18" align="left" valign="middle" colspan="2"><input name="centeraddr" type="text" class="text" id="centeraddr" maxlength="32" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdport"><LABEL id="laServerPort">服务器端口</LABEL></td>
                  <td height="18" align="left" valign="middle" colspan="2"><input name="centerport" type="text" class="text" id="centerport" maxlength="32" /></td>
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
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</form>
<%outNetCenterCfgEx();%>
</body>
</html>
