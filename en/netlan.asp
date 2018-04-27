<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetLAN</title>
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
var IPV6 = false;
function displayMac(){
	if($("ckmac").checked){$("mac").value.split("-").each(function(a,b){$("Mac"+b).disabled=""});
	}else{$("mac").value.split("-").each(function(a,b){$("Mac"+b).disabled="disabled"});}
}
function altReboot(){bReboot=1;}
function Checkfrm(){
	if(window.confirm(ALERTREBOOTCFM)==false) {return false;}
	if($("ckdhcp").checked==true){$("mac").disabled = false;setTimeout(do_submit,0);return true;}
	reinitIP("ip", "ip"); reinitIP("mk", "smask"); reinitIP("gt", "ngate"); reinitIP("mp", "mulip"); reinitIP("dns", "dns"); reinitIP("db", "dnsback");
	$("mac").value=$("Mac0").value+"-"+$("Mac1").value+"-"+$("Mac2").value+"-"+$("Mac3").value+"-"+$("Mac4").value+"-"+$("Mac5").value; 
	var ipaddr = $("ip").value;
	var mask = $("smask").value;
	var gate = $("ngate").value;
	var mac = $("mac").value;
	var mulip = $("mulip").value;
	var mulport = $("mulport").value;
	var dns = $("dns").value;
	if(!checkIp(ipaddr)){remarkDisplay("divAlertHTML", "* " + ALERTIPERROR, 3E3, 1); return false;}
	if(ipaddr=="127.0.0.1"){remarkDisplay("divAlertHTML", "* " + ALERTIPERROR, 3E3, 1);	return false;}
    if(!checkIp(mask)){remarkDisplay("divAlertHTML", "* " + ALERTMASKERROR, 3E3, 1); return false;}
	if(!checkIp(gate)){remarkDisplay("divAlertHTML", "* " + ALERTGATEWAYERROR, 3E3, 1);	return false;}
	if(!mac.match("^([0-9a-fA-F]{2})(-[0-9a-fA-F]{2}){5}$")){remarkDisplay("divAlertHTML", "* " + ALERTMACERROR, 3E3, 1); return false;}
	if(!checkIp(dns)){remarkDisplay("divAlertHTML", "* " + ALERTDNSERROR, 3E3, 1); return false;}
	$("mac").disabled = "";
	//saveCookie("SaveYes","ok",7);
	
	setTimeout(do_submit,0);
	return false;
}
function enabledhcp(a){	//启用DHCP则填写IP无效
  if(a==4){
	if($("ckdhcp").checked==true){
		"1.1.1.1".split(".").each(function(a,b){$("ip"+b).disabled="disabled"});
		"1.1.1.1".split(".").each(function(a,b){$("mk"+b).disabled="disabled"});
		"1.1.1.1".split(".").each(function(a,b){$("gt"+b).disabled="disabled"});
	}else{
		"1.1.1.1".split(".").each(function(a,b){$("ip"+b).disabled=""});
		"1.1.1.1".split(".").each(function(a,b){$("mk"+b).disabled=""});
		"1.1.1.1".split(".").each(function(a,b){$("gt"+b).disabled=""});
	}
  }else{
 	if($("ckdhcp6").checked==true){
		setDisabled("ip6", 1);setDisabled("ngate6", 1);
	}else{
		setDisabled("ip6", 0);setDisabled("ngate6", 0);
	}
  }
}
function selectVersion(){$("ipversion").selectedIndex==0?($("trIPV4Con").style.display="block",$("trIPV4DHCP").style.display="block",$("trIPV6Con").style.display="none",$("trIPV6DHCP").style.display="none"):($("trIPV6Con").style.display="block",$("trIPV6DHCP").style.display="block",$("trIPV4Con").style.display="none",$("trIPV4DHCP").style.display="none")}
function init(){
	ChangeLanguage('../xml/netlan.xml', m_szLanguage);
	initIP("ip", $("ip").value); initIP("mk", $("smask").value); initIP("gt", $("ngate").value); initIP("mp", $("mulip").value);
	initIP("dns", $("dns").value); initIP("db", $("dnsback").value);
	enabledhcp(4);
	enabledhcp(6);
	attachMacInput("Mac");
	$("mac").value.split("-").each(function(a,b){$("Mac"+b).value=a;$("Mac"+b).disabled="disabled"});
	$("btnSave").addEvent("click", Checkfrm);
	if(IPV6){setDisplay("trIPModes", 1);}
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netLANCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">有线网络参数</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr id="trIPV4DHCP">
						  <td width="160" height="18" align="right" valign="middle" id="Tddhcp"><LABEL id="laDHCPEnable">DHCP 开关</LABEL></td>
						  <td width="360" height="18" align="left" valign="middle">
							<input name="ckdhcp" type="checkbox" id="ckdhcp" value="0" onClick="checkClick('net_frm','ckdhcp');enabledhcp(4);" /></td>
						</tr>
						<tr id="trIPV6DHCP" style="display:none;">
						  <td width="160" height="18" align="right" valign="middle" id="Tddhcp"><LABEL id="laDHCPEnable6">DHCP 开关</LABEL></td>
						  <td width="360" align="left" valign="middle">
						  <input name="ckdhcp6" type="checkbox" id="ckdhcp6" value="0" onClick="checkClick('net_frm','ckdhcp6');enabledhcp(6);" /></td>
						</tr>
						<tr id="trIPModes" style="display:none;">
						  <td height="18" align="right" valign="middle" id="tdIPVersion"><LABEL id="laIPVersion">IP版本</LABEL></td>
						  <td align="left" valign="middle">
							 <select id="ipversion" name="ipversion" class="select2" onChange="selectVersion();">
							   <option value="0">IPV4 </option>
							   <option value="1">IPV6</option>
							 </select>
						  </td>
						</tr>
						<tr id="trIPV4Con">
						  <td colspan="2" style="padding:0px; margin:0px;">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td width="160" height="18" align="right" valign="middle" id="Tdip"><LABEL id="laIP">IP 地址</LABEL></td>
						  <td width="360" align="left" valign="middle">
<p class="IP4Box">
	<input id="ip0" type="text" name="textfield" />.
	<input id="ip1" type="text" name="textfield" />.
	<input id="ip2" type="text" name="textfield" />.
	<input id="ip3" type="text" name="textfield" />
</p><input id="ip" name="ip" type="hidden" value="192.168.1.231">						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdsmask"><LABEL id="laSubnetMask">子网掩码</LABEL></td>
						  <td align="left" valign="middle">
<p class="IP4Box">
	<input id="mk0" type="text" name="textfield" />.
	<input id="mk1" type="text" name="textfield" />.
	<input id="mk2" type="text" name="textfield" />.
	<input id="mk3" type="text" name="textfield" />
</p><input id="smask" name="smask" type="hidden" value="">						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdngate"><LABEL id="laGateway">网关</LABEL></td>
						  <td align="left" valign="middle">
<p class="IP4Box">
	<input id="gt0" type="text" name="textfield" />.
	<input id="gt1" type="text" name="textfield" />.
	<input id="gt2" type="text" name="textfield" />.
	<input id="gt3" type="text" name="textfield" />
</p><input id="ngate" name="ngate" type="hidden" value="">						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tddns"><LABEL id="laMainDNS">首选 DNS 地址</LABEL></td>
						  <td align="left" valign="middle">
<p class="IP4Box">
	<input id="dns0" type="text" name="textfield" />.
	<input id="dns1" type="text" name="textfield" />.
	<input id="dns2" type="text" name="textfield" />.
	<input id="dns3" type="text" name="textfield" />
</p><input id="dns" name="dns" type="hidden" value="">						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tddnsback"><LABEL id="laSubDNS">备用 DNS 地址</LABEL></td>
						  <td align="left" valign="middle">
<p class="IP4Box">
	<input id="db0" type="text" name="textfield" />.
	<input id="db1" type="text" name="textfield" />.
	<input id="db2" type="text" name="textfield" />.
	<input id="db3" type="text" name="textfield" />
</p><input id="dnsback" name="dnsback" type="hidden" value="">						  </td>
						</tr>
					</table>
						  </td>
					    </tr>
						<tr id="trIPV6Con" style="display:none;">
						  <td colspan="2" style="padding:0px; margin:0px;">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdsmask"><LABEL id="laLinkAddr6">链接地址</LABEL></td>
						  <td align="left" valign="middle">
						  <input id="linkaddr6" name="linkaddr6" type="text" class="text" style="border:0px; background-color:#D6D5D5; width:200px;" value="fe80::9202:a9ff:fe0b:42ad/64">
						  </td>
						</tr>
						<tr>
						  <td width="160" height="18" align="right" valign="middle" id="Tdip"><LABEL id="laIP6">IP 地址</LABEL></td>
						  <td width="360" align="left" valign="middle">
						  <input id="ip6" name="ip6" type="text" class="text" style="width:200px;" value="192.168.1.231">
						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdngate"><LABEL id="laGateway6">网关</LABEL></td>
						  <td align="left" valign="middle">
						  <input id="ngate6" name="ngate6" type="text" class="text" style="width:200px;" value="">
						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tddns"><LABEL id="laMainDNS6">首选 DNS 地址</LABEL></td>
						  <td align="left" valign="middle">
						  <input id="dns6" name="dns6" type="text" class="text" style="width:200px;" value="">
						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tddnsback"><LABEL id="laSubDNS6">备用 DNS 地址</LABEL></td>
						  <td align="left" valign="middle">
						  <input id="dnsback6" name="dnsback6" type="text" class="text" style="width:200px;" value="">
						  </td>
						</tr>
					</table>
						  </td>
					    </tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdmac"><LABEL id="laMAC">物理地址</LABEL></td>
						  <td align="left" valign="middle">
							
<p class="macBox">
<input id="Mac0" type="text" name="textfield" />-<input id="Mac1" type="text" name="textfield" />-<input id="Mac2" type="text" name="textfield" />-<input id="Mac3" type="text" name="textfield" />-<input id="Mac4" type="text" name="textfield" />-<input id="Mac5" type="text" name="textfield" />
</p><p style="float:left; padding-left:5px;"><input name="ckmac" type="checkbox" id="ckmac" onClick="displayMac()" value="checkbox" />
</p><input id="mac" name="mac" type="hidden" value="00-5d-20-EE-FF-BB" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="18" align="right" valign="middle" id="Tdmulip"><LABEL id="laMulticastIP">多播 IP</LABEL></td>
						  <td align="left" valign="middle">
<p class="IP4Box">
	<input id="mp0" type="text" name="textfield" />.
	<input id="mp1" type="text" name="textfield" />.
	<input id="mp2" type="text" name="textfield" />.
	<input id="mp3" type="text" name="textfield" />
</p><input id="mulip" name="mulip" type="hidden" value="">
						  </td>
						</tr>
						<tr style="display:none;">
						  <td height="18" align="right" valign="middle">&nbsp;</td>
						  <td align="left" valign="middle">224.0.0.0~~239.255.255.255</td>
						</tr>
						<tr style="display:none;">
						  <td height="18" align="right" valign="middle" id="Tdmulport"><LABEL id="laMulticastPort">多播端口</LABEL></td>
						  <td align="left" valign="middle"><input name="mulport" type="text" class="text" id="mulport" onKeyPress="event.returnValue=isDigit();" maxlength="32" /></td>
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
<%outNetLANCfgEx();%>
</body>
</html>
