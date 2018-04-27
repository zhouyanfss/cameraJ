<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net RTSP</title>
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
function chgmode(){
	var tmpmode	= $("rtspmode").value;
	if(tmpmode=="0"){
		$("trrtspurl").style.display = "";
	}else{
		$("trrtspurl").style.display = "none";
	}
}
function chgtype(){
	var tmptype	= parseInt($("rtsptype").value);
	tmptype	= 1;
	if(tmptype==0){
		$("Trmulurl").style.display 	= "none";
		$("Trmulvport").style.display = "none";
		$("Trmulaport").style.display = "none";
		$("Trmulvport2").style.display = "none";
		$("Trmulaport2").style.display = "none";
	}else{
		$("Trmulurl").style.display 	= "";
		$("Trmulvport").style.display = "";
		$("Trmulaport").style.display = "";
		$("Trmulvport2").style.display = "";
		$("Trmulaport2").style.display = "";
	}
}

function init(){
	ChangeLanguage('../xml/netrtsp.xml', m_szLanguage);
	chgmode();
	chgtype();
	attachLimit("rtsppack",1,9999);attachLimit("rtspport",1,65534);attachLimit("mulvideoport",1,65534);attachLimit("mulaudioport",1,65534);attachLimit("mulvideoport2",1,65534);attachLimit("mulaudioport2",1,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netRTSPCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">RTSP 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
			<table width="520" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="290" height="21" align="right" valign="middle" id="Tdrtsp"><LABEL id="laEnable">开关</LABEL></td>
                  <td align="left" valign="middle"><input name="ckrtsp" type="checkbox" id="ckrtsp" value="0" onClick="checkClick('adva_frm','ckrtsp')" /></td>
                </tr>
                <tr style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmode"><LABEL id="laMode">模式</LABEL></td>
                  <td align="left" valign="middle">
				  <select name="rtspmode" id="rtspmode" onChange="chgmode()">
                    <option id="opMode1" value="0">主动</option>
                    <option id="opMode2" value="1" selected>被动</option>
                   </select></td>
              </tr>
                <tr>
                  <td height="21" align="right" valign="middle" id="Tdrz"><LABEL id="laAuthentication">是否认证</LABEL></td>
                  <td align="left" valign="middle"><input name="ckrz" type="checkbox" id="ckrz" value="0" onClick="checkClick('adva_frm','ckrz')" /></td>
              </tr>
                <tr>
                  <td height="21" align="right" valign="middle" id="Tdpacket"><LABEL id="laPacketSize">打包大小</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="rtsppack" type="text" class="text" id="rtsppack" value="1400" maxlength="4" onKeyPress/>                  </td>
              </tr>
                <tr id="trrtspurl" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdurl"><LABEL id="laServer">地址</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="rtspurl" type="text" class="text" id="rtspurl" value="127.0.0.1" maxlength="128" /></td>
              </tr>
                <tr>
                  <td height="21" align="right" valign="middle" id="Tdport"><LABEL id="laPort">端口</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="rtspport" type="text" class="text" id="rtspport" value="554" maxlength="32" /></td>
              </tr>
              </table>
			<table width="520" cellpadding="5" cellspacing="1" style="margin-top:12px;">
                <tr>
                  <td width="290" height="21" align="right" valign="middle" id="Tdtype"><LABEL id="laCommunicate">通信模式</LABEL></td>
                  <td align="left" valign="middle">
				  <select name="rtsptype" id="rtsptype" onChange="chgtype()" disabled="disabled">
				    <option id="opCommunicate1" value="0">单播</option>
				    <option id="opCommunicate2" value="1">多播</option>
                  </select></td>
              </tr>
                <tr id="Trmulurl" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmulurl"><LABEL id="laMulticastServer">多播地址</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="mulip" type="text" class="text" id="mulip" value="127.0.0.1" maxlength="128" /></td>
              </tr>
                <tr id="Trmulvport" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmulvport"><LABEL id="laMulticastMainVideoPort">主码流多播视频端口</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="mulvideoport" type="text" class="text" id="mulvideoport" value="0" maxlength="32" /></td>
              </tr>
                <tr id="Trmulaport" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmulaport"><LABEL id="laMulticastMainAudioPort">主码流多播音频端口</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="mulaudioport" type="text" class="text" id="mulaudioport" value="0" maxlength="32" /></td>
              </tr>
                <tr id="Trmulvport2" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmulvport2"><LABEL id="laMulticastSubVideoPort">次码流多播视频端口</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="mulvideoport2" type="text" class="text" id="mulvideoport2" value="0" maxlength="32" /></td>
              </tr>
                <tr id="Trmulaport2" style="display:none;">
                  <td height="21" align="right" valign="middle" id="Tdmulaport2"><LABEL id="laMulticastSubAudioPort">次码流多播音频端口</LABEL></td>
                  <td align="left" valign="middle">
                    <input name="mulaudioport2" type="text" class="text" id="mulaudioport2" value="0" maxlength="32" /></td>
              </tr>
              </table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn set_btn_pl300">
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
<%outNetRTSPCfgEx();%>
</body>
</html>
