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

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
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

function init(){
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/smCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">接入配置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="520" cellpadding="5" cellspacing="1">
               <tr>
                  <td width="160" height="21" align="right" id="Tdurl">服务器URL</td>
                  <td height="21" align="left"><input name="smip" type="text" class="text" id="smip" maxlength="64" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdport">服务器端口</td>
                  <td height="21" align="left"><input name="smport" type="text" class="text" id="smport" onKeyPress="event.returnValue=isDigit();" maxlength="8"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tddevsn">设备名称</td>
                  <td height="21" align="left"><input name="smsn" type="text" class="text" id="smsn" maxlength="32"  /></td>
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
<input name="debuginfo" type="hidden" id="debuginfo" value="1">
</form>
<%outSmCfgEx();%>
</body>
</html>
