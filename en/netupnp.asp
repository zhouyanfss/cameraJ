<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net UPNP</title>
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
	var upnpPortData 	= $("wSetMapDataPort").value;
	var upnpPortWeb 	= $("wSetMapHttpPort").value;
	if(upnpPortData != ""){
		if(parseInt(upnpPortData)>65535||parseInt(upnpPortData)<0){
			 remarkDisplay("divAlertHTML", "* " + ALERTDATAPORTMAPERROR, 3E3, 1);
			return false;
		}
	}
	if(upnpPortWeb != ""){
		if(parseInt(upnpPortWeb)>65535||parseInt(upnpPortWeb)<0){
			 remarkDisplay("divAlertHTML", "* " + ALERTWEBPORTMAPERROR, 3E3, 1);
			return false;
		}
	}
	
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/netupnp.xml', m_szLanguage);
	attachLimit("wSetMapDataPort",1,65534); attachLimit("wSetMapHttpPort",1,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netUPNPCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow" style="width:230px;"><LABEL id="laHeadTitle">UPNP 设置(端口自动映射)</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
					<tr>
					  <td width="160" height="18" align="right" valign="middle" id="TDupnp"><LABEL id="laEnable">开关</LABEL></td>
					  <td height="18" align="left" valign="middle"><input name="ckupnp" type="checkbox" id="ckupnp" value="1"  onclick="checkClick('adva_frm','ckupnp')"/></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdupnpethno"><LABEL id="laNetworkCard">网卡</LABEL></td>
					  <td height="18" align="left" valign="middle">
					  <select name="dwUpnpEthNo" id="dwUpnpEthNo" >
						<option id="opNetworkCard1" value="0">Lineate</option>
						<option id="opNetworkCard2" value="1">WiFi</option>
					  </select>
					  </td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="TdupnpMode"><LABEL id="laUPNPMode">使用模式</LABEL></td>
					  <td height="18" align="left" valign="middle"><label>
						<select name="dwUpnpMode" id="dwUpnpMode" >
						  <option id="opUPNPMode1" value="0">Designate</option>
						  <option id="opUPNPMode2" value="1">Auto</option>
						</select>
					  </label></td>
					</tr>
					<tr>
					  <td height="18" align="right" id="TdupnpHost"><LABEL id="laServerURL">服务器地址</LABEL></td>
					  <td height="18" align="left"><input name="dwUpnpHost" type="text" class="text" id="dwUpnpHost" maxlength="32" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" id="TdupnpPortData"><LABEL id="laDataPortMap">数据映射端口</LABEL></td>
					  <td height="18" align="left"><input name="wSetMapDataPort" type="text" class="text" id="wSetMapDataPort" maxlength="16" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="TdupnpPortWeb"><LABEL id="laWebPortMap">Web映射端口</LABEL></td>
					  <td height="18" align="left" valign="middle"><input name="wSetMapHttpPort" type="text" class="text" id="wSetMapHttpPort" maxlength="16" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" id="TdupnpStatusData"><LABEL id="laDataMappingStatus">数据端口映射状态</LABEL></td>
					  <td height="18" align="left"><input name="wNowMapDataPort" type="text" disabled="disabled" class="text distext" id="wNowMapDataPort" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" id="TdupnpStatusWeb"><LABEL id="laWebMappingStatus">Web端口映射状态</LABEL></td>
					  <td height="18" align="left"><input name="wNowMapHttpPort" type="text" disabled="disabled" class="text distext" id="wNowMapHttpPort" /></td>
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
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice1">数据映射端口:指设备的数据服务端口映射到外网的端口</LABEL><br />
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice2">Web映射端口:指设备的Web服务端口映射到外网的端口</LABEL><br />
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice3">在指定模式下,只映射到指定的端口,如果端口被占用,则映射失败</LABEL><br>
<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice4">在自动模式下,会优先映射到指定端口,如果指定端口被占用,则自动递增映射端口,直到映射成功</LABEL>
</div>  
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</form>
<%outNetUPNPCfgEx();%>
</body>
</html>
