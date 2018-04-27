<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>3G设置 </title>
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

<style type="text/css">
<!--
.input2{
	width:132px;
}
//-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function btnHitEx(numi){
	try{
	  if(numi==0){
		location.href="3gcfg.asp";
	  }else if(numi==1){
			funptzmsg('massage_box',0,180);
	  }else{funptzmsg('pinmassage_box',0,180); funatcommand(2);}
	}catch(e){}
}

function enableadv(){
	if($s("ckadv").checked==false){
		$s("tradvset").style.display="none";
		$s("ckadv").value=0;
	}else{
		$s("tradvset").style.display="";
		$s("ckadv").value=1;
	}
}
function enabledial(){
	if($s("ckdial").checked==false){
		$s("trdialset").style.display="none";
		$s("ckdial").value=0;
	}else{
		$s("trdialset").style.display="";
		$s("ckdial").value=1;
	}
}
function init(){
	ChangeLanguage('../xml/3gcfg.xml', m_szLanguage);
	if($s("debuginfo").value=="1"){
		$s("trdebugset").style.display = "";
	}
	enabledial();
	$("btnSave").addEvent("click", Checkfrm);
}
//Objcmd 0发AT命令 1设置PIN参数 2获取PIN参数
function funatcommand(Objcmd){
try{
	window.status = "";
	var strurl = "/webs/btnHitEx";
	var xmlText 	= "<Message><flag>2020</flag>";
	xmlText 		= xmlText + "<paramcmd>2020</paramcmd>";
	xmlText 		= xmlText + "<paramctrl>2020</paramctrl>";
	xmlText 		= xmlText + "<paramstep>2020</paramstep>";
	xmlText			= xmlText + "</Message>";
	
	CreateAjax();
	if(!oSend){window.status = CREATEXMLHTTPERROR; return false;}
	//strurl	= escape(strurl + "?flag=2020&paramchannel=0&paramcmd=2020&paramctrl=2020&paramstep=2020&paramreserved=2020&atcmd=" + $s("atcmd").value.replace(/\+/g,"%2B"));
	if(Objcmd==0){
		strurl	= strurl + "?flag=2020&paramchannel=0&paramcmd=2020&paramctrl=2020&paramstep=2020&paramreserved=2020&atcmd=" + $s("atcmd").value.replace(/\+/g,"%2B");
	}else if(Objcmd==1){
		strurl	= strurl + "?flag=2030&cmd=1&enable=" + $s("pinenable").value + "&password=" + $s("pinpsw").value;
	}else{
		strurl	= strurl + "?flag=2030&cmd=0";
	}
	//alert(strurl);
//	window.status = strurl;
	oSend.onreadystatechange = function (){alertatcmd(Objcmd);}
	oSend.open("POST",strurl,true);
	oSend.setRequestHeader("CONTENT-TYPE", "text/xml")
	oSend.send(xmlText);
 }catch(e){window.status = SENDXMLHTTPERROR; return false;}	
}
//Objcmd 0发AT命令 1设置PIN参数 2获取PIN参数
function alertatcmd(Objcmd){
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
				if(Objcmd==0){
					Strreturn 	= xmlResult.selectSingleNode("html/body/atreturn").text;
					$s("atreturn").value	= Strreturn;
				}else if(Objcmd==1){
					Strreturn 	= xmlResult.selectSingleNode("html/body/atreturn").text;
					$s("pinalert").value	= Strreturn;
				}else{
					Strreturn 	= xmlResult.selectSingleNode("html/body/atreturn").text;
					$s("pinalert").value	= Strreturn;
					Strreturn 	= xmlResult.selectSingleNode("html/body/password").text;
					$s("pinpsw").value	= Strreturn;
					Strreturn 	= xmlResult.selectSingleNode("html/body/enable").text;
					if(Strreturn=="1"){
						$s("pinenable").value	= 1;
						$s("pinenable").checked	= true;
					}else{
						$s("pinenable").value	= 0;
						$s("pinenable").checked	= false;
					}
				}
			}catch(e){
				window.status = RETURNXMLERROR;
			}
			return false;
		}else if(oSend.status == 404){
			window.status = URLERROR;
			return false;
		}
   }
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/3GCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">3G 设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
		  <table border="1" width="520" cellspacing="0" cellpadding="0">
               <tr>
                <td height="86" valign="middle">
				<table width="100%" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="160" height="21" align="right" id="Tdenable3g"><LABEL id="laEnable">3G开关</LABEL></td>
                  <td height="21" align="left"><input name="ckcdma" type="checkbox" id="ckcdma" value="0" onClick="checkClick('cdma_frm','ckcdma')" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdsignal"><LABEL id="laSignalIntensity">信号强度</LABEL></td>
                  <td height="21" align="left">
                    <select name="cdmasignal" class="input2" id="cdmasignal" disabled="disabled">
                      <option id="opSignal1" value="0">未知</option>
                      <option id="opSignal2" value="1">较弱</option>
                      <option id="opSignal3" value="2">弱</option>
                      <option id="opSignal4" value="3">一般</option>
                      <option id="opSignal5" value="4">强</option>
                      <option id="opSignal6" value="5">较强</option>
                    </select>
