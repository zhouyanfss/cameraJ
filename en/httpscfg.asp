<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Net HTTPS</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./script/ajax.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/send.js"></script>

<script type="text/javascript" language="javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>
<script type="text/javascript" language="javascript" src="./js/cprogress.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	if($s("policy2").value!=$s("policy").value){
		alert(Certalert);
	}
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function openPopUp(thePage, theName, theWidth, theHeight)
{
  theWidth = Number( theWidth ) + 10;
  theHeight = Number( theHeight ) + 20;

  var someFeatures = 'scrollbars=yes,toolbar=0,location=no,directories=0,status=0,menubar=0,resizable=1,width=' + theWidth + ',height=' + theHeight;
  var aPopUpWin = window.open(thePage, theName, someFeatures);

  if (navigator.appName == "Netscape" && aPopUpWin != null) {
    aPopUpWin.focus();
  }
}
function funcertificate(flag){
	switch(flag){
	case 0:		//创建自签名证书
		$s("DivPRETitle").innerHTML	= CertificateSelf;
		$s("trValidity").style.display	= "";
		$s("trKey").style.display		= "none";
		$s("cert_cmd").value		= "0";
		funptzmsg('massage_box',0,180);
	break;
	case 1:		//创建证书请求
		$s("DivPRETitle").innerHTML	= CertificateCreate;
		$s("trValidity").style.display	= "none";
		$s("trKey").style.display		= "";
		$s("cert_cmd").value		= "1";
		funptzmsg('massage_box',0,180);
	break;
	case 2:		//安装签名证书
		$s("DivPRETitle").innerHTML	= CertificateInstall;
		$s("trValidity").style.display	= "none";
		$s("trKey").style.display		= "";
		$s("cert_cmd").value		= "2";
		self.location.href = "sysupgrade.asp?cert=1";	//转软件升级页面处理升级
	break;
	case 30:		//提交证书处理(创建自签名证书、创建证书请求)
		var certCmd	= $s("cert_cmd").value;
		begin();
	break;
	case 10:		//创建请求属性查看
		openPopUp('privcsrSrv.pem', 'ViewCertificateRequest', '630', '520');
	break;
	case 11:		//创建请求移除
	  var url = "/webs/btnHttpsEx?";
	  url += "cert_state=1";
	  url += "&cert_cmd=10";
	  if($s("policy2").value!=0){
	  	alert(Certdelete);
	  }
	  ajaxcmd(url, 10);
	break;
	case 20:		//安装证书属性查看
		openPopUp('certSrv.pem', 'ViewCertificate', '630', '640');
	break;
	case 21:		//安装证书移除
	  var url = "/webs/btnHttpsEx?";
	  url += "cert_state=1";
	  url += "&cert_cmd=11";
	  if($s("policy2").value!=0){
	  	alert(Certdelete);
	  }
	  ajaxcmd(url, 11);
	break;
	
	default:
	window.status = ALERTVIEWLOGINERRORCODE8 + nResult;
	break;
	}
}
function begin()
{
  var form = document.outcfg_frm
  var country = form.cert_C.value

  if (country.length != 2) {
    alert(CertCC);
    form.cert_C.focus();
    form.cert_C.select()
    return;
  }

  for (var i = 0; i < 2; i++) {
    var c = country.charAt(i)
    if (!((c>='A' && c<='Z') || (c>='a' && c<='z'))) {
      alert(CertCC);
      form.cert_C.focus()
      form.cert_C.select()
      return
    }
  }

  form.cert_C.value = country.toUpperCase()

    if (!IntegerCheck(form.cert_days.value, 1, 9999)) {
    alert("Incorrect validity string!");
    form.cert_days.focus();
    form.cert_days.select();
    return;
  }

  var url = "/webs/btnHttpsEx?";
  url += "cert_state=1";
  url += "&cert_cmd=" + escape(form.cert_cmd.value);
  url += "&cert_C=" + escape(form.cert_C.value);
  url += "&cert_ST=" + escape(form.cert_ST.value);
  url += "&cert_L=" + escape(form.cert_L.value);
  url += "&cert_O=" + escape(form.cert_O.value);
  url += "&cert_OU=" + escape(form.cert_OU.value);
  url += "&cert_CN=" + escape(form.cert_CN.value);
  if(form.cert_cmd.value=="0"){
  	url += "&cert_days=" + escape(form.cert_days.value);
  }else{
  	url += "&cert_KEY=" + escape(form.cert_KEY.value);
  
  }
  url += "&format=ssi";
  ajaxcmd(url, form.cert_cmd.value);
}
function IntegerCheck(value, low, high)
{
  if (value.length == 0)
    return 0

  if (((value.charAt(0)<'0') || (value.charAt(0)>'9')) && value.charAt(0) != '-')
    return 0

  for (var i=1; i<value.length; i++) {
    if ((value.charAt(i)<'0') || (value.charAt(i)>'9'))
      return 0
  }
  var integerValue = parseInt(value, 10)
  if (high == "noUpperLimit") {
    if (integerValue<low)
      return 0
  } else {
    if ((integerValue<low) || (integerValue>high))
      return 0
  }

  return 1
}
function ajaxcmd(url, CMD_Flag){
try{
	window.status = "";
	var strurl = url;
	var xmlText 	= "<Message><flag>2020</flag></Message>";
	
	CreateAjax();
	if(!oSend){window.status = CREATEXMLHTTPERROR; return false;}
	
//	window.status = strurl;
	playDiv();
	oSend.onreadystatechange = function (){alertajaxcmd(CMD_Flag);}
  //alert(strurl);
	oSend.open("POST",strurl,true);
	oSend.setRequestHeader("CONTENT-TYPE", "text/xml")
	oSend.send(xmlText);
 }catch(e){window.status = SENDXMLHTTPERROR; stopDiv(0); return false;}	
}
function alertajaxcmd(CMD_Flag){
   if (oSend.readyState == 4) {
        if (oSend.status == 200){
			var Strreturn;
			try{
				LoadXMLDocument(xmlResult,oSend);	//兼容其他浏览器
			}catch(e){
				window.status = CREATEDOMDOCERROR;
				return false;
			}
			try{
				//Strreturn 	= xmlResult.selectSingleNode("html/body/atreturn").text;
				//$s("atreturn").value	= Strreturn;
			}catch(e){
				window.status = RETURNXMLERROR;
			}
			stopDiv(1);
			return false;
		}else if(oSend.status == 404){
			
			window.status = URLERROR;
			stopDiv(0);
			return false;
		}
   }
}

