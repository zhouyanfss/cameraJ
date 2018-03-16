<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件升级</title>
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
var FilePath, Filetype, reupdateflag = true, updateflag = true;
function Checkfrm(){
	FilePath = trimEx($("filepath").value);
	if(FilePath == ""){remarkDisplay("divAlertHTML", "* " + ALERTFILENULL, 3E3, 1);return false;}
	var DFilePath 	= FilePath.substr(FilePath.lastIndexOf(".")+1)
	DFilePath = DFilePath.toLowerCase();
	if(DFilePath=="uot"){$("software_type").value	= 32;	//0x10
	}else if(DFilePath=="ufw"){$("software_type").value	= 32;		
	}else if(DFilePath=="ptz"){$("software_type").value	= 33;	//0x11
	}else if(DFilePath=="bin"){$("software_type").value	= 32;	//ں
	}else{
		if(parseInt($("cert").value) == 1){$("software_type").value = 33;	//升级证书文件
		}else{remarkDisplay("divAlertHTML", "* " + ALERTFILEERROR, 3E3, 1);return false;}
	}
	
	Filetype = parseInt($("software_type").value);
	if(updateflag){
		//$("WebCMS").m_szDeviceName	 = "NVS66163";
		$("WebCMS").m_szUrl			= pageURL;
		$("WebCMS").m_dwDataPort	= parseInt(pagePort);
		$("WebCMS").m_szUserName	= pageUNAME;
		$("WebCMS").m_szPassword	= pagePASSWORD;
		$("WebCMS").ShowTips(0);
		$("WebCMS").ShowAlarmDialog(0);
		$("WebCMS").SetFullWindow(1);
		$("WebCMS").m_ProtocolType	= 32;
		$("WebCMS").SetLoginMode(1);
		$("WebCMS").Login();
	}else{
		if(Filetype==33){$("WebCMS").UpdatePTZProtocol(Filetype, FilePath);
		}else{$("WebCMS").UpdateKernel(Filetype, FilePath);}
	}
	//saveCookie("SaveYes","ok",7);
	return false;
}
function updateNVSEx(){
	var myos = appInfo();
	if(reupdateflag && myos.msie && myos.version>=9){
		if(Filetype==33){$("WebCMS").UpdatePTZProtocol(Filetype, FilePath);
		}else{$("WebCMS").UpdateKernel(Filetype,FilePath);}
	}
}

function init(){
	try{
		ChangeLanguage('../xml/sysupgrade.xml', m_szLanguage);
		var i,arrvalue;
		var arrparam = (location.href.split('?')[1]).split('&');
		for(i=0;i<arrparam.length;i++){
			arrvalue = arrparam[i].split('=');
			if(arrvalue.length>1){if(arrvalue[0]=="cert"){$("cert").value = arrvalue[1];}}
		}
	}catch(e){}
	$("btnSave").addEvent("click", Checkfrm);
	return true;	
}
</script>
<body onLoad="parentinit(0,0,0);init();" style="overflow:hidden!important;">
<script language="javascript" for="WebCMS" event="CBK_UpdateSendPercent(nPer)">
//UpdatePer(nPer, "0"); reupdateflag = false;
</script>
<script language="javascript" for="WebCMS" event="CBK_UpdateSavePercent(nPer)">
//UpdatePer(nPer, "1");
</script>
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	if(nResult>=2){
		updateflag = false;
		if(Filetype==33){$("WebCMS").UpdatePTZProtocol(Filetype, FilePath);
		}else{$("WebCMS").UpdateKernel(Filetype, FilePath);}
		setTimeout("updateNVSEx();" , 500); reupdateflag = true;
	}else{remarkDisplay("divAlertHTML", "* " + ALERTLOGINERROR, 3E3, 1); updateflag = true;}
</script>

<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; left:expression((document.body.offsetWidth-400)/2); " id="DivUpdatePer">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center bgColor=#ffffe7 border=1>
  <TR>
  <TD align=middle height=56 >
