<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公网IP邮件通知</title>
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
	ChangeLanguage('../xml/netipemail.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netIpEmailCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow" style="width:420px;"><LABEL id="laHeadTitle">公网IP邮件通知(设备启动或公网IP改变时,发送邮件通知)</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="520" cellpadding="5" cellspacing="1">
				<td width="160" height="21" align="right" valign="middle" id="Tdipemail"><LABEL id="laEnable">开关</LABEL></td>
                  <td height="21" align="left" valign="middle"><input name="ckemailip" type="checkbox" id="ckemailip" value="0" onClick="checkClick('adva_frm','ckemailip')" /></td>
                  </tr>
                <tr>
                  <td height="21" align="right" valign="middle" id="Tdinterval"><LABEL id="laInterval">更新间隔</LABEL> </td>
                  <td height="21" align="left" valign="middle">
				  <select name="emailinterval" id="emailinterval" style="width:132px;">
				    <option id="opInterval1" value="0">默认</option>
				    <option id="opInterval2" value="1">1小时</option>
				    <option id="opInterval3" value="2">2小时</option>
				    <option id="opInterval4" value="3">1天</option>
				    <option id="opInterval5" value="4">2天</option>
				    <option id="opInterval6" value="5">7天</option>
                    </select></td>
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
<%outNetIpEmailCfgEx();%>
</body>
</html>
