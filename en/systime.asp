<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统时间</title>
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
	$("systemdate").value	= $("sdt0").value+"-"+$("sdt1").value+"-"+$("sdt2").value;
	$("systemtime").value	= $("stm0").value+":"+$("stm1").value+":"+$("stm2").value;
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

var timemode;
function chgmode(){
	var i;
	for(i=0; i<3; i++){
		if(document.outcfg_frm.updatemode[i].checked == true){timemode = i;}
	}
	switch(timemode){
	case 0:	
		$("DivHostTitle").style.display	= "";
		$("DivHost").style.display		= "";
		$("DivPortTitle").style.display	= "";
		$("DivPort").style.display		= "";
		$("Trtimezone").style.display	= "";
	break;
	case 1:	
		$("DivHostTitle").style.display	= "none";
		$("DivHost").style.display		= "none";
		$("DivPortTitle").style.display	= "none";
		$("DivPort").style.display		= "none";
		$("Trtimezone").style.display	= "none";
		timeC=!1;timeSC=1;
		putsystime();
	break;
	case 2:	
		$("DivHostTitle").style.display	= "none";
		$("DivHost").style.display		= "none";
		$("DivPortTitle").style.display	= "none";
		$("DivPort").style.display		= "none";
		$("Trtimezone").style.display	= "none";
		timeC=!1;timeSC=!1;stimer&&clearTimeout(stimer);
	break;
	case 3:	
		$("DivHostTitle").style.display	= "none";
		$("DivHost").style.display		= "none";
		$("DivPortTitle").style.display	= "none";
		$("DivPort").style.display		= "none";
		$("Trtimezone").style.display	= "none";
	break;
	default:
		$("DivHostTitle").style.display	= "none";
		$("DivHost").style.display		= "none";
		$("DivPortTitle").style.display	= "none";
		$("DivPort").style.display		= "none";
		$("Trtimezone").style.display	= "none";
	break;
	}
}
var timer, stimer, timeT, timeC=1, timeSC=1;
function pasteSetTime(){timer&&clearTimeout(timer);stimer&&clearTimeout(stimer);timeC=!1;timeSC=!1;}
function init(){
	ChangeLanguage('../xml/systime.xml', m_szLanguage);
	chgmode();
	timeT = $("systemtime").value;
	var a=$("systemdate").value.split("-");$("sdt0").value=a[0];$("sdt1").value=a[1];$("sdt2").value=a[2];
	var b=timeT.split(":");$("stm0").value=b[0];$("stm1").value=b[1];$("stm2").value=b[2];
	attachDateInput("sdt","stm");
	puttime();
	//putsystime();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init()">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/sysTimeCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">系统时间</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
<input id="GCFLAG" type="hidden" />
<input name="systemdate" id="systemdate" type="hidden" value="2013-06-04">
<input name="systemtime" id="systemtime" type="hidden" value="21:36:40">
				<table width="520" cellpadding="5" cellspacing="1">
                    <tr>
                    <td width="80" height="30" align="right" id="Tddata"><LABEL id="laDate">系统时间</LABEL></td>
                    <td>
			<span class="timeBox"> 
			<input type="text" id="sdt0" maxlength=4 name="textfield" class="intyear"/>- 
			<input type="text" id="sdt1" maxlength=2 name="textfield" class="intime"/>- 
			<input type="text" id="sdt2" maxlength=2 name="textfield" class="intime"/>
			</span>
			<span class="timeBox" style="margin-left:8px;">
				<input type="text" id="stm0" maxlength=2 name="textfield" class="intime" onMouseDown="pasteSetTime()" onKeyDown="pasteSetTime()"/>:
				<input type="text" id="stm1" maxlength=2 name="textfield" class="intime" onMouseDown="pasteSetTime()" onKeyDown="pasteSetTime()"/>:
				<input type="text" id="stm2" maxlength=2 name="textfield" class="intime" onMouseDown="pasteSetTime()" onKeyDown="pasteSetTime()"/>
			</span> 
                    </td>
                    </tr>
                </table>
				<table width="520" cellpadding="5" cellspacing="1" style="margin-top:12px; margin-left:32px;">
			  <tr  id="Trtimezone">
				<td width="76" height="30" align="right" id="Tdtimezone"><LABEL id="laTimeZone">时区</LABEL></td>
				<td colspan="2" id="Tddata">
				  <select name="dwTimeZone" size="1" id="dwTimeZone" style="font-size:12; width:450px;">
				  <option id="opTimeZone0"  value="0">(GMT-12:00) Eniwetok, Kwajalein</option>
				  <option id="opTimeZone1"  value="1">(GMT-11:00) Mideast America, Samoa</option>
				  <option id="opTimeZone2"  value="2">(GMT-10:00) Hawaii</option>
				  <option id="opTimeZone3"  value="3">(GMT-09:00) Alaska</option>
				  <option id="opTimeZone4"  value="4">(GMT-08:00) PST (America &amp;Canada)</option>
				  <option id="opTimeZone5"  value="5">(GMT-07:00) Arizona, MST (America &amp; Canada)</option>
				  <option id="opTimeZone6"  value="6">(GMT-06:00) CST (America &amp;Canada), Mexico,Tegucigalpa(Capital of Honduras)</option>
				  <option id="opTimeZone7"  value="7">(GMT-05:00) Bogota,Lima(Capital of Peru),Quito(Capital of Ecuador)</option>
				  <option id="opTimeZone8"  value="8">(GMT-05:00) EST(America &amp;Canada), Indiana (East)</option>
				  <option id="opTimeZone9" value="9">(GMT-04:00) AST(America &amp;Canada), Caracas(Capital of Venezuela), La Paz</option>
				  <option id="opTimeZone10" value="10">(GMT-03:30) Newfoundland</option>
				  <option id="opTimeZone11" value="11">(GMT-03:00) Buenos Aires(Capital of Argentina),Georgetown, Brasilia</option>
				  <option id="opTimeZone12" value="12">(GMT-02:00) Mid-Argentina</option>
				  <option id="opTimeZone13" value="13">(GMT-01:00) Azores Islands, cape verde islands</option>
				  <option id="opTimeZone14" value="14">(GMT) Casablanca,Monrovia,Dublin,Edinburgh,Lisbon (Capitalk of Portugal),London</option>
				  <option id="opTimeZone15" value="15">(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna</option>
				  <option id="opTimeZone16" value="16">(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague</option>
				  <option id="opTimeZone17" value="17">(GMT+01:00) Brussels, Copenhagen, Madrid, Paris, Vilnius</option>
				  <option id="opTimeZone18" value="18">(GMT+01:00) Sarajevo, Skopje, Sofia, Warsaw, Zagreb</option>
				  <option id="opTimeZone19" value="19">(GMT+02:00) Athens, Bucharest, Cairo, Istanbul, Minsk</option>
				  <option id="opTimeZone20" value="20">(GMT+02:00) Harare, Helsinki, Jerusalem, Pretoria, Riga, Tallinn</option>
				  <option id="opTimeZone21" value="21">(GMT+03:00) Moscow, St.Petersburg, Volga,Bagdad,Koweit, Riyadh</option>
				  <option id="opTimeZone22" value="22">(GMT+03:30) Teheran</option>
				  <option id="opTimeZone23" value="23">(GMT+04:00) Abu Dhabi, Baku, Muscat, Tbilisi</option>
				  <option id="opTimeZone24" value="24">(GMT+04:30) Kabul</option>
				  <option id="opTimeZone25" value="25">(GMT+05:00) St. Katharinen Town, Islamabad, Karachi, Tashkent</option>
				  <option id="opTimeZone26" value="26">(GMT+05:30) New Delhi</option>
				  <option id="opTimeZone27" value="27">(GMT+06:00) Astarte, Diamantina, Columbus, Dhaka</option>
				  <option id="opTimeZone28" value="28">(GMT+07:00) Bangkok, Hanoi, Jakarta</option>
				  <option id="opTimeZone29" value="29">(GMT+08:00) Beijing, Hongkong, Singapore, Taipei</option>
				  <option id="opTimeZone30" value="30">(GMT+09:00) Seoul, Tokyo, Yakutsk</option>
				  <option id="opTimeZone31" value="31">(GMT+09:30) Adelaide, Darwin</option>
				  <option id="opTimeZone32" value="32">(GMT+10:00) Canberra, Guam, Port Moresby, Vladivostok</option>
				  <option id="opTimeZone33" value="33">(GMT+11:00) Magellan, Solomon Islands</option>
				  <option id="opTimeZone34" value="34">(GMT+12:00) Fiji, Kamchatka Peninsula, Marshall Islands, Wellington</option>
				</select></td>
			  </tr>
			  <tr>
				<td height="30" align="right" id="Tdtimezone"><input name="updatemode" type="radio" onClick="chgmode()" value="0"></td>
				<td width="136" id="Tdntpt"><LABEL id="laUpdateNtp">通过时间服务器更新</LABEL></td>
				<td width="314" id="Tdntpt">
				<div id="DivHostTitle" style="display:none; float:left; width:52px; overflow:hidden; text-align:right;"><LABEL id="laNtpHost">服务器:</LABEL></div>
				<div id="DivHost" style="display:none; float:left; width:150px; overflow:hidden;"><input name="ntpHost" type="text" class="text" id="ntpHost" maxlength="128" /></div>
				<div id="DivPortTitle" style="display:none; float:left; width:50px; overflow:hidden; text-align:right;"><LABEL id="laNtpPort">端口:</LABEL></div>
				<div id="DivPort" style="display:none; float:left; width:40px; overflow:hidden;"><input name="ntpPort" type="text" class="text" id="ntpPort" maxlength="8" style="width:36px;" />
				</div>
			    </td>
			  </tr>
			  <tr>
				<td height="30" align="right" id="Tdsyncpct"><input name="updatemode" type="radio" onClick="chgmode()" value="1"></td>
				<td colspan="2" id="Tdsyncpc"><LABEL id="laUpdatePC">与本地电脑同步</LABEL></td>
			  </tr>
			  <tr>
				<td height="30" align="right" id="Tdmanualt"><input name="updatemode" type="radio" onClick="chgmode()" value="2"></td>
				<td colspan="2" id="Tdmanual"><LABEL id="laUpdateManual">手动设置</LABEL></td>
			  </tr>
			  <tr style="display:none;">
				<td height="30" align="right" id="Tdsavetimet"><input name="updatemode" type="radio" onClick="chgmode()" value="3" checked></td>
				<td colspan="2" id="Tdsavetime"><LABEL id="laUpdateMode">保存当前时间日期</LABEL></td>
			  </tr>
			</table>
				</li>
			</ul>
			
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn" style="padding-left:50px;">
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
<%outSysTimeCfgEx();%>

</body>
</html>
