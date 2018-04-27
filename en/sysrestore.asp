<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>恢复出厂设置</title>
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

<script language="javascript" type="text/javascript" src="./js/cprogress.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	//remarkDisplay("divAlertHTML", " ", 3E3, 1);
	$("inputpsw").value = "";
	funptzmsg('massage_box',60,2);
	$("inputpsw").focus();
	//saveCookie("SaveYes","ok",7);
	return false;
}
function funbtnSubmit(){
	var repsw = $("inputpsw").value;
	var syspsw	= pagePASSWORD;
	if(repsw == syspsw){	
		var strurl	= "/webs/btnHitEx?flag=20&network=" + $s("network").value + "&other=" + $s("other").value;
		window.parent.btnHit.location.href = strurl;
		setTimeout("window.top.location.href='./';",43000);
		//remarkDisplay("divAlertHTML", " ", 3E3, 1);
		playDiv();		
	}else{
		remarkDisplay("divAlertHTML", "* " + ALERTPASSWORDERROR, 3E3, 1);
	}
	//saveCookie("SaveYes","ok",7);
	return false;
}
function KeyDownHandler(){//=====
	if (event.keyCode == 13){
		if(document.all("massage_box").style.visibility!="visible") return false;
		event.returnValue=false;
		event.cancel = true;
		funbtnSubmit();
	}
}
function init(){
	ChangeLanguage('../xml/sysrestore.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();" onkeydown="KeyDownHandler();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/sysRestoreCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">恢复出厂设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain"><br />
<span style="color:#FF0000">*</span> <LABEL id="laAlert">单击此按钮将使设备的所有设置恢复到出厂时的默认状态。</LABEL>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn200">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave" class="btn200"><LABEL id="btnSaveSumbit">恢复出厂设置</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</form>
<div id="massage_box" style="display:none; ">
  <div class="massage"> 
    <div class="header" onmousedown=MDown(massage_box)> 
      	<div id="DivPRETitle"><LABEL id="laPasswordTitle">请输入你的登录密码</LABEL></div><span onClick="massage_box.style.visibility='hidden';" style="float:right; width:28px; height:100%; padding:0 0 3 12; display:inline; cursor:hand; font-size:14px; font-weight:600;"> × </span> 
	</div>
		<table width="99%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="12" colspan="2"></td>
		  </tr>
		  <tr id="trRestore" style="display:none; ">
			<td height="32"  align="right" id="TdRestore"><LABEL id="laRestore">复位：</LABEL></td>
			<td style=" padding:0 0 0 8;">
			<input name="network" type="checkbox" id="network" onClick="checkClick('outcfg_frm','network')" value="1" checked>
			<LABEL id="laNetwork">网络参数</LABEL>
			<input name="other" type="checkbox"   id="other"   onClick="checkClick('outcfg_frm','other')" value="1" checked>
			<LABEL id="laOther">其他参数</LABEL>
			</td>
		  </tr>
		  <tr>
			<td width="40%" align="right" id="Tdpsw"><LABEL id="laPassword">密码：</LABEL></td>
			<td width="60%" valign="bottom" style=" padding:0 0 0 12;"><input name="inputpsw" type="password" class="text" id="inputpsw" value="" style="width:86px;" maxlength="16" onFocus="this.select()" onMouseOver="this.focus()" /></td>
		  </tr>
		  <tr>
			<td height="45" colspan="2" align="center" style="padding-left:68px;"><a hidefocus="true" class="btn69 act" href="javascript:;" onClick="funbtnSubmit();" id="btnSave"><LABEL id="btnSubmit">确定</LABEL></a></td>
		  </tr>
	</table>	
  </div> 
</div> 
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
	$s("massage_box").style.display	= "none";
	$s("divAlert").innerHTML	= ALERTDEVICERESTART;
	$s("divProgress").style.display	= "";
	progress.SetPos(0);
}
//-->
</script>
</div>
</body>
</html>
