<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<title>请重新登录</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function init(){
	ChangeLanguage('../xml/relogin.xml', m_szLanguage);
	setCookies("SaveYes", "no", 7);setCookies("nchannel", "1", 7);setCookies("Settimes", "-3000", 7);
	var strURL = this.location.href;if(strURL.indexOf("?")!=-1){var strALT = strURL.split('?')[1];if(stringLength(strALT)>0){$s("laLoginError").innerHTML = strALT;}}
	
}
</script>	
<body onLoad="init();">
<table width="600" height="451" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="451" align="center" valign="middle">
	<TABLE width=430 border=0 cellPadding=0 cellSpacing=0 class="TABLEss">
  <TR>
    <TD class=title width=7><IMG height=24 src="images/frm/arc.gif" 
      width=7></TD>
    <TD id="Tdhead" class=title align=left width=495><LABEL id="laHeadTitle">温馨提示</LABEL></TD>
  </TR>
  <TR>
    <TD height="132" colSpan=2 style="padding-left:32px; padding-top:12px;"><LABEL id="laLoginError" style="padding-right:12px;">设备重启!请重新</LABEL><a href="./" target="_parent"><LABEL id="laLogin" onClick="parent.location='./';">登录</LABEL></a></TD>
  </TR>
</TABLE>
    </td>
  </tr>
</table>
</body>
</html>