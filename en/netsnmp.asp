<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net SNMP</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>

<script type="text/javascript" language="javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	if($s("cksnmp").checked==true&&$s("communityro").value==""&&$s("communityrw").value==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNOTNULL, 3E3, 1);
		$s("communityro").select();
		$s("communityro").focus();
		return false;
	}
	if($s("cktraps").checked==true&&$s("address").value==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNOTNULL, 3E3, 1);
		$s("address").select();
		$s("address").focus();
		return false;
	}
	if($s("cktraps").checked==true&&$s("trapcommunity").value==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNOTNULL, 3E3, 1);
		$s("trapcommunity").select();
		$s("trapcommunity").focus();
		return false;
	}
	if($s("cksnmpv3").checked==true&&$s("v3username").value==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNOTNULL, 3E3, 1);
		$s("v3username").select();
		$s("v3username").focus();
		return false;
	}
	if($s("cksnmpv3").checked==true&&$s("v3password").value==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNOTNULL, 3E3, 1);
		$s("v3password").select();
		$s("v3password").focus();
		return false;
	}
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/netsnmp.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netSnmpEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">SNMP 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
                <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdsnmpt"><LABEL id="laSNMPV1V2">SNMP v1/v2</LABEL></td>
                  </tr>
                <tr>
                  <td width="160" height="21" align="right" id="Tdsnmp"><LABEL id="laSNMPV1V2Enable">SNMP v1/v2c开关</LABEL></td>
                  <td height="21" align="left"><input name="cksnmp" type="checkbox" id="cksnmp" onClick="checkClick('outcfg_frm','cksnmp')" value="0" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdcommunityro"><LABEL id="laCommunityRO">团体名(只读)</LABEL></td>
                  <td height="21" align="left"><input name="communityro" type="text" class="text" id="communityro" value="public" maxlength="16" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdcommunityrw"><LABEL id="laCommunityRW">团体名(读写)</LABEL></td>
                  <td height="21" align="left"><input name="communityrw" type="text" class="text" id="communityrw" value="public" maxlength="16" /></td>
                </tr>
                 <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdtrapst"><LABEL id="laTraps">SNMP v1/v2 陷阱</LABEL></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdtraps"><LABEL id="laTrapsEnable">陷阱开关</LABEL></td>
                  <td height="21" align="left"><input name="cktraps" type="checkbox" id="cktraps" onClick="checkClick('outcfg_frm','cktraps')" value="0" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdaddress"><LABEL id="laTrapsAddress">陷阱管理端地址</LABEL></td>
                  <td height="21" align="left"><input name="address" type="text" class="text" id="address" maxlength="31" /></td>
                </tr>
               <tr>
                  <td height="21" align="right" id="Tdtrapcommunity"><LABEL id="laTrapsCommunity">陷阱团体名</LABEL></td>
                  <td height="21" align="left"><input name="trapcommunity" type="text" class="text" id="trapcommunity" value="public" maxlength="16" /></td>
                </tr>
                <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdsnmpv3t"><LABEL id="laSNMPV3">SNMP v3</LABEL></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdsnmpv3"><LABEL id="laSNMPV3Enable">SNMP v3开关</LABEL></td>
                  <td height="21" align="left"><input name="cksnmpv3" type="checkbox" id="cksnmpv3" onClick="checkClick('outcfg_frm','cksnmpv3')" value="0" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdv3username"><LABEL id="laSNMPV3MD5UserName">MD5用户名</LABEL></td>
                  <td height="21" align="left"><input name="v3username" type="text" class="text" id="v3username" maxlength="16" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdv3password"><LABEL id="laSNMPV3MD5Password">MD5密码</LABEL></td>
                  <td height="21" align="left"><input name="v3password" type="password" class="text" id="v3password" style="width:132px;" maxlength="32" /></td>
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
<%outNetSnmpEx();%>
</body>
</html>