<a hidefocus="true" href="javascript:;" onClick="btnHitEx(0)" id="btnRefresh" class="btn69 act" style="margin-left:12px;"><LABEL id="btnRefresh">刷新</LABEL></a>
<a hidefocus="true" href="javascript:;" onClick="btnHitEx(1)" id="btnATCommand" class="btn69 act" style="margin-left:12px;display:none;"><LABEL id="btnATCommand">AT 命令</LABEL></a>
                  </td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Td3gtype"><LABEL id="la3GType">3G类型</LABEL></td>
                  <td height="21" align="left"><label>
                    <select name="cdmatype" class="input2" id="cdmatype">
                      <option value="0">CDMA2000</option>
                      <option value="1">WCDMA</option>
                      <option value="2">TD-SCDMA</option>
                    </select>
                  </label></td>
                </tr>
                <tr style="display:none;">
                  <td height="21" align="right" id="tdPin"><LABEL id="laPIN">PIN码</LABEL></td>
                  <td height="21" align="left">
<a hidefocus="true" href="javascript:;" onClick="btnHitEx(2)" id="pinMsgBox" class="btn104 act"><LABEL id="pinMsgBox">PIN码设置</LABEL></a>
                  </td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Td3gstatus"><LABEL id="la3GStatus">3G状态</LABEL></td>
                  <td height="21" align="left"><input name="cdmastatus" type="text" class="text" id="cdmastatus" style="color:#999999;" value="数据读取中..." maxlength="128" readonly="ture"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdsimstatus"><LABEL id="laSIMCardStatus">sim卡状态</LABEL></td>
                  <td height="21" align="left"><input name="simstate" type="text" class="text" id="simstate" readonly="ture" ></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdserstatus"><LABEL id="laServiceStatus">服务状态</LABEL></td>
                  <td height="21" align="left"><input name="serstate" type="text" class="text" id="serstate" readonly="ture" ></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdnetmode"><LABEL id="laNetworkMode">网络模式</LABEL></td>
                  <td height="21" align="left"><input name="netmode" type="text" class="text" id="netmode" readonly="ture" ></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdswver"><LABEL id="laSoftwareVersion">软件版本</LABEL></td>
                  <td height="21" align="left"><input name="swver" type="text" class="text" id="swver" readonly="ture" ></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdhwver"><LABEL id="laHardwareVersion">硬件版本</LABEL></td>
                  <td height="21" align="left"><input name="hwver" type="text" class="text" id="hwver" readonly="ture" ></td>
                </tr>
              </table>
			     </td>
              </tr>
           </table>
		  <table border="1" width="520" cellspacing="0" cellpadding="0" style="margin-top:21px;">
               <tr>
                <td height="56" valign="top">
				<table width="100%" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="160" height="21" align="right" id="Tdadvanced"><LABEL id="laAdvanced">高级设置</LABEL></td>
                  <td height="21" align="left"><label>
                    <input name="ckadv" type="checkbox" id="ckadv" value="0" onClick="enableadv()" >
                  </label></td>
                </tr>
                <tr id="tradvset" style="display:none">
                  <td height="21" colspan="2" align="right" style=" margin:0px; padding:0px;">
			  <table width="100%" border="0" align="right" cellpadding="1" cellspacing="1" style=" margin:0px; padding:0px;">
                <tr>
                  <td width="160" height="21" align="right" id="Tddialnum"><LABEL id="laDIALNumber">拨号号码</LABEL></td>
                  <td height="21" align="left"><label>
                    <input name="cdmanum" type="text" class="text" id="cdmanum">
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right" id="Tdapn"><LABEL id="laAPN">APN</LABEL></td>
                  <td width="345" height="21" align="left"><label>
                    <input name="cdmaapn" type="text" class="text" id="cdmaapn">
                  </label></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdname"><LABEL id="laUserName">用户名</LABEL></td>
                  <td height="21" align="left"><input name="username" type="text" class="text" id="username"></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdpassword"><LABEL id="laPassword">密码</LABEL></td>
                  <td height="21" align="left"><input name="password" type="password" class="text" id="password" style="width:132px;"></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdauth"><LABEL id="laAuthenticationType">验证类型</LABEL></td>
                  <td height="21" align="left"><select name="cdmasectype" class="input2" id="cdmasectype">
                    <option value="0">None</option>
                    <option value="1">PAP</option>
                    <option value="2">CHAP</option>
                                    </select></td>
                </tr>
                <tr id="trdebugset">
                  <td height="21" colspan="2" align="right" style=" margin:0px; padding:0px;">
			  <table width="100%" border="0" align="right" cellpadding="1" cellspacing="1" style=" margin:0px; padding:0px;">
                <tr>
                  <td height="1" colspan="2" align="right"></td>
                  </tr>
                <tr>
                  <td width="160" height="21" align="right">Debug</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="debug" class="input2" id="debug">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                          </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Lock</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="lock" class="input2" id="lock">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                                </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Nodetach</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="nodetach" class="input2" id="nodetach">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                                </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Noauth</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="noauth" class="input2" id="noauth">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                                </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Noipdefault</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="noipdefault" class="input2" id="noipdefault">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                                </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Defaultroute</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="defaultroute" class="input2" id="defaultroute">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                                </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">DAsyncmap</td>
                  <td width="343" height="21" align="left"><label>
                  <select name="dasyncmap" class="input2" id="dasyncmap">
                    <option value="0">OFF</option>
                    <option value="1">ON</option>
                          </select>
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Llocal ip</td>
                  <td width="343" height="21" align="left"><label>
                  <input name="localip" type="text" class="text" id="localip">
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">Remote ip</td>
                  <td width="343" height="21" align="left"><label>
                  <input name="remoteip" type="text" class="text" id="remoteip">
                  </label></td>
                </tr>
                <tr style="display:none;">
                  <td width="160" height="21" align="right">Dns</td>
                  <td width="343" height="21" align="left"><label>
                  <input name="dns" type="text" class="text" id="dns">
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">para1</td>
                  <td width="343" height="21" align="left"><label>
                  <input name="para1" type="text" class="text" id="para1">
                  </label></td>
                </tr>
                <tr>
                  <td width="160" height="21" align="right">para2</td>
                  <td width="343" height="21" align="left"><label>
                  <input name="para2" type="text" class="text" id="para2">
                  </label></td>
                </tr>
				</table>
				  </td>
                  </tr>
				</table>
				  </td>
                </tr>
              </table>
			     </td>
              </tr>
           </table>
		  <table border="1" width="520" cellspacing="0" cellpadding="0" style="margin-top:21px;">
               <tr>
                <td height="56" valign="top">
				<table width="100%" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="160" height="21" align="right" id="Tddialcontrol"><LABEL id="laDialControl">拔号控制</LABEL></td>
                  <td height="21" align="left">
                    <input name="ckdial" type="checkbox" id="ckdial" value="0" onClick="enabledial();checkClick('cdma_frm','ckdial');" ></td>
                </tr>
                <tr id="trdialset" style="display:none">
                  <td height="21" colspan="2" align="right" style=" margin:0px; padding:0px;">
			  <table width="100%" border="0" align="right" cellpadding="1" cellspacing="1" style=" margin:0px; padding:0px;">				
			    <tr>
				  <td width="160" height="25" align="right" id="Tdtime1"><LABEL id="laDialTime1">拔号时间1设置</LABEL></td>
				  <td height="25" align="left"><input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('cdma_frm','ckevery')" />
				    <input name="begh1" type="text" maxlength="2" id="begh1" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm1" type="text" maxlength="2" id="begm1" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-