<form name="loading" id="loading" style="margin:0px; padding:0px;">
 <p align=center> <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:8px;" id="Divtext" size="2" face="Arial">Loading, please wait ...</div>
 <input type=text name="chart" id="chart" size=46 style="font-family:Arial; font-weight:bolder; color:#0066ff; background-color:#fef4d9; padding:0px; border-style:none;">
 <input type=text name="percent" id="percent" size=38 style="color:#0066ff; text-align:center; border-width:medium; border-style:none; background-color:#ffffe7;">
 </p>
</form>
  </TD></TR>
  </TABLE>
 <script> 
 <!--
var bar=1, outtime, line="||", amount="||", CloseTimeout;
var myos = appInfo(), osVersion = myos.version;
function UpdatePer(nPer,nNun){
	var ObjD;
 	var Objtext=eval(document.all("Divtext"));
	bar=nPer; if(bar>100){bar = 100;}
	if(nNun == "0"){Objtext.innerHTML=ALERTDOWNLOAD; window.status = ALERTDOWNLOAD + bar + "%";
	}else{window.clearTimeout(CloseTimeout); Objtext.innerHTML=ALERTINSTALL; window.status = ALERTINSTALL + bar + "%";}
	amount=""; for(i=1;i<=bar;i++){amount =amount + "|" ;}
	$("chart").value = amount; $("percent").value = bar+"%" ;
	ObjD=eval(document.all("DivUpdatePer"));
	if (bar<100){
		ObjD.style.top = "120px"; if(osVersion==10){ObjD.style.left = "210px";}
		ObjD.style.display="block";
	}else{
		window.clearTimeout(CloseTimeout);
		if (bar<100){CloseTimeout = setTimeout("CloseUpdatePer("+nNun+")",90000);
		}else{
			var outtimenum = 30000;
			try{
				var temp = document.URL.split('//')[1].split('/')[0].split(':')[0];
				if(temp.indexOf("10.")==0||temp.indexOf("192.")==0||temp.indexOf("172.")==0){outtimenum = 5000;}
			}catch(e){}
			CloseTimeout = setTimeout("CloseUpdatePer(" + nNun + ")",outtimenum);
		}
	}
}
function CloseUpdatePer(){
    var ObjD=eval(document.all("DivUpdatePer"));
	ObjD.style.display="none"; window.status = "";
	var Filetype = parseInt($("software_type").value);
	if(parseInt($("cert").value) == 1){self.location.href="httpscfg.asp";
	}else{
		if(Filetype==4){self.location.href="sysupgrade.asp";
		}else{top.location.href="./";}
	}
}
-->
</script>
</div>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/sysUpgradeCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">软件升级</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="680" cellpadding="5" cellspacing="1">
						 <tr>
						  <td width="160" height="21" align="right" valign="top" id="Tdver"><LABEL id="laVersion">当前内核版本</LABEL></td>
						  <td align="left" valign="top"><input name="software_ver" type="text" disabled="disabled" class="text distext" id="software_ver" style="width:254px;" value="4.2.0.0 " /></td>
						</tr>
						<tr style="display:none;">
						 <td height="21" align="right" id="Tdtype" ><LABEL id="laType"> </LABEL></td>
						 <td align="left">
						  <select name="software_type" class="select1" id="software_type"  style="width:254px;">
							<option id="opType1" value="32" selected="selected">应用程序(*.uke)</option>
							<option id="opType2" value="39">OCX 控件(*.uoc)</option>
							<option id="opType3" value="32">页面文件(*.uwe)</option>
							<option id="opType4" value="32">其他(*.uot)</option>
							<option id="opType5" value="33">云台协议(*.cod)</option>
						 </select></td>
						</tr>
						<tr>
						  <td height="21" align="right" valign="middle"><LABEL id="laFilePath">选择升级文件</LABEL></td>
						  <td align="left" valign="top"><input name="filepath" type="file" class="text" id="filepath"  style="width:320px; border-top:0px;" lang="en" size="15" xml:lang="en" /></td>
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
		<div id="StrNotice" class="divnotice" style="display:none;">
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>				
<object name="WebCMS" ID="WebCMS" width="0" height="0" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" CODEBASE="/WebCMS.exe#Version=2,0,0,0">
</object>
<input name="cert" id="cert" type="hidden" value="0">
</form>
<%outSysUpgradeCfgEx();%>
</body>
</html>
