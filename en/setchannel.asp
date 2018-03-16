<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Channel Color Video Quad Processor</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./chs/commonlan.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<style type="text/css">
<!--
body{
margin:0px;
padding:0 0 0 0;
}
LABEL{
	padding-left:8px;
}
textarea{
	width:230px;
	height:58px;
}
input{
	width:230px;
}
#tab_top{
	width:680px; height:71px; overflow:hidden;
	background:url(../images/headbg.gif) repeat-x bottom; background-color:#37434C;
}
#tab_main{
	width:680px; text-align:center;
	margin:0px; padding:0 0 2 0;
	background-color:#f5f5f5;
	border:#37434C solid 1px;
}
.TABLEss{
	BACKGROUND-COLOR: #f5f5f5;
	margin-top:21px;
	margin-bottom:12px;
}
.bordersolid{
	border:#37434C solid 1px; padding:8px;
}
#divChannel{
	float:left; width:21px; height:71px; padding:12 0 0 0; margin-left:18px;
	color:#FFFFFF; font-size:28px; font-weight:bold;
}
#divTitleName{
	float:left; width:580px; height:71px; padding:13 0 0 0;
	color:#FFFFFF; font-size:28px; font-weight:bold;
}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	
	//saveCookie("SaveYes","ok",7);
	return true;
}

function init(){
	var nChannel	= parseInt($s("nchannel").value);
	if(nChannel == 1){
		$s("laCh1Title").style.display	= "";
		$s("laCh1Value").style.display	= "";
		$s("laCh2Title").style.display	= "none";
		$s("laCh2Value").style.display	= "none";
		$s("laCh3Title").style.display	= "none";
		$s("laCh3Value").style.display	= "none";
		$s("laCh4Title").style.display	= "none";
		$s("laCh4Value").style.display	= "none";
	}else if(nChannel == 2){
		$s("laCh1Title").style.display	= "";
		$s("laCh1Value").style.display	= "";
		$s("laCh2Title").style.display	= "";
		$s("laCh2Value").style.display	= "";
		$s("laCh3Title").style.display	= "none";
		$s("laCh3Value").style.display	= "none";
		$s("laCh4Title").style.display	= "none";
		$s("laCh4Value").style.display	= "none";
	}else if(nChannel == 4){
		$s("laCh1Title").style.display	= "";
		$s("laCh1Value").style.display	= "";
		$s("laCh2Title").style.display	= "";
		$s("laCh2Value").style.display	= "";
		$s("laCh3Title").style.display	= "";
		$s("laCh3Value").style.display	= "";
		$s("laCh4Title").style.display	= "";
		$s("laCh4Value").style.display	= "";
	}
	$s("divChannel").innerHTML	= nChannel;
	
	//ChangeLanguage('../xml/setchannel.xml', m_szLanguage);
	//setTimeout("parent.btnHit.location.href = 'audio.asp';",2000);
}
</script>
<body onLoad="init();">
<div id="tab_top">
	<div id="divChannel">
		1
	</div>
	<div id="divTitleName">
		Channel Color Video Quad Processor
	</div>
</div>

<div id="tab_main">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/setChannel"  style="margin:0px; padding:0px;">
<TABLE width=630 border=0 cellPadding=0 cellSpacing=0 class="TABLEss">
  <TR>
    <TD class=title width=7><IMG height=24 src="images/frm/arc.gif" width=7></TD>
    <TD class=title align=left width=495><LABEL id="laChannelTitle">Channel Name</LABEL></TD>
  </TR>
  <TR>
    <TD colSpan=2 class="bordersolid">
	<table width="100%" border="0" cellpadding="3" cellspacing="1">
	  <tr>
		<td width="10%"><LABEL id="laCh1Title">CH1</LABEL></td>
		<td width="40%">
		 <LABEL id="laCh1Value"><textarea name="chan1" rows="3" id="chan1"></textarea></LABEL>
		</td>
	    <td width="10%"><LABEL id="laCh3Title" style="display:none;">CH3</LABEL></td>
	    <td width="40%"><LABEL id="laCh3Value" style="display:none;"><textarea name="chan3" rows="3" id="chan3"></textarea></LABEL></td>
	  </tr>
	  <tr>
		<td><LABEL id="laCh2Title" style="display:none;">CH2</LABEL></td>
		<td><LABEL id="laCh2Value" style="display:none;"><textarea name="chan2" rows="3" id="chan2"></textarea></LABEL></td>
	    <td><LABEL id="laCh4Title" style="display:none;">CH4</LABEL></td>
	    <td><LABEL id="laCh4Value" style="display:none;"><textarea name="chan4" rows="3" id="chan4"></textarea></LABEL></td>
	  </tr>
	</table>
	</TD>
  </TR>
</TABLE>

<TABLE width=630 border=0 cellPadding=0 cellSpacing=0 class="TABLEss">
  <TR>
    <TD class=title width=7><IMG height=24 src="images/frm/arc.gif" width=7></TD>
    <TD class=title align=left width=495><LABEL id="laNetLanTitle">Network Parameter</LABEL></TD>
  </TR>
  <TR>
    <TD colSpan=2 class="bordersolid">
	<table width="100%" border="0">
	  <tr>
        <td width="20%" height="28" align="right" valign="middle" id="Tdip"><LABEL id="laIP">IP</LABEL></td>
	    <td height="18" align="left" valign="middle"><input name="ip" type="text" class="text" id="ip" maxlength="32" /></td>
	    </tr>
	  <tr>
        <td height="28" align="right" valign="middle" id="Tdsmask"><LABEL id="laSubnetMask">Subnet Mask</LABEL></td>
	    <td height="18" align="left" valign="middle"><input name="smask" type="text" class="text" id="smask" maxlength="32" /></td>
	    </tr>
	  <tr>
        <td height="28" align="right" valign="middle" id="Tdngate"><LABEL id="laGateway">Gateway</LABEL></td>
	    <td height="18" align="left" valign="middle"><input name="ngate" type="text" class="text" id="ngate" maxlength="32" /></td>
	    </tr>
	  <tr>
        <td height="28" align="right" valign="middle" id="Tdmac"><LABEL id="laMAC">MAC</LABEL></td>
	    <td height="18" align="left" valign="middle"><input name="mac" type="text" disabled="disabled" class="text" id="mac" value="22" maxlength="18" /></td>
	    </tr>
	</table>
	</TD>
  </TR>
</TABLE>

<TABLE width=630 border=0 cellPadding=0 cellSpacing=0 class="TABLEss">
  <tr>
    <td><input name="btnSaveSumbit" type="submit" class="button" id="btnSaveSumbit" value="Save" align="right" style="width:65px;" onClick="return Checkfrm()">
      <input name="nchannel" type="hidden" id="nchannel" value="4"></td>
    </tr>
</table>
</form>
</div>
<%outSetChannel();%>
</body>
</html>