<input name="endh1" type="text" id="endh1" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm1" type="text" id="endm1" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
				  </tr>
                
                <tr>
                  <td height="21" align="right" id="Tdtime2"><LABEL id="laDialTime2">拔号时间2设置</LABEL></td>
                  <td height="21" align="left"><input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('cdma_frm','ckevery2')" />
                    <input name="begh12" type="text" id="begh12" onKeyPress="event.returnValue=isDigit();" maxlength="2" class="inputtime"  />
:
<input name="begm12" type="text" id="begm12" onKeyPress="event.returnValue=isDigit();" maxlength="2" class="inputtime"  />
-
<input name="endh12" type="text" id="endh12" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm12" type="text" id="endm12" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdtime3"><LABEL id="laDialTime3">拔号时间3设置</LABEL></td>
                  <td height="21" align="left"><input name="ckevery3" type="checkbox" id="ckevery3" value="checkbox" onClick="checkClick('cdma_frm','ckevery3')" />
                    <input name="begh13" type="text" maxlength="2" id="begh13" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm13" type="text" maxlength="2" id="begm13" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-
<input name="endh13" type="text" id="endh13" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm13" type="text" id="endm13" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdtime4"><LABEL id="laDialTime4">拔号时间4设置</LABEL></td>
                  <td height="21" align="left"><input name="ckevery4" type="checkbox" id="ckevery4" value="checkbox" onClick="checkClick('cdma_frm','ckevery4')" />
                    <input name="begh14" type="text" maxlength="2" id="begh14" onKeyPress="event.returnValue=isDigit();"  class="inputtime" />
