<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接入配置</title>
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

<script type="text/javascript" language="javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>
<style type="text/css">
<!--
.input2{
	width:132px;
}
//-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

//Objcmd 1手动重新注册 2注销
function btnHitEx(Objcmd){
try{
	window.status = "";
	$s("divAlertHTML").innerHTML	= "";
	var strurl = "/webs/btnHitEx";
	var xmlText 	= "<Message><flag>2050</flag>";
	xmlText 		= xmlText + "<paramcmd>"+Objcmd+"</paramcmd>";
	xmlText 		= xmlText + "<paramctrl>1</paramctrl>";
	xmlText 		= xmlText + "<paramstep>1</paramstep>";
	xmlText			= xmlText + "</Message>";
	
	CreateAjax();
	if(!oSend){
		$s("divAlertHTML").innerHTML	= "* " + CREATEXMLHTTPERROR;
		window.status = CREATEXMLHTTPERROR;
		return false;
	}
	strurl	= strurl + "?flag=2050&paramcmd=" + Objcmd + "&paramctrl=1&paramstep=1&paramreserved=1";
	//alert(strurl);
//	window.status = strurl;
	oSend.onreadystatechange = function (){alertatcmd(Objcmd);}
	oSend.open("POST",strurl,true);
	oSend.setRequestHeader("CONTENT-TYPE", "text/xml")
	oSend.send(xmlText);
 }catch(e){
 	$s("divAlertHTML").innerHTML	= "* " + SENDXMLHTTPERROR;
	window.status = SENDXMLHTTPERROR;
	return false;
  }	
}
//Objcmd 1手动重新注册 2注销
function alertatcmd(Objcmd){
   if (oSend.readyState == 4) {
       if (oSend.status == 200){
			var Strreturn;
			try{
				LoadXMLDocument(xmlResult,oSend);	//兼容其他浏览器
			}catch(e){
				$s("divAlertHTML").innerHTML	= "* " + CREATEDOMDOCERROR;
				window.status = CREATEDOMDOCERROR;
				return false;
			}
			try{
				Strreturn 	= xmlResult.selectSingleNode("html/body/hitreturn").text;
				$s("divAlertHTML").innerHTML	= "* " + Strreturn;
			}catch(e){
	 			$s("divAlertHTML").innerHTML	= "* " + RETURNXMLERROR;
				window.status = RETURNXMLERROR;
			}
			return false;
		}else if(oSend.status == 404){
			$s("divAlertHTML").innerHTML	= "* " + URLERROR;
			window.status = URLERROR;
			return false;
		}
   }
}

function init(){
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/gb28181Ex"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">GB28181 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="100%" cellpadding="5" cellspacing="1">
                 <tr>
                  <td height="21" align="right" id="tdServerID">服务器&nbsp;ID</td>
                  <td align="left"><input name="serverid" type="text" class="text" id="serverid" maxlength="64"  /></td>
                  <td align="left">&nbsp;</td>
                  <td align="left">&nbsp;</td>
                 </tr>
                 <tr>
                  <td width="25%" height="21" align="right" id="tdURL">服务器地址</td>
                  <td width="25%" align="left"><input name="serverip" type="text" class="text" id="serverip" maxlength="32" /></td>
                  <td  width="25%"align="right" id="tdPort">服务器端口</td>
                  <td width="25%" align="left"><input name="serverport" type="text" class="text" id="serverport" onKeyPress="event.returnValue=isDigit();" maxlength="5"  /></td>
                 </tr>
                 <tr>
                  <td height="21" align="right" id="tdSN">设备&nbsp;ID</td>
                  <td align="left"><input name="devicesn" type="text" class="text" id="devicesn" maxlength="64"  /></td>
                  <td align="right" id="tdDevicePort">设备端口</td>
                  <td align="left"><input name="deviceport" type="text" class="text" id="deviceport" onKeyPress="event.returnValue=isDigit();" maxlength="5"  /></td>
                 </tr>
                <tr>
                  <td height="21" align="right" id="tdUserName">用&nbsp;户&nbsp;名</td>
                  <td align="left"><input name="username" type="text" class="text" id="username" maxlength="64"  /></td>
                  <td align="right" id="tdPassword">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
                  <td align="left"><input name="password" type="password" class="text" id="password" maxlength="32" style="width:150px;" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdChanID">媒体通道&nbsp;ID</td>
                  <td align="left"><input name="chanid" type="text" class="text" id="chanid" maxlength="64"  /></td>
                  <td align="right" id="tdAlarmID">报警通道&nbsp;ID</td>
                  <td align="left"><input name="alarmid" type="text" class="text" id="alarmid" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdDeviceBelong">设备归属</td>
                  <td align="left"><input name="devicebelong" type="text" class="text" id="devicebelong" maxlength="64"  /></td>
                  <td align="right" id="tdManufacturer">制&nbsp;造&nbsp;商</td>
                  <td align="left"><input name="manufacturer" type="text" class="text" id="manufacturer" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdAdministrativeRegion">行政区域</td>
                  <td align="left"><input name="administrativeregion" type="text" class="text" id="administrativeregion" maxlength="64"  /></td>
                  <td align="right" id="tdPoliceRegion">警&nbsp;&nbsp;&nbsp;&nbsp;区</td>
                  <td align="left"><input name="policeregion" type="text" class="text" id="policeregion" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdInstallation">安装地址</td>
                  <td align="left"><input name="installation" type="text" class="text" id="installation" maxlength="128"  /></td>
                  <td align="right" id="tdConfidential">保密属性</td>
                  <td align="left"><input name="confidential" type="text" class="text" id="confidential" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdLongitude">经&nbsp;&nbsp;&nbsp;&nbsp;度</td>
                  <td align="left"><input name="longitude" type="text" class="text" id="longitude" maxlength="64"  /></td>
                  <td align="right" id="tdLatitude">纬&nbsp;&nbsp;&nbsp;&nbsp;度</td>
                  <td align="left"><input name="latitude" type="text" class="text" id="latitude" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="tdTime">注册有效时间</td>
                  <td align="left"><input name="time" type="text" class="text" id="time" maxlength="64"  /></td>
                  <td align="right" id="tdAction">心跳时间</td>
                  <td align="left"><input name="action" type="text" class="text" id="action" maxlength="64"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right">&nbsp;</td>
                  <td colspan="3" align="left">
<a hidefocus="true" href="javascript:;" onClick="btnHitEx(1)" id="btnMR" class="btn77 act"><LABEL id="btnManualRegister">手动注册</LABEL></a>
<a hidefocus="true" href="javascript:;" onClick="btnHitEx(2)" id="btnLO" class="btn77 act"><LABEL id="btnLogout">注  销</LABEL></a>
					</td>
                  </tr>
				</table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl90">
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
<%outGb28181Ex();%>
</body>
</html>
