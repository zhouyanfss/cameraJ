<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net DDNS</title>
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
	var dnsregname		= $("dnsregname").value;
	var dnssrvurl=$("dnssrvurl").value;
	var dnssrvport=$("dnssrvport").value;
	var datamapport=$("datamapport").value;
	var webmapport=$("webmapport").value;
	
	var strproviderchg = $("provider").options[$("provider").selectedIndex].outerText;
	if($("ckddns").checked==true && strproviderchg != ""){
		if(isBlank(dnsregname)&&1==0)	{
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSUSERNAMENULL, 3E3, 1);
			return false;
		}
		if(!isURL($("dnsdomain"),3)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSDOMAINNULL, 3E3, 1);
			return false;
		}
		if(isBlank(dnssrvurl)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSSERVERNULL, 3E3, 1);
			return false;
		}
		if(!isURL($("dnssrvurl"),3)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSSERVERERROR, 3E3, 1);
			return false;
		}
		if(isBlank(dnssrvport) || !isNum(dnssrvport)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSSERVERPORTERROR, 3E3, 1);
			return false;
		}
		if(isBlank(datamapport) || !isNum(datamapport)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSDATAPORTERROR, 3E3, 1);
			return false;
		}
		if(isBlank(webmapport) || !isNum(webmapport)){
			remarkDisplay("divAlertHTML", "* " + ALERTDDNSWEBPORTERROR, 3E3, 1);
			return false;
		}
	  }
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function chgdnsurl(flag){
	var dnsdomain = $("dnsdomain").value;
	var dnssrvurl = $("dnssrvurl").value;
	var strprovider = $("provider").options[$("provider").selectedIndex].outerText;
	//if(strprovider=="other"||strprovider.indexOf(".")<=0){strprovider = "mvddns.net";}
	var strproviders = strprovider;
	if(strprovider!=""){
		var chgurlflag = Chgurl(strprovider);
		if(flag==2){
			if(strprovider.indexOf(".")>0){
				if(strprovider.indexOf("dyndns.org")>0)strprovider="dyndns.org";
				if(strprovider=="dyndns.org")
					$("dnssrvurl").value = "members." + strprovider;
				else
					$("dnssrvurl").value = "www." + strprovider;
			}else{
				$("dnssrvurl").value = "";
			}
			$("ckddns").checked=true;
		}
	}else{
		//$("dnssrvurl.value = "";
		$("ckddns").checked=false;
		var inum = $("provider").length;
		for(i=0;i<inum;i++){
			strprovider = $("provider").options[i].outerText;
			if(strprovider!=""){
				break;
			}
		}
	}
	var dnsregname = "xxxx";
	if($("dnsregname").value!=""){
		dnsregname = $("dnsregname").value;
	}
	if(strprovider.indexOf(".")>0)
		document.getElementById("linkddns").innerHTML = "<a target='_blank' href='http://www." + strprovider+ "' style='background-image:none;'><font color='#0000FF'>"+strprovider+"</font></a>";
	else
		document.getElementById("linkddns").innerHTML = "";
	if(strprovider.indexOf(".")>0)
		document.getElementById("linkexp").innerHTML = "<font color='#FF0000'>test1."+ strprovider + "</font>";
	else
		document.getElementById("linkexp").innerHTML = "";
	if(dnsdomain==""){
		if(dnsregname!="xxxx")
			$("dnsdomain").value = dnsregname+"." + strprovider;
	}else{
		if(flag==2&&strproviders!=""){
			var dnssrvurls = dnssrvurl.replace("www.","");
			$("dnsdomain").value = dnsdomain.replace(dnssrvurls,strprovider)
		}
	}
}

function chgdnsonoff(){
	var strprovider="";
	try{
	strprovider = $("provider").options[$("provider").selectedIndex].outerText;
	if(strprovider.indexOf("dyndns.org")>0)strprovider="dyndns.org";
	}catch(e){}
	if(strprovider==""){
		$("ckddns").checked=false;
		var inum = $("provider").length;
		for(i=0;i<inum;i++){
			strprovider = $("provider").options[i].outerText;
			if(strprovider!=""){
				break;
			}
		}
	}else{
		$("ckddns").checked=true;
	}
	var dnsregname = "xxxx";
	if($("dnsregname").value!=""){
		dnsregname = $("dnsregname").value;
	}
	if(strprovider.indexOf(".")>0)
		document.getElementById("linkddns").innerHTML = "<a target='_blank' href='http://www." + strprovider+ "' style='background-image:none;'><font color='#0000FF'>"+strprovider+"</font></a>";
	else
		document.getElementById("linkddns").innerHTML = "";
	if(strprovider.indexOf(".")>0)
		document.getElementById("linkexp").innerHTML = "<font color='#FF0000'>test1."+strprovider + "</font>";
	else
		document.getElementById("linkexp").innerHTML = "";
		
	if($("dnssrvurl").value==""){
		if(strprovider.indexOf(".")>0){
			if(strprovider.indexOf("dyndns.org")>0)strprovider="dyndns.org";
			if(strprovider=="dyndns.org")
				$("dnssrvurl").value = "members." + strprovider;
			else
				$("dnssrvurl").value = "www." + strprovider;
		}else{
			$("dnssrvurl").value = "";
		}
	}
	if(dnsregname!="xxxx"&&$("dnsdomain").value=="")
		$("dnsdomain").value = dnsregname+"." + strprovider;
}
function Getdnsregname(){
	$("dnsregname2").value = $("dnsregname").value;
}
function Chgurl(Strtep){
	re=/\w+([-.]\w+)*\.\w+([-.]\w+)*/ //匹配域名的正则表达式
	if(re.test(Strtep))	{
		return true;
	}else{
		return false;
	}
}