:
<input name="begm14" type="text" maxlength="2" id="begm14" onKeyPress="event.returnValue=isDigit();" class="inputtime"  />
-
<input name="endh14" type="text" id="endh14" maxlength="2" class="inputtime" onKeyPress="event.returnValue=isDigit();"  />
:
<input name="endm14" type="text" id="endm14" maxlength="2"  class="inputtime" onKeyPress="event.returnValue=isDigit();" /></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdtotaltime"><LABEL id="laMonthlyTime">每月限时</LABEL></td>
                  <td height="21" align="left">
                    <input name="totaltime" type="text" class="text" id="totaltime" style="width:56px;">
                    <LABEL id="laMonthlyTimeAlert">(小时,0时没时长限制)</LABEL>
                  </td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdusetime"><LABEL id="laTimeUsed">已用时长</LABEL></td>
                  <td height="21" align="left"><label>
                    <input name="usetime" type="text" class="text distext" id="usetime" disabled="disabled">
                  </label></td>
                  </tr>
                <tr style="display:none;">
                  <td height="21" align="right" id="Tdfreetime"><LABEL id="laTimeLeft">剩余时长</LABEL></td>
                  <td height="21" align="left"><label>
                    <input name="freetime" type="text" class="text distext" id="freetime" disabled="disabled">
                  </label></td>
                  </tr>
                <tr>
                  <td height="21" align="right" id="Tdcleartime"><LABEL id="laErasingDate">已用时间清零日期</LABEL></td>
                  <td height="21" align="left"><label>
                  <select name="cleartime" class="input2" id="cleartime">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                              </select>
                  </label></td>
                  </tr>
				</table>
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
<input name="debuginfo" type="hidden" id="debuginfo" value="1">
</form>
<div id="massage_box" style="display:none; width:320px; ">
  <div class="massage" style="width:318px;"> 
    <div class="header" style="width:318px;" onmousedown=MDown(massage_box)> 
      	<div id="DivPRETitle"><LABEL id="btnATCommandTitle">AT 命令</LABEL></div><span onClick="massage_box.style.visibility='hidden';" style="float:right; width:28px; height:100%; padding:0 0 3 12; display:inline; cursor:hand; font-size:14px; font-weight:600;"> × </span> 
	</div>
		<table width="99%" border="0" cellpadding="2" cellspacing="5">
		  <tr>
			<td width="30%" align="right" id="Tdatcmd"><LABEL id="laATCMD">AT 命令：</LABEL></td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;"><input name="atcmd" type="text" class="text" id="atcmd" value="" style="width:186px;" onFocus="this.select()" onMouseOver="this.focus()" /></td>
		  </tr>
			<td width="30%" align="right" id="Tdatreturn"><LABEL id="laATReturn">返回值：</LABEL></td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;"><input name="atreturn" type="text" class="text" id="atreturn" value="" style="width:186px;"/></td>
		  </tr>
		  <tr>
			<td height="45" colspan="2" align="center" style="padding-left:68px;"><a hidefocus="true" class="btn69 act" href="javascript:;" onClick="funatcommand(0);" id="btnSave"><LABEL id="btnATSubmit">确认</LABEL></a></td>
		  </tr>
	</table>	
  </div> 
