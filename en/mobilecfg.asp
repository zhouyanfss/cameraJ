<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>手机监看设置 </title>
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
	var port    	= parseInt($s("port").value);
	var idnum    	= parseInt($s("idnum").value);
	if(port > 65535){
		remarkDisplay("divAlertHTML", "* " + ALERTERRORLIMITS + " 0~65535", 3E3, 1);
		$s("port").focus();
		$s("port").select();
		return false;
	}
	if(idnum > 2147483647){
		remarkDisplay("divAlertHTML", "* " + ALERTERRORLIMITS + " 0~2147483647", 3E3, 1);
		$s("idnum").focus();
		$s("idnum").select();
		return false;
	}
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function chgcountfun(countnum,strdiv,flags){
	var Strdivs;
	for(i=1;i<=countnum;i++){
		Strdivs = strdiv + i;
		document.getElementById(Strdivs).style.display="";
	}
}

function chgmode(){
	var tmpmode	= $s("mode").value;
	if(tmpmode=="1"){
		$s("trurl").style.display = "";
		$s("tridnum").style.display = "";
		$s("trinterval").style.display = "none";
		$s("trchan").style.display = "";
	}else{
		$s("trurl").style.display = "none";
		$s("tridnum").style.display = "none";
		$s("trinterval").style.display = "none";
		$s("trchan").style.display = "none";
	}
}

function init(){
	ChangeLanguage('../xml/mobilecfg.xml', m_szLanguage);
	var ChannelCount = getCookies("intChannel");
	chgcountfun(ChannelCount,"divchan",1);
	chgmode();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/mobileCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">手机监看设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="520" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="34%" height="21" align="right" id="Tdmode"><LABEL id="laMode">模式</LABEL></td>
                  <td width="66%" height="21" align="left">
                    <select name="mode" class="input2" id="mode" onChange="chgmode()">
                      <option id="opMode1" value="0">P2P模式</option>
                      <option id="opMode2" value="1">CS模式</option>
                    </select>
                  </td>
                </tr>
                <tr id="trurl">
                  <td height="21" align="right" id="Tdurl"><LABEL id="laServerURL">服务器地址</LABEL></td>
                  <td height="21" align="left"><input name="url" type="text" class="text" id="url" maxlength="128"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdport"><LABEL id="laServerPort">端口</LABEL></td>
                  <td height="21" align="left"><input name="port" type="text" class="text" id="port" onKeyPress="event.returnValue=isDigit();" maxlength="5"  /></td>
                </tr>
                <tr id="tridnum">
                  <td height="21" align="right" id="Tdidnum"><LABEL id="laServerPort">设备接入ID</LABEL></td>
                  <td height="21" align="left"><input name="idnum" type="text" class="text" id="idnum" onKeyPress="event.returnValue=isDigit();" maxlength="10"  /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdquality"><LABEL id="laRealTime">实时性</LABEL></td>
                  <td height="21" align="left"><label>
                    <select name="quality" class="input2" id="quality">
                      <option id="opRealTime1" value="0">好</option>
                      <option id="opRealTime2" value="1">中</option>
                      <option id="opRealTime3" value="2">差</option>
                    </select>
                  </label></td>
                </tr>
                 <tr id="trinterval" style="display:none">
				 <td height="21" align="right" id="Tdinterval"><LABEL id="laInterval">重连间隔</LABEL></td>
                  <td height="21" align="left"><input name="interval" type="text" class="text" id="interval" onKeyPress="event.returnValue=isDigit();" maxlength="32"  />
                  (s)</td>
                </tr>
                 <tr id="trchan">
                  <td height="21" align="right" id="Tdchan"><LABEL id="laChannel">连接通道</LABEL></td>
                  <td height="21" align="left">
<div id="divchan1" style="padding:0px; margin:0px; width:36px; float:left;"><input name="chan1" type="checkbox" id="chan1" value="checkbox" onClick="checkClick('mobile_frm','chan1')"/>1</div>
<div id="divchan2" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan2" type="checkbox" id="chan2" value="checkbox" onClick="checkClick('mobile_frm','chan2')"/>2</div>
<div id="divchan3" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan3" type="checkbox" id="chan3" value="checkbox" onClick="checkClick('mobile_frm','chan3')"/>3</div>
<div id="divchan4" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan4" type="checkbox" id="chan4" value="checkbox" onClick="checkClick('mobile_frm','chan4')"/>4</div>
<div id="divchan5" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan5" type="checkbox" id="chan5" value="checkbox" onClick="checkClick('mobile_frm','chan5')"/>5</div>
<div id="divchan6" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan6" type="checkbox" id="chan6" value="checkbox" onClick="checkClick('mobile_frm','chan6')"/>6</div>
<div id="divchan7" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan7" type="checkbox" id="chan7" value="checkbox" onClick="checkClick('mobile_frm','chan7')"/>7</div>
<div id="divchan8" style="padding:0px; margin:0px; width:36px; float:left; display:none;"><input name="chan8" type="checkbox" id="chan8" value="checkbox" onClick="checkClick('mobile_frm','chan8')"/>8</div>
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
<%outMobileCfgEx();%>
</body>
</html>
