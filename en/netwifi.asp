<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetWIFI</title>
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

</head>
<script language="javascript">
function altReboot(){bReboot=1;}
function Checkfrm(){
	if(window.confirm(ALERTREBOOTCFM)==false) {return false;}
	//remarkDisplay("divAlertHTML", " ", 3E3, 1);
	reinitIP("ip", "ip"); reinitIP("mk", "smask"); reinitIP("gt", "ngate");
	if($s("ckdhcp").checked==true) return true;
	var ipaddr  = $s("ip").value;
	var mask    = $s("smask").value;
	var gate    = $s("ngate").value;
	if(!checkIp(ipaddr)){
		remarkDisplay("divAlertHTML", "* " + ALERTIPERROR, 3E3, 1);
		return false;
	}
	if(ipaddr=="127.0.0.1"){
		remarkDisplay("divAlertHTML", "* " + ALERTIPERROR, 3E3, 1);
		return false;
	}
    if(!checkIp(mask)){
		remarkDisplay("divAlertHTML", "* " + ALERTMASKERROR, 3E3, 1);
		return false;
	}
	if(!checkIp(gate)){
		remarkDisplay("divAlertHTML", "* " + ALERTGATEWAYERROR, 3E3, 1);
		return false;
	}

	var ssid	= $s("ssid").value;
	var pwd		= $s("password").value;
	if(ssid==""){
		remarkDisplay("divAlertHTML", "* " + ALERTSSIDNULL, 3E3, 1);
		return false;
	}
	if(!check_com(ssid,USERCHECKSTRING)){
		remarkDisplay("divAlertHTML", "* " + ALERTSSIDERROR, 3E3, 1);
		return false;
	}
	if(pwd==""){
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDNULL, 3E3, 1);
		return false;
	}
	if(!check_com(pwd,USERCHECKSTRING)){
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDERROR, 3E3, 1);
		return false;
	}

	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function scanmsg(){
	funptzmsg('massage_box',-20,150);
}
function selectscan(){
	var scanvalue;
	var scanselected = parseInt($s("sellist").selectedIndex) ;
	if(scanselected<0){return false;}
	scanvalue = $s("sellist").options[scanselected].value;
	$s("ssid").value	= scanvalue;
	massage_box.style.visibility='hidden';
}
function ajaxscan(){
try{
	window.status = "";
	var strurl = "/webs/btnHitEx";
	var xmlText 	= "<Message><flag>2020</flag>";
	xmlText 		= xmlText + "<paramcmd>2020</paramcmd>";
	xmlText 		= xmlText + "<paramctrl>2020</paramctrl>";
	xmlText 		= xmlText + "<paramstep>2020</paramstep>";
	xmlText			= xmlText + "</Message>";
	
	CreateAjax();
	if(!oSend){window.status = CREATEXMLHTTPERROR; return false;}
	strurl	= strurl + "?flag=2030&paramchannel=0&paramcmd=2020&paramctrl=2030&paramstep=2030&paramreserved=2030";
	//alert(strurl);
//	window.status = strurl;
	$s("btnScan").disabled		= true;
	$s("btnSelect").disabled	= true;
	oSend.onreadystatechange = function (){alertscan();}
	oSend.open("POST",strurl,true);
	oSend.setRequestHeader("CONTENT-TYPE", "text/xml")
	oSend.send(xmlText);
 }catch(e){window.status = SENDXMLHTTPERROR; return false;}	
}
function alertscan(){
   if (oSend.readyState == 4) {
        if (oSend.status == 200){
			var Strreturn, i;
			try{
				LoadXMLDocument(xmlResult,oSend);	//兼容其他浏览器
			}catch(e){
				window.status = CREATEDOMDOCERROR;
				return false;
			}
			try{
				//Strreturn 	= xmlResult.selectSingleNode("html/body/atreturn").text;
				$s("sellist").length = 0;
				var arrssid 	= xmlResult.selectNodes("/html/body/item/ssid");
				var arrstate 	= xmlResult.selectNodes("/html/body/item/state");
				for(i=0; i<arrssid.length; i++){
					$s("sellist").options[$s("sellist").length] = new Option(arrssid[i].text, arrssid[i].text);
				}
			}catch(e){
				window.status = RETURNXMLERROR;
			}
			$s("btnScan").disabled		= false;
			$s("btnSelect").disabled	= false;
			return false;
		}else if(oSend.status == 404){
			window.status = URLERROR;
			$s("btnScan").disabled		= false;
			$s("btnSelect").disabled	= false;
			return false;
		}
   }
}
function sec_switch(){
	var tmp_auth_type	= $s("auth_type").value;
	var tmp_enc_type	= $s("enc_type").value;
	switch(tmp_auth_type){
	case "0":	
		$s("Tr_enc_type").style.display="none";
		$s("Tr_psw").style.display="none";
		$s("Tr_psw_type").style.display="none";
	break;
	case "1":	
		$s("Tr_enc_type").style.display="";
		$s("Tr_psw").style.display="";
		$s("Tr_psw_type").style.display="";
		$s("enc_type").length=0;
		$s("enc_type").options[0]=new Option(HTMLOPENSYSTEM, 0);
		$s("enc_type").options[1]=new Option(HTMLSHAREDKEY, 1);
		$s("enc_type").options[2]=new Option(HTMLAUTOMATICALLYSELECT, 2);
		$s("enc_type").value=tmp_enc_type;
	break;
	case "2":	
	case "3":	
		$s("Tr_enc_type").style.display="";
		$s("Tr_psw").style.display="";
		$s("Tr_psw_type").style.display="none";
		$s("enc_type").length=0;
		$s("enc_type").options[0]=new Option(HTMLTKIP, 2);
		$s("enc_type").options[1]=new Option(HTMLAES, 3);
		$s("enc_type").value=tmp_enc_type;
	break;
	default:
		$s("Tr_enc_type").style.display="none";
	break;
	}
}