</div> 

<div id="pinmassage_box" style="display:none; width:320px; ">
  <div class="massage" style="width:318px;"> 
    <div class="header" style="width:318px;" onmousedown=MDown(pinmassage_box)> 
      	<div id="DivPINTitle" style="display:inline; width:200px; position:absolute"><LABEL id="laPINTitle">PIN设置</LABEL></div>
      	<span onClick="pinmassage_box.style.visibility='hidden';" style="float:right; width:28px; height:100%; padding:0 0 3 12; display:inline; cursor:hand; font-size:14px; font-weight:600;"> × </span>	</div>
		<table width="99%" border="0" cellpadding="2" cellspacing="5">
		  <tr>
			<td width="30%" align="right" id="tdPIN"><LABEL id="laPINEnable">PIN码开关：</LABEL></td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;"><input name="pinenable" type="checkbox" id="pinenable" value="0" onClick="checkClick('cdma_frm','pinenable');" ></td>
		  </tr>
		  <tr>
			<td width="30%" align="right" id="tdPSW"><LABEL id="laPINPassword">密码：</LABEL></td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;"><input name="pinpsw" type="password" class="text" id="pinpsw" value="" style="width:186px;" onFocus="this.select()" onMouseOver="this.focus()" /></td>
		  </tr>
		  <tr>
			<td width="30%" align="right" id="tdAlert"><LABEL id="laPINNotice">提示：</LABEL></td>
			<td width="70%" valign="bottom" style=" padding:0 0 0 12;"><input name="pinalert" type="text" class="text" id="pinalert" value="" style="width:186px;" readonly="ture" /></td>
		  </tr>
		  <tr>
			<td height="45" colspan="2" align="center" style="padding-left:68px;"><a hidefocus="true" class="btn69 act" href="javascript:;" onClick="funatcommand(1);" id="btnSave"><LABEL id="btnPINSubmit">确认</LABEL></a></td>
		  </tr>
	</table>	
  </div> 
</div> 
<script language="javascript">
var i;
$s("cleartime").length = 0;
for(i=1;i<=31;i++){
	$s("cleartime").options[$s("cleartime").length] = new Option(i,i);
}
</script>
<%out3GCfgEx();%>
</body>
</html>
