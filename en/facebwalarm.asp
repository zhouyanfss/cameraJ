<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBasic</title>
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
<script language="javascript" type="text/javascript" src="./jsmain/camera.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>

<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/lensex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
<script type="text/JavaScript" language="javascript" src="./js/hsvbtn.js"></script>

</head>
<script language="javascript">

function Checkfrm(){
	var t = document.getElementById("bwSimilarity");
	  var a=t.value;

	if(a>100||a<0){
		alert(AbwSimilarity)
	}else{
	setTimeout(do_submit,0);
	return false;
	}
}
function snapmodekz(){
	if($("RecognitionMode").value == 0){
		$("laNumber_yc").style.display='';
	}else{
		$("laNumber_yc").style.display='none';
	}

}

function Checkfrm1(){
$("isDefault").value = 1;
	setTimeout(do_submit,0);
	return false;
}
function init(){
snapmodekz();
	ChangeLanguage('../xml/facebwalarm.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
	$("laOLdds").addEvent("click", Checkfrm1);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/facebwalarmCfg"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li>
		</ul>
	</div>
	<div class="maintab"style="height: 380px;">
        <div id="div_set" class="div_set">

        <ul id="show_Main">
        				<li class="vrig" id="laMain">
        		<table width="600" border="1" cellpadding="6" cellspacing="1" bgcolor="#999999" style="margin:0px;">
        		<tr>
				  <td height="21" colspan="5" valign="bottom" bgcolor="#FFFFFF"><LABEL id="laLinkageAlarm"></LABEL></td>
				</tr>
        		<tr>
					<td height="10" colspan="5" valign="bottom" bgcolor="#FFFFFF">
					<div style="width: 102px;text-indent: 40px;float: left;border-right: 1px solid #F0F0F0;"><LABEL id="laAlarmswitch"></LABEL></div>
					<div style="width: 97px;height: 25px;float: left;border-right: 1px solid #F0F0F0;border-left: 1px solid #A0A0A0">

						<input name="alarmEnable" type="checkbox" id="alarmEnable"  value="0"   onClick="checkClick('motion_frm','alarmEnable')"/>
					</div>
					<div style="width: 98px;text-indent: 20px;float: left;border-right: 1px solid #F0F0F0;border-left: 1px solid #A0A0A0"><LABEL id="laBlacklistalarm"></LABEL></div>
					<div style="width: 98px;height: 25px;float: left;border-right: 1px solid #F0F0F0;border-left: 1px solid #A0A0A0">
						<input name="blackEnable" type="checkbox" id="blackEnable" value="0" onClick="checkClick('motion_frm','blackEnable')"/>
					</div>

					<div style="width: 98px;text-indent: 20px;float: left;border-right: 1px solid #F0F0F0;border-left: 1px solid #A0A0A0"><LABEL id="laWhitelistalarm"></LABEL></div>
					<div style="width: 98px;height: 25px;float: left;border-left: 1px solid #A0A0A0;">
						<input name="whiteEnable" type="checkbox" id="whiteEnable" value="0" onClick="checkClick('motion_frm','whiteEnable')"/>
					</div>
					</td>
				</tr>

        		<tr id="stralarmioout">
        		  <td width="17%" height="21" align="right" bgcolor="#FFFFFF"><div id="divoutput" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL style="text-align: left" id="laIOOutput">IO</LABEL></div></td>
        		  <td width="8%" height="21" align="left" bgcolor="#FFFFFF"><div id="strdivout1" style="padding:0px; margin:0px; width:36px; float:left;"><input name="ckalarmout" type="checkbox" id="ckalarmout" value="checkbox" onClick="checkClick('motion_frm','ckalarmout')"/></div></td>
        		  <td height="21" colspan="1" align="center" bgcolor="#FFFFFF">

        		  <div id="Divtime" class="optimet" style="width:120px;"><LABEL id="laOutputDuration"></LABEL></div>

        		  <div id="Divvalue" class="optimev">
        		  	<input name="alarmclear" type="text" class="textmin" id="alarmclear" onKeyPress="event.returnValue=isDigit();" size="4" maxlength="16"  />
        		  </div>

        		  <div id="Divunit" class="optimeu"><LABEL id="laDurationUnit"></LABEL></div></td>
        		       <td width="13%" align="right" bgcolor="#FFFFFF" ><LABEL id="btnSensorType02"></LABEL></td>
        				<td width="25%" colspan="1" bgcolor="#FFFFFF" >
        					<select name="type_motionIO" class="select3" id="type_motionIO" style="width:80px; min-width:80px;">
        					<option id="opSensorType1" value="0"></option>
        					<option id="opSensorType2" value="1"></option>
        					</select>
        					<span style="color:#FF0000;">*</span>
        				</td>
        		  </tr>

				<tr id="stralarmcapdev">
					<td width="17%" height="21" align="right" bgcolor="#FFFFFF">
						<div id="divcapdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL  style="text-align: left" id="laRecognitionMode"></LABEL></div>
					</td>
					<td colspan="4" bgcolor="#FFFFFF" >
							<select id="RecognitionMode" name="RecognitionMode" onclick="snapmodekz();" style="width: 80px;margin-left: 5px" >
								<option id="recognition1" value="0"></option>
								<option id="recognition" value="1"></option>
							</select>
						<div id="laNumber_yc" style="display: none"><input id="laNumber" name="laNumber" style="width: 40px;margin-left: 5px;"/>(1~10)</div>
					</td>
				</tr>


        		<tr id="stralarmcapdev">
					<td width="17%" height="21" align="right" bgcolor="#FFFFFF">
						<div id="divcapdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL  style="text-align: left" id="Comparisonsimilarity"></LABEL></div>
					</td>
					<td colspan="4" bgcolor="#FFFFFF" >
						<input style="width: 50px;margin-left: 5px" name="bwSimilarity" type="number" id="bwSimilarity"  onKeyPress="event.returnValue=isDigit();"/>
						<span id="percents">(0-100)</span>
					</td>
        		</tr>


        		<tr id="stralarmrecdev">
					<td height="21" align="right" bgcolor="#FFFFFF">
						<div id="divrecdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"  style="text-align: right" ><LABEL style="text-align: right" id="laTime1"></LABEL></div>
					</td>
        			<td align="center" colspan="4" bgcolor="#FFFFFF">
						<div align="left">
							<input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('record_frm','ckevery')" />
							<input name="begh1" type="text" class="textmin" id="begh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							:
							<input name="begm1" type="text" class="textmin" id="begm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							--
							<input name="endh1" type="text" class="textmin" id="endh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							:
							<input name="endm1" type="text" class="textmin" id="endm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
						</div>
        			</td>
        		</tr>

				<tr id="stralarmrecdev">
					<td height="21" align="right" bgcolor="#FFFFFF">
						<div id="divrecdev" style="padding:0px; margin:0px; width:86px; float:left; text-align:right;"><LABEL  style="text-align: left" id="laTime2"></LABEL></div>
					</td>
					<td align="center" colspan="4" bgcolor="#FFFFFF">
						<div align="left">
							<input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('record_frm','ckevery2')" />
							<input name="begh12" type="text" class="textmin" id="begh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							:
							<input name="begm12" type="text" class="textmin" id="begm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							--
							<input name="endh12" type="text" class="textmin" id="endh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
							:
							<input name="endm12" type="text" class="textmin" id="endm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
						</div>
					</td>
				</tr>
        		</table>
        		</li>
        		</ul>
        		</div>
</div>
<input type="hidden" value="0" 	id="isDefault"  	name="isDefault" >
    <div style="margin-top: -150px;margin-bottom: 20px; " class="foottab">
		<div class="set_btn set_btn_pl166">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true"  href="javascript:;" id="laOLdds"><LABEL id="laOLd09"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display: none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>

</form>
<%outfacebwalarmCfg();%>
</body>
</html>