function enabledhcp(){	//启用DHCP则填写IP无效
	if($("ckdhcp").checked==true){$("ip").disabled=true; $("smask").disabled=true;  $("ngate").disabled=true;
	}else{$("ip").disabled=false;  $("smask").disabled=false; $("ngate").disabled=false;}
}
function init(){
	ChangeLanguage('../xml/netwifi.xml', m_szLanguage);
	initIP("ip", $("ip").value); initIP("mk", $("smask").value); initIP("gt", $("ngate").value);
	enabledhcp(); sec_switch();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0); init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netWIFICfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">无线网络参数</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td width="160" height="21" align="right" valign="middle" id="Tdwifi"><LABEL id="laWiFiEnable">无线网络开关</LABEL></td>
						  <td height="21" align="left" valign="middle"><input name="ckwirelessnetwork" type="checkbox" id="ckwirelessnetwork" value="0"  onclick="checkClick('net_frm','ckwirelessnetwork')"/></td>
						</tr>
						<tr style="display:none;">
						  <td height="18" align="right" valign="middle" id="Tddhcp"><LABEL id="laDHCPEnable">DHCP 开关</LABEL></td>
						  <td height="18" align="left" valign="middle">
							<input name="ckdhcp" type="checkbox" id="ckdhcp" value="0" onClick="checkClick('net_frm','ckdhcp');enabledhcp();" />						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdip"><LABEL id="laIP">IP 地址</LABEL></td>
						  <td height="18" align="left" valign="middle">
<p class="IP4Box">
	<input id="ip0" type="text" name="textfield" />.
	<input id="ip1" type="text" name="textfield" />.
	<input id="ip2" type="text" name="textfield" />.
	<input id="ip3" type="text" name="textfield" />
</p><input id="ip" name="ip" type="hidden" value="192.168.1.231">
						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdsmask"><LABEL id="laSubnetMask">子网掩码</LABEL></td>
						  <td height="18" align="left" valign="middle">
<p class="IP4Box">
	<input id="mk0" type="text" name="textfield" />.
	<input id="mk1" type="text" name="textfield" />.
	<input id="mk2" type="text" name="textfield" />.
	<input id="mk3" type="text" name="textfield" />
</p><input id="smask" name="smask" type="hidden" value="">
						  </td>
						</tr>
						<tr>
						  <td height="18" align="right" valign="middle" id="Tdngate"><LABEL id="laGateway">网关</LABEL></td>
						  <td height="18" align="left" valign="middle">
<p class="IP4Box">
	<input id="gt0" type="text" name="textfield" />.
	<input id="gt1" type="text" name="textfield" />.
	<input id="gt2" type="text" name="textfield" />.
	<input id="gt3" type="text" name="textfield" />