function init(){
	ChangeLanguage('../xml/netddns.xml', m_szLanguage);
	chgdnsonoff();
	Getdnsregname();
	attachLimit("dnssrvport",1,65534);attachLimit("datamapport",1,65534);attachLimit("webmapport",1,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netDDNSCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">DDNS 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
					<tr>
					  <td width="160" height="18" align="right" valign="middle" id="Tdddnsenable"><LABEL id="laEnable">开关</LABEL></td>
					  <td width="60" height="18" align="left" valign="middle">
					  <input name="ckddns" type="checkbox" id="ckddns" value="0" onClick="checkClick('net_frm','ckddns')" disabled="disabled" /></td>
					  <td align="left" valign="middle" style="padding:0px; margin:0px;"><div id="Fontlink" style="color:#FF0000; width:42px; float:left; overflow:hidden;"><LABEL id="laLinking">链接</LABEL></div><div id="linkddns" style="width:150px; overflow:hidden; float:left; overflow:hidden;"><a href="http://www.3322.org" target="_blank" style="background-image:none;">3322.org</a></div></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdprovider"><LABEL id="laServiceProvider">服务提供者</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle">
						<select name="provider" id="provider" onChange="chgdnsurl(2)" >
						  <option value="0"></option>
						  <option value="1">3322.org</option>
						  <option value="2">88IP.net</option>
						  <option value="3">dyndns.org</option>
						</select>
					  <input name="dnsregname2" type="hidden" id="dnsregname2" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdname"><LABEL id="laUserName">注册名</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><input name="dnsregname" type="text" class="text" id="dnsregname" maxlength="32"  onChange="chgdnsurl(1)"/></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdpassword"><LABEL id="laPassword">密码</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><input name="dnspassword" type="password" class="text" id="dnspassword" maxlength="32" style="width:150px;" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tddomain"><LABEL id="laDomain">域名</LABEL></td>
					  <td width="175" height="18" colspan="2" align="left" valign="middle"><input name="dnsdomain" type="text" class="text" id="dnsdomain" maxlength="32" onChange="chgdnsurl(0)" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdurl"><LABEL id="laServerURL">服务器地址</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><input name="dnssrvurl" type="text" class="text" id="dnssrvurl" maxlength="32" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdport"><LABEL id="laServerPort">服务器端口</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><input name="dnssrvport" type="text" class="text" id="dnssrvport" maxlength="5" /></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tddataport"><LABEL id="laDataPort">数据映射端口</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><span class="STYLE7">
						<input name="datamapport" type="text" class="text" id="datamapport" maxlength="5" />
					  </span></td>
					</tr>
					<tr>
					  <td height="18" align="right" valign="middle" id="Tdwebport"><LABEL id="laWebPort">Web 映射端口</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><input name="webmapport" type="text" class="text" id="webmapport" maxlength="5" /></td>
					</tr>
					 <tr>
					  <td height="18" align="right" valign="middle" id="Tdinterval"><LABEL id="laUpdateInterval">更新间隔</LABEL></td>
					  <td height="18" colspan="2" align="left" valign="middle"><label>
						<select name="interval" id="interval">
						  <option id="opInterval1" value="0">2分钟</option>
						  <option id="opInterval2" value="1">5分钟</option>
						  <option id="opInterval3" value="2">30分钟</option>
						  <option id="opInterval4" value="3">1小时</option>
						  <option id="opInterval5" value="4">2小时</option>
						  <option id="opInterval6" value="5">1天</option>
						  <option id="opInterval7" value="6">IP更新时</option>
						</select>
					  </label></td>
					</tr>
				   <tr>
					  <td height="21" colspan="3" align="left" style="padding-left:23px;"><div style="float:left;" id="Divexp"><LABEL id="laDomaineg">域名例如:&nbsp;</LABEL></div>
						<div id="linkexp" style="width:280px; overflow:hidden;"><font color="#FF0000">http://xxxx.3322.org</font></div></td>
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
<%outNetDDNSCfgEx();%>
</body>
</html>
