<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
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
	var uname=$("uname").value;
	var pwd=$("passwd").value;
	var cpwd=$("passwd1").value;
	if(uname==""){
		remarkDisplay("divAlertHTML", "* " + ALERTNAMENULL, 3E3, 1);
		return false;
	}
	if(!check_com(uname,USERCHECKSTRING)){
		remarkDisplay("divAlertHTML", "* " + ALERTNAMEERROR, 3E3, 1);
		return false;
	}
	if(pwd==""){
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDNULL, 3E3, 1);
		return false;
	}
	if(!check_com(pwd,USERCHECKSTRING)){
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDERROR, 3E3, 1);
		return false;
	}
	if(pwd!=cpwd){
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDCONFIRM, 3E3, 1);
		return false;
	}
	
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

function chgmodiyuser(paramflag){
	var tmpflag  = paramflag;
	if(tmpflag<0) return false;
	if(unameInf.length>=tmpflag&&upasswdInf.length>=tmpflag){
		$("uname").value  = unameInf[tmpflag];
		$("passwd").value = upasswdInf[tmpflag];
	}else{
		$("uname").value  = "";
		$("passwd").value = "";
		remarkDisplay("divAlertHTML", "* " + ALERTPARAMETERERROR, 3E3, 1);
	}
	
}
function initumanage(){
	if(typeof(uflagInf)!="object") 	return false;
	if(!isArray(uflagInf))			return false;
	if(uflagInf.length>0){
		$("uflag").length=0;
		for(i=0;i<uflagInf.length;i++){
			$("uflag").options[i] = new Option(uflagInf[i],i);
		}
	}
	if(isArray(unameInf)&&unameInf.length>0){
		$("uname").value = unameInf[0];
	}
	if(isArray(upasswdInf)&&upasswdInf.length>0){
		$("passwd").value = upasswdInf[0];
	}
	if(typeof(selectuser)!="number") 	return false;
	var tmpselectuser 	= parseInt(selectuser);
	if(tmpselectuser<=uflagInf.length){
		$("uflag").options[tmpselectuser].selected	= true;
		chgmodiyuser(tmpselectuser);
	}
		
}
function init(){
	ChangeLanguage('../xml/umanage.xml', m_szLanguage);
	initumanage();	//读取参数
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/umanageCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">用户管理</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="520" cellpadding="5" cellspacing="1">
                      <tr id="Trvalidate">
                        <td width="160" height="21" align="right" id="Tdvalidate"><LABEL id="laValidate">认证方式</LABEL></td>
                        <td height="21" align="left"><label>
                          <select name="uvalidate" id="uvalidate" style="width:156px;">
                            <option value="0" selected>WEB</option>
                        </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td height="21" align="right" id="Tdtype"><LABEL id="laType">选择用户</LABEL></td>
                        <td height="21" align="left"><label>
                          <select name="uflag" id="uflag" style="width:156px;" onChange="chgmodiyuser(this.value);">
                        </select>
                        </label></td>
                      </tr>
                      <tr>
                        <td height="21" align="right" id="Tdname"><LABEL id="laName">用户名</LABEL></td>
                        <td height="21" align="left"><input name="uname" type="text" class="text" id="uname" value="Admin" maxlength="15"  style="width:156px;"/></td>
                      </tr>
                      <tr>
                        <td height="21" align="right" id="Tdpsw"><LABEL id="laPassword">用户密码</LABEL></td>
                        <td height="21" align="left"><input name="passwd" type="text" class="text" id="passwd" maxlength="15" style="width:156px;" /></td>
                      </tr>
                      <tr>
                        <td height="21" align="right" id="Tdpsw1"><LABEL id="laPassword2">确认密码</LABEL></td>
                        <td height="21" align="left"><input name="passwd1" type="text" class="text" id="passwd1" maxlength="15" style="width:156px;" /></td>
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
		<div id="StrNotice" class="divnotice">
		<LABEL id="laNotice"><span style="color:#FF0000; font-weight:700;">注意:</span>用户名、密码必须是字母、数字、下划线或点(.)组成的一个1至15 个字符的字符串，请注意大小写。<br>
		修改用户名或密码，请重新登录。</LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>				
</form>
<%outUmanageCfgEx();%>
</body>
</html>