</p><input id="ngate" name="ngate" type="hidden" value="">
						  </td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="middle" id="Tdssid"><LABEL id="laSSID">SSID 号</LABEL></td>
						  <td height="21" align="left" valign="middle"><input name="ssid" type="text" class="text" id="ssid" value="111111" maxlength="32" />
					      <input name="btnScanning" type="button" class="button" id="btnScanning" value="扫描" style="margin-left:12px; width:65px; display:none;" onClick="scanmsg();"></td>
						</tr>
						<tr id="Tr_psw" style="display:none;">
						  <td height="21" align="right" valign="middle" id="Tdpassword"><LABEL id="laPassword">密码</LABEL></td>
						  <td height="21" align="left" valign="middle">
							<input name="password" type="password" class="text" id="password" value="111111" maxlength="32" style=" width:132px;" />
							<input name="passwordagain" type="hidden" id="passwordagain" /></td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="middle" id="Tdauthtype"><LABEL id="laEncryptionType">主认证加密类型</LABEL></td>
						  <td height="21" align="left" valign="middle">
						  <select name="auth_type" id="auth_type" size="1" onChange="sec_switch();" style="width:132px;">
						  <option value="0">NONE</option>
							<!--<option value="Autolink">AutoLink&nbsp;&nbsp;</option>-->
							<option value="1">WEP</option>
							<option value="2">WPA</option>
							<option value="3">WPA2</option>
							 <!--<option value="WPA_WPA2_Mixed">WPA&amp;WPA2 SOHO用户</option>///-->
						</select>
						  </td>
						</tr>
						<tr id="Tr_enc_type" style="display:none;">
						  <td height="21" align="right" valign="middle" id="Tdenctype"><LABEL id="laEncryptionAuxiliary">辅助认证加密</LABEL></td>
						  <td height="21" align="left" valign="middle">
						<select name="enc_type" size="1" id="enc_type" style="width:132px;">                  
							<option value="0">开放系统</option>
							<option value="1">共享密钥</option>
							<option value="2">自动选择</option>
							<option value="3">AES</option>
						</select>
						  </td>
						</tr>
						<tr id="Tr_psw_type" style="display:none;">
						  <td height="21" align="right" valign="middle" id="Tdpswtype"><LABEL id="laKeyFormat">密钥格式</LABEL></td>
						  <td height="21" align="left" valign="middle">
						<select name="psw_type" size="1" id="psw_type" style="width:132px;">                  
							<option id="opKeyFormat1" value="0">16 进制</option>
							<option id="opKeyFormat2" value="1">ASCII码</option>
						</select>
						  </td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="middle" id="Tdfrequency"><LABEL id="laFrequencyBand">频段</LABEL></td>
						  <td height="21" align="left" valign="middle"><select name="frequency" id="frequency" style="width:132px;" disabled="disabled">
							<option id="opFrequencyBand" value="0">自动</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
						  </select>
						  </td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="middle" id="Tdmode"><LABEL id="laMode">模式</LABEL></td>
						  <td height="21" align="left" valign="middle"><label>
							<select name="mode" id="mode" style="width:132px;" disabled="disabled">
							 <option id="opMode" value="0" selected="selected">自动</option>
							 <option value="1">11Mbps (802.11b )</option>
							  <option value="2">54Mbps (802.11g)</option>
						  </select>
						  </label></td>
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
<div id="massage_box" style="display:none; width:320px; ">
  <div class="massage" style="width:318px;"> 
    <div class="header" style="width:318px;" onmousedown=MDown(massage_box)> 
      	<div id="DivPRETitle"><LABEL id="laWiFiScan">无线网络扫描</LABEL></div><span onClick="massage_box.style.visibility='hidden';" style="float:right; width:28px; height:100%; padding:0 0 3 12; display:inline; cursor:hand; font-size:14px; font-weight:600;"> × </span> 
	</div>
		<table width="99%" border="0" cellpadding="2" cellspacing="5">
		  <tr>
			<td width="30%" align="right" id="Tdssid">SSID：</td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;">
			<select name="sellist" size="8" class="text" id="sellist" style="width:230px;">
          </select>
		  </td>
		  <tr>
			<td height="36" colspan="2" align="center"><input name="btnScan" type="button" class="btn69 act" id="btnScan" value="扫描" onClick="ajaxscan();"><input name="btnSelect" type="button" class="btn69 act" id="btnSelect" value="选择" style="margin-left:12px;" onClick="selectscan();"></td>
		  </tr>
	</table>	
  </div> 
</div> 
<%outNetWIFICfgEx();%>
</body>
</html>
