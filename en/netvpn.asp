<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net VPN</title>
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
	ChangeLanguage('../xml/netvpn.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netVPNCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">VPN 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="160" height="21" align="right" id="Tdvpn"><LABEL id="laEnable">开关</LABEL></td>
                  <td height="21" align="left"><input name="ckvpn" id="ckvpn" type="checkbox" onClick="checkClick('outcfg_frm','ckvpn')" value="0" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdurl"><LABEL id="laServerURL">服务器地址</LABEL></td>
                  <td height="21" align="left"><input name="vpnurl" type="text" class="text" id="vpnurl" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdname"><LABEL id="laUserName">用户名</LABEL></td>
                  <td height="21" align="left"><input name="vpnuname" type="text" class="text" id="vpnuname" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdpassword"><LABEL id="laPassword">密码</LABEL></td>
                  <td height="21" align="left"><input name="vpnpsw" type="password" class="text" id="vpnpsw" style="width:150px;" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdip"><LABEL id="laIP">&nbsp; IP</LABEL></td>
                  <td height="21" align="left"><input name="vpnip" type="text" class="text" id="vpnip" style="color:#999999;" value="127.0.0.1" readonly="ture"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdstatus"><LABEL id="laStatus">状态</LABEL></td>
                  <td height="21" align="left"><input name="vpnstatus" type="text" class="text" id="vpnstatus" style="color:#999999;" value="waiting..." readonly="ture"  /></td>
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
<%outNetVPNCfgEx();%>
</body>
</html>
