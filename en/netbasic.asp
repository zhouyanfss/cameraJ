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
function altReboot(){bReboot=1;}
function Checkfrm(){
	var dataport	= $("dataport").value;
	var webport		= $("webport").value;

	if(isBlank(dataport) || !isNum(dataport)){
		remarkDisplay("divAlertHTML", "* " + ALERTDATAPORTERROR, 3E3, 1);
		$("dataport").focus();
		return false;
	}
	if(isBlank(webport) || !isNum(webport)){
		remarkDisplay("divAlertHTML", "* " + ALERTWEBPORTERROR, 3E3, 1);
		$("webport").focus();
		return false;
	}
	//saveCookie("SaveYes","ok",7);
	if(bReboot==1&&window.confirm(ALERTREBOOTCFM)==false) {return false;}
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/netbasic.xml', m_szLanguage);
	attachLimit("dataport",18,65534); attachLimit("webport",80,65534); attachLimit("onvifport",18,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netBasicCfgEx"  style="margin:0px; padding:0px;">
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
                  <td width="160" height="18" align="right" valign="middle" id="Tddataport"><LABEL id="laDataPort">数据端口</LABEL></td>
                  <td height="18" align="left" valign="middle"><input name="dataport" type="text" class="text" id="dataport" value="5000" maxlength="8" onKeyUp="altReboot()" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdwebport"><LABEL id="laWebPort">Web 端口</LABEL></td>
                  <td height="18" align="left" valign="middle"><input name="webport" type="text" class="text" id="webport" value="80" maxlength="8" onKeyUp="altReboot()" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdonvifport"><LABEL id="laONVIFPort">ONVIF 端口</LABEL></td>
                  <td height="18" align="left" valign="middle"><input name="onvifport" type="text" class="text" id="onvifport" value="3000" maxlength="8" onKeyUp="altReboot()" /></td>
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
<%outNetBasicCfgEx();%>

</body>
</html>