function init(){
	ChangeLanguage('../xml/httpscfg.xml', m_szLanguage);
	if($s("divCertState").innerHTML == ""){
		$s("divCertInfo").innerHTML	= getNodeValue("divCertInfo");
	}
	if($s("divCertCre").innerHTML == ""){
		$s("divCertRequest").innerHTML	= getNodeValue("divCertRequest");
	}
	var certEnable	= true;
	if($s("divCertCre").innerHTML != ""){
		$s("btnReProperties").disabled 	= false;
		$s("btnReRemove").disabled 		= false;
		certEnable	= false;
	}else{
		$s("btnInstall").disabled 		= true;
	}
	if($s("divCertState").innerHTML != ""){
		$s("btnCerpProperties").disabled = false;
		$s("btnCerRemove").disabled 	= false;
		$s("btnInstall").disabled 		= true;
		certEnable	= false;
	}
	if(certEnable==false){
		$s("btnCreateSelf").disabled 	= true;
		$s("btnCreate").disabled 		= true;
	}
	if($s("vsubmit").value=="1"){
		$s("btnSave").disabled 	= false;
		if($s("divCertCre").innerHTML != ""){
			$s("btnInstall").disabled = true;
		}
	}else{
		$s("btnSave").disabled 	= true;
	}
	$s("policy2").value	= $s("policy").value;
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/httpsCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">HTTPS 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table border="1" width="420" cellspacing="0" cellpadding="0">
               <tr>
                <td height="86" valign="middle">
					<table width="100%" cellpadding="5" cellspacing="1">
                <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="TdCreate"><LABEL id="laCreate">创建和安装</LABEL></td>
                  </tr>
                <tr>
                  <td height="36" colspan="2" valign="bottom">
				  <input name="btnCreateSelf" type="button" class="button" id="btnCreateSelf" value="创建自签名证书" align="center" style="width:176px;" onClick="funcertificate(0);"></td>
                  </tr>
                <tr>
                  <td height="32" colspan="2">
				  <input name="btnCreate" type="button" class="button" id="btnCreate" value="创建证书请求" align="center" style="width:176px;" onClick="funcertificate(1);">
				  <input name="btnInstall" type="button" class="button" id="btnInstall" value="安装签名证书" align="center" style="width:176px; margin-left:8px;" onClick="funcertificate(2);"></td>
                  </tr>
                 <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdrequest"><LABEL id="laRequest">创建请求</LABEL></td>
                  </tr>
                <tr>
                  <td height="21" colspan="2" style="margin:0px; padding:0px;">
				  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC" id="Tablerequest">
                    <tr>
                      <td width="25%" align="right" bgcolor="#F5F5F5" id="Tdsubject"><LABEL id="laSubject">主题名称</LABEL></td>
                      <td bgcolor="#F5F5F5" id="tdCertReq"><div id="divCertRequest" style="width:100%; height:18px; overflow:hidden;">没有创建证书请求。</div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#F5F5F5" id="Tdcreated"><LABEL id="laCreated">创建</LABEL></td>
                      <td bgcolor="#F5F5F5" id="tdCertCre"><div id="divCertCre" style="width:100%; height:18px; overflow:hidden;"></div></td>
                    </tr>
                  </table>
				  </td>
                  </tr>
                 <tr>
                  <td height="36" colspan="2" valign="bottom">
				  <input name="btnReProperties" type="button" class="button" id="btnReProperties" value="属性" align="center" style="width:96px;" onClick="funcertificate(10);" disabled="disabled">
				  <input name="btnReRemove" type="button" class="button" id="btnReRemove" value="移除" align="center" style="width:96px; margin-left:8px;" onClick="funcertificate(11);" disabled="disabled">
				  </td>
                  </tr>
                 <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdcertificate"><LABEL id="laCertificate">安装证书</LABEL></td>
                  </tr>
                <tr>
                  <td height="21" colspan="2" style="margin:0px; padding:0px;">
				  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC" id="Tablerequest">
                    <tr>
                      <td width="25%" align="right" bgcolor="#F5F5F5" id="Tdcersubject"><LABEL id="laCerSubject">主题名称</LABEL></td>
                      <td bgcolor="#F5F5F5" id="tdCertInfo"><div id="divCertInfo" style="width:100%; height:18px; overflow:hidden;">没有证书信息。</div></td>
                    </tr>
                    <tr>
                      <td align="right" bgcolor="#F5F5F5" id="Tdstate"><LABEL id="laState">状态</LABEL></td>
                      <td bgcolor="#F5F5F5" id="tdCertState"><div id="divCertState" style="width:100%; height:18px; overflow:hidden;"></div></td>
                    </tr>
                    <tr>
                      <td colspan="2" bgcolor="#F5F5F5" id="Tdcer"></td>
                      </tr>
                  </table>				  </td>
                  </tr>
                 <tr>
                  <td height="36" colspan="2" valign="bottom">
				  <input name="btnCerpProperties" type="button" class="button" id="btnCerpProperties" value="属性" align="center" style="width:96px;" onClick="funcertificate(20);" disabled="disabled">
				  <input name="btnCerRemove" type="button" class="button" id="btnCerRemove" value="移除" align="center" style="width:96px; margin-left:8px;" onClick="funcertificate(21);" disabled="disabled">
				  </td>
                  </tr>
                 <tr class="ttitlebg">
                  <td height="21" colspan="2" align="left" id="Tdpolicy"><LABEL id="laPolicy">HTTPS连接模式</LABEL></td>
                  </tr>
                 <tr>
                  <td width="26%" height="21" align="right" id="Tdenable"><LABEL id="laEnable">开启模式</LABEL></td>
                  <td width="74%" height="21" align="left">
        <select name="policy" id="policy">
          <option value="0" selected>HTTP</option>
          <option value="1">HTTPS</option>
          <option value="2">HTTP & HTTPS</option>
        </select>
				</td>
                 </tr>
              </table>
				  </td>
                </tr>
           </table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn">
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
<input name="policy2" id="policy2" type="hidden" value="0"><input name="vsubmit" id="vsubmit" type="hidden" value="0">
<div id="massage_box" style="display:none; width:360px; ">
  <div class="massage" style="width:358px;">
    <div class="header" style="width:358px;" onmousedown=MDown(massage_box)> 
      	<div id="DivPRETitle"><LABEL id="laPRETitle">创建自签名证书</LABEL></div><span onClick="massage_box.style.visibility='hidden';" style="float:right; width:28px; height:100%; padding:0 0 3 12; display:inline; cursor:hand; font-size:14px; font-weight:600;"> × </span> 
	</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td width="42%" align="right" id="tdCountry"><LABEL id="laCountry">国家:&nbsp;</LABEL></td>
            <td width="58%" ><input name="cert_C" type="text" class="text" value="" maxlength="2" style="width:38px;"></td>
          </tr>
          <tr>
            <td align="right" id="tdProvince"><LABEL id="laProvince">州或省:&nbsp;</LABEL></td>
            <td><input name="cert_ST" type="text" class="text" value="" maxlength="40"></td>
          </tr>
          <tr>
            <td align="right" id="tdLocality"><LABEL id="laLocality">位置:&nbsp;</LABEL></td>
            <td ><input name="cert_L" type="text" class="text" value="" maxlength="40"></td>
          </tr>
          <tr>
            <td align="right" id="tdOrganization"><LABEL id="laOrganization">组织:&nbsp;</LABEL></td>
            <td><input name="cert_O" type="text" class="text" value="" maxlength="40"></td>
          </tr>
          <tr>
            <td align="right" id="tdUnit"><LABEL id="laUnit">组织单位:&nbsp;</LABEL></td>
            <td ><input name="cert_OU" type="text" class="text" value="" maxlength="40"></td>
          </tr>
          <tr>
            <td align="right" id="tdCommon"><LABEL id="laCommon">名称:&nbsp;</LABEL></td>
            <td><input name="cert_CN" type="text" class="text" value="" maxlength="64"></td>
          </tr>
          <tr id="trKey">
            <td align="right" id="tdKey"><LABEL id="laKey">密钥:&nbsp;</LABEL></td>
            <td>
        <select name="cert_KEY" id="cert_KEY" style="width:130px;">
          <option value="512">512</option>
          <option value="1024" selected>1024</option>
          <option value="2048">2048</option>
        </select>
			</td>
          </tr>
            <tr id="trValidity">
              <td align="right" id="tdValidity"><LABEL id="laValidity">有效性:&nbsp;</LABEL></td>
              <td ><input name="cert_days" type="text" class="text" value="365" maxlength="4" style="width:38px;"> 
              <LABEL id="laDays">天[1..9999]</LABEL></td>
            </tr>
            <tr>
              <td height="38" colspan="2" align="center" >
			  <input name="btnSubmit" type="button" class="btn69 act" id="btnSubmit" value="提交" align="center" onClick="funcertificate(30);">
			  <input name="btnCancel" type="button" class="btn69 act" id="btnCancel" value="取消" align="center" style="margin-left:8px;" onClick="massage_box.style.visibility='hidden';"></td>
            </tr>
    </table>
		<input type="hidden" name="cert_state" value="0">
		<input type="hidden" name="cert_cmd" value="newcert">
  </div> 
</div> 
</form>
<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; top:180px; left:expression((document.body.offsetWidth-400)/2); " id="divProgress">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center bgColor=#ffffe7 border=1>
  <TR>
  <TD align=middle height=56 style="padding-top:12px;">
  <div id="progress" style="text-align:left;"></div>
  <div id="divAlert" style="text-align:center; padding-top:5px;"></div>
  </TD></TR>
  </TABLE>
<script type="text/javascript" language="javascript">
<!--
var progress = new CProgress("progress", 0, 100, 0, 1);
progress.progressWidth = 300;
progress.Create();
playInc	= setInterval("progress.Inc();", 50);
function playDiv(){
	$s("divAlert").innerHTML	= Certupdata;
	$s("divProgress").style.display	= "";
	progress.SetPos(0);
}
function stopDiv(flag){
	$s("divAlert").innerHTML	= Certrefresh;
	if(flag==1){
		setTimeout("self.location.href='httpscfg.asp';", 2000);
	}else{
		setTimeout("$s('divProgress').style.display	= 'none';", 2000);
	}
}
//-->
</script>
</div>
<%outHttpsCfgEx();%>
</body>
</html>
