<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net FTP</title>
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
	var ftppath	= $("ftppath").value;
	if(ftppath==""){
		$("ftppath").value = "/";
	}else{
		if(ftppath.substr(stringLength(ftppath)-1,1)!="/"&&stringLength(ftppath.substr(stringLength(ftppath)-1,1))!=0){
			$("ftppath").value += "/";
		}
	}
	ftppath	= $("ftppath2").value;
	if(ftppath==""){
		$("ftppath2").value = "/";
	}else{
		if(ftppath.substr(stringLength(ftppath)-1,1)!="/"&&stringLength(ftppath.substr(stringLength(ftppath)-1,1))!=0){
			$("ftppath2").value += "/";
		}
	}
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/netftp.xml', m_szLanguage);
	attachLimit("ftpport",1,65534);attachLimit("ftpport2",1,65534);
	attachLimitCompare("startport","endport",1,65534,!0);attachLimitCompare("endport","startport",1,65534,!1);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netFTPCfgEx"  style="margin:0px; padding:0px;">
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
					<tr id="TrEnable" style="display:none;">
					  <td height="16" align="right" valign="middle">&nbsp;</td>
					  <td height="16" valign="middle">&nbsp;</td>
					  <td height="16" valign="middle"><div id="DivEnable" style="width:56px; float:left;"><LABEL id="laEnable">开关</LABEL></div><div style="width:50px; float:left;"><input name="ckAenable" type="checkbox" id="ckAenable" value="0" onClick="checkClick('outcfg_frm','ckAenable')" />
					  </div></td>
					</tr>
					<tr>
					  <td height="16" align="right" valign="middle">&nbsp;</td>
					  <td height="16" valign="middle" id="Tdmaintitle"><LABEL id="laMainServer">首选服务器</LABEL></td>
					  <td height="16" valign="middle" id="Tdsubtitle"><LABEL id="laSubServer">备用服务器</LABEL></td>
					</tr>
					<tr>
					  <td height="16" align="right" valign="middle" id="Tdurl"><LABEL id="laServerURL">服务器地址</LABEL></td>
					  <td height="16" valign="middle"><input name="ftpurl" type="text" class="text" id="ftpurl" maxlength="32" /></td>
					   <td height="16" valign="middle">
					    <input name="ftpurl2" type="text" class="text" id="ftpurl2" maxlength="32" /></td>
				   </tr>
					
					<tr>
					  <td height="16" align="right" valign="middle" id="Tdport"><LABEL id="laServerPort">服务器端口</LABEL></td>
					  <td height="16" valign="middle">
						<input name="ftpport" type="text" class="text" id="ftpport" value="21" maxlength="8" /></td>
					  <td height="16" valign="middle"><input name="ftpport2" type="text" class="text" id="ftpport2" value="21" maxlength="8" /></td>
					</tr>
					<tr>
					  <td height="16" align="right" valign="middle" id="Tdpath"><LABEL id="laFTPCatalog">远程路径</LABEL></td>
					  <td height="16" valign="middle"><input name="ftppath" type="text" class="text" id="ftppath" maxlength="32" /></td>
					  <td height="16" valign="middle"><input name="ftppath2" type="text" class="text" id="ftppath2" maxlength="32" /></td>
					</tr>
					<tr>
					  <td height="16" align="right" valign="middle" id="Tdname"><LABEL id="laUserName">用户名</LABEL></td>
					  <td height="16" valign="middle"><input name="ftpuser" type="text" class="text" id="ftpuser" maxlength="32" /></td>
					  <td height="16" valign="middle"><input name="ftpuser2" type="text" class="text" id="ftpuser2" maxlength="32" /></td>
					</tr>
					<tr>
					  <td height="16" align="right" valign="middle" id="Tdpassword"><LABEL id="laPassword">密&nbsp;&nbsp;码</LABEL></td>
					  <td height="16" valign="middle"><input name="ftppassword" type="password" class="text" id="ftppassword" maxlength="32" style="width:150px;" /></td>
					  <td height="16" valign="middle"><input name="ftppassword2" type="password" class="text" id="ftppassword2" maxlength="32" style="width:150px;" /></td>
					</tr>
					<tr id="Trstartport">
					  <td height="16" align="right" valign="middle" id="Tdstartport"><LABEL id="laStartPort">主动起始端口</LABEL></td>
					  <td height="16" valign="middle"><input name="startport" type="text" class="text" id="startport" value="0" maxlength="5" /></td>
					  <td height="16" valign="middle">&nbsp;</td>
					</tr>
					<tr id="Trendport">
					  <td height="16" align="right" valign="middle" id="Tdendport"><LABEL id="laEndPort">主动结束端口</LABEL></td>
					  <td height="16" valign="middle"><input name="endport" type="text" class="text" id="endport" value="65536" maxlength="5" /></td>
					  <td height="16" valign="middle">&nbsp;</td>
					</tr>
					<tr id="Trfilename" style="display:none;">
					  <td height="16" align="right" valign="middle" id="Tdfilename"><LABEL id="laPictureName">图片名称</LABEL></td>
					  <td height="16" colspan="2" valign="middle"><input name="filename" type="text" class="text" id="filename" value="mypicture" maxlength="31" />
					    .jpg</td>
					  </tr>
					<tr id="Trautoname" style="display:none;">
					  <td height="16" colspan="3" align="left" valign="middle">
					    <div id="Divautoname" style="width:150px; float:left; text-align:right;"><LABEL id="laAutoCreateName">自动生成图片名称</LABEL></div><div style="width:50px; padding-left:8px; float:left;"><input name="ckautoname" type="checkbox" id="ckautoname" value="0" onClick="checkClick('outcfg_frm','ckautoname')" /></div></td>
					  </tr>
					<tr id="Trautonameeg" style="display:none;">
					  <td height="16" colspan="3" align="left" valign="middle">(eg.&nbsp;mypicture_YYYYMMDD-HHMMSS)</td>
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
<%outNetFTPCfgEx();%>
</body>
</html>
