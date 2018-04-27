<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云台协议升级</title>
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
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>
</head>
<script language="javascript">
var FilePath, TypeChan, updateflag = true, reupdateflag = true;
function Checkfrm(){
	FilePath = trimEx($("filepath").value);
	TypeChan = parseInt($("ptzprotocol").value)+1+32;			//UPDATE_PTZ_PROTOCOL1 = 0x11
	if(TypeChan < 33 || isNaN(TypeChan)){TypeChan = 33;}
	if(TypeChan > 36){TypeChan = 36;}
	if(FilePath!=""){DownloadPTZ(TypeChan, FilePath); return false;}
	setTimeout(do_submit,0); return false;
}

function DownloadPTZ(nTypeChan,nFilePath){
	if(nFilePath == ""){remarkDisplay("divAlertHTML", "* " + ALERTFILENULL, 3E3, 1); return false;}
	var DFilePath 	= nFilePath.substr(nFilePath.lastIndexOf(".")+1)
	DFilePath = DFilePath.toLowerCase();
	if(DFilePath!="ptz"&&DFilePath!="bin"&&DFilePath!="pem"){
		remarkDisplay("divAlertHTML", "* " + ALERTFILEERROR, 3E3, 1); return false;
	}
	if(updateflag){
		$("WebCMS").m_szUrl			= pageURL;
		$("WebCMS").m_dwDataPort	= parseInt(pagePort);
		$("WebCMS").m_szUserName	= pageUNAME;
		$("WebCMS").m_szPassword	= pagePASSWORD;
		$("WebCMS").ShowTips(0);
		$("WebCMS").ShowAlarmDialog(0);
		$("WebCMS").SetFullWindow(1);
		$("WebCMS").m_ProtocolType	= 0;
		$("WebCMS").SetLoginMode(1);
		$("WebCMS").Login();
	}else{$("WebCMS").UpdatePTZProtocol(nTypeChan,nFilePath);}
}

function updateNVSEx(){
	if(reupdateflag){$("WebCMS").UpdatePTZProtocol(TypeChan, FilePath);}
}

function chgprotocol(paramflag){
	var tmpflag  = paramflag;
	if(tmpflag<0) return false;
	if(arrprotocolfile.length>=tmpflag){$("empro").value = arrprotocolfile[tmpflag];
	}else{$("empro").value  = ""; remarkDisplay("divAlertHTML", "* " + ALERTLOGINERROR, 3E3, 1);}
}

function init(){
  $("btnSave").addEvent("click", Checkfrm);
  try{
  	ChangeLanguage('../xml/sysptzupgrade.xml', m_szLanguage);
	if(typeof(arrprotocol)!="object"){return false;}
	if(!isArray(arrprotocol)){return false;}
	if(arrprotocol.length>0){
		$("ptzprotocol").length=0;
		for(i=0;i<arrprotocol.length;i++){$("ptzprotocol").options[i] = new Option(arrprotocol[i],i);}
	}
	if(typeof(selprotocol)!="number") 	return false;
	var tmpselprotocol 	= parseInt(selprotocol);
	if(tmpselprotocol<=arrprotocol.length){$("ptzprotocol").options[tmpselprotocol].selected = true; chgprotocol(tmpselprotocol);}
  }catch(e){}
  try{
	var tmpdev = parseInt(getCookies("DEVICEIPC"));
	if(tmpdev==0){$("Trprotocol").style.display = "";}
  }catch(e){}
  return true;	
}
</script>
<body onLoad="parentinit(0,0,0);init();" style="overflow:hidden!important;">
<script language="javascript" for="WebCMS" event="CBK_UpdateSendPercent(nPer)">
//UpdatePer(nPer,"0"); reupdateflag = false;
</script>
<script language="javascript" for="WebCMS" event="CBK_UpdateSavePercent(nPer)">
//UpdatePer(nPer,"1");
</script>
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	if(nResult>=2){
		updateflag = false;
		$("WebCMS").UpdatePTZProtocol(TypeChan, FilePath);
		setTimeout("updateNVSEx();", 500); reupdateflag = true;
	}else{remarkDisplay("divAlertHTML", "* " + ALERTLOGINERROR, 3E3, 1); updateflag = true;}
</script>

<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; left:expression((document.body.offsetWidth-400)/2);" id="DivUpdatePer">
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
var bar=1, line="||", amount="||", CloseTimeout;
var myos = appInfo(), osVersion = myos.version;
function UpdatePer(nPer,nNun){ 
	var ObjD;
	var Objtext=eval(document.all("Divtext"));
	bar=nPer; if(bar>100){bar = 100;}
	if(nNun == "0"){Objtext.innerHTML=ALERTDOWNLOAD; window.status = ALERTDOWNLOAD + bar + "%";
	}else{ window.clearTimeout(CloseTimeout); Objtext.innerHTML=ALERTINSTALL; window.status = ALERTINSTALL + bar + "%";}
	amount="";
	for(i=1;i<=bar;i++){amount = amount + "|";}
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
	self.location.href="ptzupgrade.asp";
}
-->
</script>
</div>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/ptzUpgradeCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">云台协议升级</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
					<table width="97%" cellpadding="5" cellspacing="1">
						 <tr>
						  <td width="139" height="21" align="right" valign="top" id="Tdptzaddr"><LABEL id="laPTZAddr">云台解码器地址</LABEL></td>
						  <td width="337" align="left" valign="top">
						    <input name="ptzaddr" type="text" class="text" id="ptzaddr" style="width:254px;" onKeyPress="event.returnValue=isDigit();" value="1" maxlength="3" />
						  </td>
						 </tr>
						 <tr id="Trprotocol" style="display:none;">
						  <td width="139" height="21" align="right" valign="top" id="Tdptzprotocol"><LABEL id="laPTZProtocol">云台解码器协议</LABEL></td>
						  <td width="337" align="left" valign="top"><select name="ptzprotocol" class="text" id="ptzprotocol" style="width:254px;" onChange="chgprotocol(this.value)">
						  </select></td>
						 </tr>
						 <tr>
						  <td width="139" height="21" align="right" valign="top" id="Tdempro"><LABEL id="laProtocolName">协议文件名</LABEL></td>
						  <td width="337" align="left" valign="top">
						    <input name="empro" type="text" disabled="disabled" class="text distext" id="empro" style="width:254px;" value="PELCO_D_AB.cod" />
						  </td>
						 </tr>
						<tr>
						  <td height="21" align="right" valign="middle"><LABEL id="laFilePath">选择协议文件</LABEL></td>
						  <td align="left" valign="top"><input name="filepath" type="file" class="text" id="filepath"  style="width:320px;" lang="en" size="15" xml:lang="en" /></td>
						</tr>
					</table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn set_btn_pl140">
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
</form>
<%outPtzUpgradeCfgEx();%>

</body>
</html>
