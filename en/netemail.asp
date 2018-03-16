<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net Email</title>
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
	ChangeLanguage('../xml/netemail.xml', m_szLanguage);
	attachLimit("smtpport",1,65534);attachLimit("pop3port",1,65534);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netEmailCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">EMail 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td width="160" height="16" align="right" valign="middle" id="TdsmtpServer"><LABEL id="laSMTPServer">SMTP 服务器</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="smtpServer" type="text" class="text" id="smtpServer" maxlength="128" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="Tdpop3Server"><LABEL id="laPOP3Server">POP3 服务器</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="pop3Server" type="text" class="text" id="pop3Server" maxlength="128" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="TdfromMailAddr"><LABEL id="laMailFrom">邮件发送地址</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="fromMailAddr" type="text" class="text" id="fromMailAddr" maxlength="128" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="TdtoMailAddr"><LABEL id="laMailTo">邮件接收地址</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="toMailAddr" type="text" class="text" id="toMailAddr" maxlength="128" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="TdccMailAddr"><LABEL id="laMailCC">邮件抄送地址</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="ccMailAddr" type="text" class="text" id="ccMailAddr" maxlength="128" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="TdsmtpUser"><LABEL id="laSMTPUserName">SMTP 用户名</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="smtpUser" type="text" class="text" id="smtpUser" maxlength="128" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="TdsmtpPassword"><LABEL id="laSMTPPassword">SMTP 密码</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="smtpPassword" type="password" class="text" id="smtpPassword" maxlength="128" style="width:150px;" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="Tdpop3User"><LABEL id="laPOP3UserName">POP3 用户名</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="pop3User" type="text" class="text" id="pop3User" maxlength="128" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="Tdpop3Password"><LABEL id="laPOP3Password">POP3 密码</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="pop3Password" type="password" class="text" id="pop3Password" maxlength="128" style="width:150px;" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="TdsubjectMail"><LABEL id="laMailTitle">邮件标题</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="subjectMail" type="text" class="text" id="subjectMail" maxlength="128" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="TdtextMail"><LABEL id="laMailContent">邮件内容</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="textMail" type="text" class="text" id="textMail" maxlength="128" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="Tdsmtpport"><LABEL id="laSMTPPort">SMTP 端口</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="smtpport" type="text" class="text" id="smtpport" value="25" maxlength="32" /></td>
						</tr>
						<tr>
						  <td height="16" align="right" valign="middle" id="Tdsmtpssl"><LABEL id="laSSL">SSL</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><span style="margin:0px; padding:0px;">
							<input name="smtpssl" type="checkbox" id="smtpssl" value="0" onClick="checkClick('adva_frm','smtpssl')" />
						  </span></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="Tdpop3port"><LABEL id="laPOP3Port">POP3  端口</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><input name="pop3port" type="text" class="text" id="pop3port" value="110" maxlength="32" /></td>
						</tr>
						<tr style="display:none;">
						  <td height="16" align="right" valign="middle" id="Tdpop3ssl"><LABEL id="laPOP3SSL">POP3 SSL</LABEL></td>
						  <td height="16" colspan="2" align="left" valign="middle"><span style="margin:0px; padding:0px;">
							<input name="pop3ssl" type="checkbox" id="pop3ssl" value="0" onClick="checkClick('adva_frm','pop3ssl')" />
						  </span></td>
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
<%outNetEmailCfgEx();%>

</body>
</html>
