<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>video</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./script/ajax.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/send.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
</head>
<script language="javascript">
var CUSTOMJoyce	= false;	//Joyce客户需求，CBR时，图像质量默认为2，不可设;
var maxfrmintr = 120;
var maxfrmrate = 30;
function Checkfrm(){
	var frmintr,frmrate,bitrate,strtitle;
	var fr = parseInt($("maxfrmintr").value);
	var fm = parseInt($("maxfrmrate").value);
	if(!isNaN(fr)&&fr>0){maxfrmintr = fr;}
	if(!isNaN(fm)&&fm>0){maxfrmrate = fm;}
	if($("advanced").checked==true){
		frmintr = $("frmintr").value; frmrate = $("frmrate").value; bitrate = $("bitrate").value;
		if(isBlank(frmintr) || !isNum(frmintr) || frmintr > maxfrmintr || frmintr < 1){
		  remarkDisplay("divAlertHTML", "* " + ALERTIFRAMEERROR + ":1~" + maxfrmintr + "("+HTMLMAINSTREAM+").", 3E3, 1); return false;
		}
		if(isBlank(frmrate) || frmrate > maxfrmrate || frmrate < 1){
		  remarkDisplay("divAlertHTML", "* " + ALERTFRAMERATEERROR + ":1~" + maxfrmrate + "("+HTMLMAINSTREAM+").", 3E3, 1); return false;
		}
		if(isBlank(bitrate) || !isNum(bitrate) || bitrate > 16384 || bitrate < 30){
		  remarkDisplay("divAlertHTML", "* " + ALERTBITRATEERROR + ":30~16384("+HTMLMAINSTREAM+").", 3E3, 1); return false;
		}
	}	
	if($("advanced2").checked==true){
		frmintr = $("frmintr2").value; frmrate = $("frmrate2").value; bitrate = $("bitrate2").value;
		
		if(isBlank(frmintr) || !isNum(frmintr) || frmintr > maxfrmintr || frmintr < 1){
		  remarkDisplay("divAlertHTML", "* " + ALERTIFRAMEERROR + ":1~" + maxfrmintr + "("+HTMLSUBSTREAM+").", 3E3, 1); return false;
		}
		
		if(isBlank(frmrate) || frmrate > maxfrmrate || frmrate < 1){
		  remarkDisplay("divAlertHTML", "* " + ALERTFRAMERATEERROR + ":1~" + maxfrmrate + "("+HTMLSUBSTREAM+").", 3E3, 1); return false;
		}
		
		if(isBlank(bitrate) || !isNum(bitrate) || bitrate > 16384 || bitrate < 30){
		  remarkDisplay("divAlertHTML", "* " + ALERTBITRATEERROR + ":30~16384("+aHTMLSUBSTREAM+").", 3E3, 1); return false;
		}
	}
	if(CUSTOMJoyce){
	  if(parseInt($("ratectrl").value)==1){$("quality").value = 1;}else{$("quality").value = $("iq").value;}
	  if(parseInt($("ratectrl2").value)==1){$("quality2").value = 1;}else{$("quality2").value = $("iq2").value;}
	}else{
	  if(parseInt($("ratectrl").value)==1){$("quality").value = $("rc").value;}else{$("quality").value = $("iq").value;}
	  if(parseInt($("ratectrl2").value)==1){$("quality2").value = $("rc2").value;}else{$("quality2").value = $("iq2").value;}
	}
	if(bReboot==1&&window.confirm(ALERTREBOOTCFM)==false) {return false;}
	setTimeout(do_submit,0);
}
function altReboot(){bReboot=1;}
function setadvanced(paramstr){
	var tmpstr = "advanced" + paramstr;
	var tmpencoder = "encoder" + paramstr;
	var selindex	= $s(tmpencoder).selectedIndex;
	var strtmpencoder = $s(tmpencoder).options[selindex].outerText;
	var strencoder	= strtmpencoder.toLowerCase();
	
	if($s(tmpstr).checked==true){
		setDisabled("vquality"+paramstr, 1);
		setDisabled("frmintr"+paramstr, 0);setDisabled("frmrate"+paramstr, 0);
		setDisabled("ratectrl"+paramstr, 0);setDisabled("bitrate"+paramstr, 0);
		setDisabled("quality"+paramstr, 0);setDisabled("first"+paramstr, 0);
		setDisabled("iq"+paramstr, 0);setDisabled("rc"+paramstr, 0);
		setDisabled("btnLANSubmit"+paramstr, 0);setDisabled("btnWANSubmit"+paramstr, 0);
	}else{
		setDisabled("vquality"+paramstr, 0);
		setDisabled("frmintr"+paramstr, 1);setDisabled("frmrate"+paramstr, 1);
		setDisabled("ratectrl"+paramstr, 1);setDisabled("bitrate"+paramstr, 1);
		setDisabled("quality"+paramstr, 1);setDisabled("first"+paramstr, 1);
		setDisabled("iq"+paramstr, 1);setDisabled("rc"+paramstr, 1);
		setDisabled("btnLANSubmit"+paramstr, 1);setDisabled("btnWANSubmit"+paramstr, 1);
	}
	if(strencoder!="mjpeg"&&strencoder!="jpeg"&&strencoder!="mjpg"&&strencoder!="jpg"&&$s(tmpstr).checked==true){
		setDisabled("frmintr"+paramstr, 0); setDisabled("ratectrl"+paramstr, 0);
		setDisabled("iq"+paramstr, 0); setDisabled("rc"+paramstr, 0);
	}else{setDisabled("frmintr"+paramstr, 1);setDisabled("ratectrl"+paramstr, 1);
		setDisabled("iq"+paramstr, 1); setDisabled("rc"+paramstr, 1);}
}
function LANDefault(paramstr){	//局域网默认设置
	var tmpcif		= "sys_cif"+paramstr;
	var strcif		= trimEx($s(tmpcif).options[$s(tmpcif).selectedIndex].outerText).toLowerCase();
	var cifvalue	= parseInt(strcif.split('*')[1]);	//视频分辨率：高
	var encodervalue= 0;	//HH.264
	var tmpencoder = "encoder" + paramstr;
	var strencoder = trimEx($s(tmpencoder).options[$s(tmpencoder).selectedIndex].outerText).toLowerCase();
	if(strencoder=="mjpeg"||strencoder=="jpeg"||strencoder=="mjpg"||strencoder=="jpg"){encodervalue	= 1;}
	var tmpfrmintr	= 50;
	var tmpfrmrate	= 25;
	var tmpratectrl	= 0;
	var tmpbitrate	= 512;
	var tmpquality	= 3;	
	
	if(paramstr=="2"){	//次码流
		if(encodervalue == 1){tmpbitrate = 2048;}
	}else{				//主码流
		if(!isNaN(cifvalue)){
			if(cifvalue < 720){	//标清
				tmpfrmintr = 50; tmpfrmrate = 25; tmpratectrl = 0;
				if(encodervalue == 1){tmpbitrate = 4096;}else{tmpbitrate = 2048;}
				tmpquality	= 1;
			}else if(cifvalue>=720 && cifvalue < 1080){	//720P
				tmpfrmintr = 75; tmpfrmrate = 25; tmpratectrl = 0;
				if(encodervalue == 1){tmpbitrate = 9216;}else{tmpbitrate = 2048;}
				tmpquality	= 1;
			}else if(cifvalue >=1080){	//1080P
				tmpfrmintr = 75; tmpfrmrate = 25; tmpratectrl = 0;
				if(encodervalue == 1){tmpbitrate = 10240;}else{tmpbitrate = 4096;}
				tmpquality	= 1;
			}
		}
	}	
	if(encodervalue == 0){$("frmintr"+paramstr).value	= tmpfrmintr; $("ratectrl"+paramstr).value= tmpratectrl;}
	$("frmrate"+paramstr).value	= tmpfrmrate; $("bitrate"+paramstr).value = tmpbitrate;
	$("quality"+paramstr).value	= tmpquality;
	$("iq"+paramstr).value = tmpquality; $("rc"+paramstr).value = 0;
	chgratectrl();
}

function WANDefault(paramstr){		//广域网默认设置
	var encodervalue= 0;	//HH.264
	var tmpencoder = "encoder" + paramstr;
	var strencoder = trimEx($s(tmpencoder).options[$s(tmpencoder).selectedIndex].outerText).toLowerCase();
	if(strencoder=="mjpeg"||strencoder=="jpeg"||strencoder=="mjpg"||strencoder=="jpg"){encodervalue	= 1;}
	if(encodervalue==0){
		$("frmintr"+paramstr).value	= 25;
		$("ratectrl"+paramstr).value = 0;
		$("bitrate"+paramstr).value = 384;
	}else{$("bitrate"+paramstr).value = 4096;}
	$("frmrate"+paramstr).value	= 5;
	$("quality"+paramstr).value	= 3;
	$("iq"+paramstr).value		= 3;
	$("rc"+paramstr).value		= 0;
	chgratectrl();
}
function chgratectrl(){
	if(CUSTOMJoyce){
	  if(parseInt($("ratectrl").value)==1){setDisplay("Trquality0", 0);
	  }else{setDisplay("Trquality0", 1);}	
	  if(parseInt($("ratectrl2").value)==1){setDisplay("Trquality20", 0);
	  }else{setDisplay("Trquality20", 1);}	
	}else{
	  if(parseInt($("ratectrl").value)==1){setDisplay("Trquality0", 0);
	  	if(parseInt($("nfluctuate").value)==1){setDisplay("Trquality1", 1);}else{$("rc").value=0;}
	  }else{setDisplay("Trquality0", 1);setDisplay("Trquality1", 0);}	
	  if(parseInt($("ratectrl2").value)==1){setDisplay("Trquality20", 0);
	  	if(parseInt($("nfluctuate").value)==1){setDisplay("Trquality21", 1);}else{$("rc2").value=0;}
	  }else{setDisplay("Trquality20", 1);setDisplay("Trquality21", 0);}	
	}
}
function encoderLevel(){
	if(parseInt($("encoder").value)==0){setDisabled("vlevel", 0);
	}else{setDisabled("vlevel", 1);	}
	if(parseInt($("encoder2").value)==0){setDisabled("vlevel2", 0);
	}else{setDisabled("vlevel2", 1);	}
}
function init(){
	ChangeLanguage('../xml/videocoding.xml', m_szLanguage);
	$("btnLANSubmit").title = getNodeValue('btnLANSubmitDefault');
	$("btnWANSubmit").title = getNodeValue('btnWANSubmitDefault');
	$("btnLANSubmit2").title = getNodeValue('btnLANSubmitDefault');
	$("btnWANSubmit2").title = getNodeValue('btnWANSubmitDefault');
	initChannel();
	setadvanced("");
	setadvanced("2");
	chgratectrl();
	if(parseInt($("nlevel").value)==1){setDisplay("TrLevel", 1);setDisplay("TrLevel2", 1);
	}else{setDisplay("TrLevel", 0);setDisplay("TrLevel2", 0);}
	encoderLevel();
	$("rc").value = $("quality").value; $("iq").value = $("quality").value;
	$("rc2").value = $("quality2").value; $("iq2").value = $("quality2").value;
	var fr = parseInt($("maxfrmintr").value);
	var fm = parseInt($("maxfrmrate").value);
	if(!isNaN(fr)&&fr>0){maxfrmintr = fr;}
	if(!isNaN(fm)&&fm>0){maxfrmrate = fm;}
	attachLimit("bitrate",30,16384); attachLimit("bitrate2",30,16384); attachLimit("frmintr",1,maxfrmintr); attachLimit("frmintr2",1,maxfrmintr); attachLimit("frmrate",1,maxfrmrate); attachLimit("frmrate2",1,maxfrmrate);
	$("aRate").innerHTML = "(1~" + maxfrmrate + ")";$("aGop").innerHTML = "(1~" + maxfrmintr + ")";
	$("aRate2").innerHTML = "(1~" + maxfrmrate + ")";$("aGop2").innerHTML = "(1~" + maxfrmintr + ")";
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/videoEncodingCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">视频编码</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Chan">
				<li id="laChan">
			  <table id="TableChan" border="0" width="520" cellspacing="0" cellpadding="0" style="margin-bottom:12px; display:none;">
               <tr>
                <td height="32" valign="middle">
				<div id="divChannelTitle"><LABEL id="laChannel">通道:</LABEL></div>
				<div id="divChannelOption"><img src="./images/botton/1.jpg" alt="1" name="channel1" width="26" height="21" id="channel1" style="cursor:pointer;" onClick="ChangeChannel(1,'');">
				<img src="./images/botton/2.jpg" alt="2" id="channel2" name="channel2" onClick="ChangeChannel(2,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/3.jpg" alt="3" id="channel3" name="channel3" onClick="ChangeChannel(3,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/4.jpg" alt="4" id="channel4" name="channel4" onClick="ChangeChannel(4,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/5.jpg" alt="5" id="channel5" name="channel5" onClick="ChangeChannel(5,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/6.jpg" alt="6" id="channel6" name="channel6" onClick="ChangeChannel(6,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/7.jpg" alt="7" id="channel7" name="channel7" onClick="ChangeChannel(7,'');" style="cursor:pointer; display:none;">
				<img src="./images/botton/8.jpg" alt="8" id="channel8" name="channel8" onClick="ChangeChannel(8,'');" style="cursor:pointer; display:none;">
				</div>
				<div id="divChannelSync"><input name="copysync" type="checkbox" id="copysync" value="0" onClick="checkClick('audio_frm','copysync')"></div>
				<div id="divChannelSyncTitle"><LABEL id="laChannelSync">复制到所有通道</LABEL></div>
				</td>
                </tr>
           </table>
				</li>
			</ul>

			<ul id="show_Main">
				<li class="vrig" id="laMain" style="width:700px;">
				<div style="width:340px; float:left;">
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
					<tr>
					  <td width="140">&nbsp;</td>
					  <td colspan="2"><LABEL id="laMainStream">主</LABEL></td>
					</tr>
					<tr id="TrLevel" style=" display:none;">
					  <td align="right" id="Tdencoder"><LABEL id="laLevel">等级</LABEL></td>
					  <td colspan="2" align="left"><label>
						<select name="vlevel" class="text" id="vlevel" onChange="altReboot()">
						  <option value="0" id="opLevel1">Baseline </option>
						  <option value="1" id="opLevel2">Main Profile</option>
						  <option value="3" id="opLevel3">High Profile </option>
						</select>
					  </label></td>
					</tr>
					<tr>
					  <td align="right" id="Tdencoder"><LABEL id="laEncoder">算法</LABEL></td>
					  <td colspan="2" align="left"><label>
						<select name="encoder" class="text" id="encoder" onChange="setadvanced('');encoderLevel();">
						  <option value="0">H.264</option>
						  <option value="1">MJPEG</option>
						</select>
					  </label></td>
					</tr>
					<tr>
					  <td align="right" id="Tdcif"><LABEL id="laResolution">率</LABEL></td>
					  <td colspan="2" align="left"><select name="sys_cif" id="sys_cif" class="text" onChange="altReboot()">
						  <option value="0">1920 * 1080</option>
						  <option value="1">1280 * 960</option>
						  <option value="2">1280 * 720</option>
					  </select></td>
					</tr>
					<tr>
					  <td align="right" id="Tdvquality"><LABEL id="laQuality">效果</LABEL></td>
					  <td colspan="2" align="left"><select name="vquality" class="text" id="vquality">
						  <option id="opQuality1" value="0">最好</option>
						  <option id="opQuality2" value="1">好</option>
						  <option id="opQuality3" value="2">一般</option>
					  </select></td>
					</tr>
					<tr>
					  <td align="right" id="Tdadvanced"><LABEL id="laAdvanced">高</LABEL></td>
					  <td colspan="2" align="left"><label>
						<input name="advanced" type="checkbox" id="advanced" onClick="checkClick('vcfg_frm','advanced');setadvanced('');" value="1" checked>
					  </label></td>
					</tr>
					<tr valign="bottom">
					  <td align="right" valign="bottom" id="Tdratectrl"><LABEL id="laRateControl">码率</LABEL></td>
					  <td colspan="2" align="left" valign="top"><select name="ratectrl" size="1" class="text" id="ratectrl" onChange="chgratectrl();" >
						<option id="opRateControl1" value="0">变码率</option>
						<option id="opRateControl2" value="1">定码率</option>
					  </select></td>
					</tr>
					 <tr id="Trquality0" style="display:none;">
					  <td align="right" valign="bottom" id="Tdquality"><LABEL id="laImageQuality">量</LABEL></td>
					  <td colspan="2" align="left" valign="top"><input name="quality" type="hidden" id="quality" value="2">
						<select name="iq" size="1" class="text" id="iq" >
						<option value="0" id="opIQ1">最好</option>
						<option value="1" id="opIQ2">更好</option>
						<option value="2" id="opIQ3">好</option>
						<option value="3" id="opIQ4">差</option>
						<option value="4" id="opIQ5">更差</option>
						<option value="5" id="opIQ6">最差</option>
					  </select></td>
					</tr>
					 <tr id="Trquality1" style="display:none;">
					  <td align="right" valign="bottom"><LABEL id="laRateC">动</LABEL></td>
					  <td colspan="2" align="left" valign="top">
						<select name="rc" size="1" class="text" id="rc" >
						<option value="0" id="opRC1">软件控制</option>
						<option value="1">± 10%</option>
						<option value="2">± 20%</option>
						<option value="3">± 30%</option>
						<option value="4">± 40%</option>
						<option value="5">± 50%</option>
					  </select></td>
					</tr>
				   <tr>
					  <td align="right" valign="bottom"><LABEL id="laBirateFCT">码</LABEL></td>
					 <td colspan="2" align="left" valign="bottom">(30~16384Kb/S)</td>
			      </tr>
				   <tr>
					  <td align="right" valign="top" id="Tdbirate"><LABEL id="laBirate">码</LABEL></td>
					 <td colspan="2" align="left" valign="top"><input name="bitrate" type="text" class="text" id="bitrate" maxlength="8" /></td>
			      </tr>
					<tr valign="bottom">
					  <td align="right" valign="bottom" id="Tdfrmrate"><LABEL id="laFrameRate">帧</LABEL></td>
					  <td width="150" align="left" valign="top"><input name="frmrate" type="text" class="text" id="frmrate" maxlength="8" /></td>
					  <td align="left" id="aRate">&nbsp;</td>
					</tr>
					<tr>
					  <td align="right" valign="bottom" id="Tdfrmintr"><LABEL id="laGOP">I </LABEL></td>
					  <td align="left" valign="top"><input name="frmintr" type="text" class="text" id="frmintr" maxlength="8" /></td>
					  <td align="left" id="aGop">&nbsp;</td>
					</tr>
					<tr>
					  <td align="center">&nbsp;</td>
					  <td colspan="2" align="left">
				<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="LANDefault('')"><LABEL id="btnLANSubmit">LAN默认值</LABEL></a>
				<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="WANDefault('')"><LABEL id="btnWANSubmit">WAN默认值</LABEL></a></td>
				  <tr style="display:none;">
					  <td height="26" align="right" valign="middle" id="Tdfirst"><LABEL id="laFirst">编码模式</LABEL></td>
					  <td colspan="2" align="left" valign="top"><select name="first" size="1" class="text" id="first" >
						<option id="opFirst1" value="0" selected="selected">质量优先</option>
						<option id="opFirst2" value="1">帧率优先</option>
					  </select></td>
				  </tr>
				   </tr>
				</table>
				</div>
				<div style="width:340px; float:left;">
				<table width="100%" border="0" cellpadding="5" cellspacing="1">
				<tr>
				<td width="140" height="26">&nbsp;</td>
				<td width="160" colspan="2" ><LABEL id="laSubStream">次</LABEL></td>
				</tr>
				<tr id="TrLevel2" style=" display:none;">
				<td align="right" id="Tdencoder"><LABEL id="laLevel2">等级</LABEL></td>
				<td colspan="2" align="left">
				<select name="vlevel2" class="text" id="vlevel2" onChange="altReboot()">
				<option value="0" id="opLevel4">Baseline </option>
				<option value="1" id="opLevel5">Main Profile</option>
				<option value="3" id="opLevel6">High Profile </option>
				</select></td>
				</tr>
				<tr>
				<td align="right" id="Tdencoder"><LABEL id="laEncoder2">算法</LABEL></td>
				<td colspan="2" align="left">
				<select name="encoder2" class="text" id="encoder2" onChange="setadvanced('2');encoderLevel();">
				<option value="0">H.264</option>
				<option value="1">MJPEG</option>
				<option value="2">JPEG</option>
				</select></td>
				</tr>
				<tr>
				<td align="right" id="Tdcif"><LABEL id="laResolution2">率</LABEL></td>
				<td colspan="2" align="left"><select name="sys_cif2" id="sys_cif2" class="text" onChange="altReboot()">
				<option value="0">640 * 480</option>
				<option value="1">320 * 240</option>
				<option value="2">160 * 120</option>
				</select></td>
				</tr>
				<tr>
				<td align="right" id="Tdvquality"><LABEL id="laQuality2">效果</LABEL></td>
				<td colspan="2" align="left"><select name="vquality2" class="text" id="vquality2">
				<option id="opQuality4" value="0">最好</option>
				<option id="opQuality5" value="1">好</option>
				<option id="opQuality6" value="2">一般</option>
				</select></td>
				</tr>
				<tr>
				<td align="right" id="Tdadvanced"><LABEL id="laAdvanced2">高</LABEL></td>
				<td colspan="2" align="left"><input name="advanced2" type="checkbox" id="advanced2" onClick="checkClick('vcfg_frm','advanced2');setadvanced('2');" value="1" checked ></td>
				</tr>
				<tr valign="bottom">
				<td align="right" valign="bottom" id="Tdratectrl"><LABEL id="laRateControl2">码率</LABEL></td>
				<td colspan="2" align="left" valign="top"><select name="ratectrl2" size="1" class="text" id="ratectrl2" onChange="chgratectrl();" >
				<option id="opRateControl3" value="0">变码率</option>
				<option id="opRateControl4" value="1">定码率</option>
				</select></td>
				</tr>
				<tr id="Trquality20" style="display:none;">
				<td align="right" valign="bottom" id="Tdquality"><LABEL id="laImageQuality2">量</LABEL></td>
				<td colspan="2" align="left" valign="top"><input name="quality2" type="hidden" id="quality2" value="1">
				<select name="iq2" size="1" class="text" id="iq2" >
				<option value="0" id="opIQ21">最好</option>
				<option value="1" id="opIQ22">更好</option>
				<option value="2" id="opIQ23">好</option>
				<option value="3" id="opIQ24">差</option>
				<option value="4" id="opIQ25">更差</option>
				<option value="5" id="opIQ26">最差</option>
				</select></td>
				</tr>
				<tr id="Trquality21" style="display:none;">
				<td align="right" valign="bottom"><LABEL id="laRateC2">动</LABEL></td>
				<td colspan="2" align="left" valign="top">
				<select name="rc2" size="1" class="text" id="rc2" >
				<option value="0" id="opRC21">软件控制</option>
				<option value="1">± 10%</option>
				<option value="2">± 20%</option>
				<option value="3">± 30%</option>
				<option value="4">± 40%</option>
				<option value="5">± 50%</option>
				</select></td>
				</tr>
				<tr>
				<td align="right" valign="bottom"><LABEL id="laBirateFCT2">码</LABEL></td>
				<td colspan="2" align="left" valign="top">(30~16384Kb/S)</td>
				</tr>
				<tr>
				<td align="right" valign="top" id="Tdbirate"><LABEL id="laBirate2">码</LABEL></td>
				<td colspan="2" align="left" valign="top"><input name="bitrate2" type="text" class="text" id="bitrate2" maxlength="8" /></td>
				</tr>
				<tr valign="bottom">
				<td align="right" valign="bottom" id="Tdfrmrate"><LABEL id="laFrameRate2">帧</LABEL></td>
				<td width="150" align="left" valign="top"><input name="frmrate2" type="text" class="text" id="frmrate2" maxlength="8" /></td>
				<td align="left" valign="top" id="aRate2">&nbsp;</td>
				</tr>
				<tr>
				<td align="right" valign="bottom" id="Tdfrmintr"><LABEL id="laGOP2">I </LABEL></td>
				<td align="left" valign="top"><input name="frmintr2" type="text" class="text" id="frmintr2" maxlength="8" /></td>
				<td align="left" valign="top" id="aGop2">&nbsp;</td>
				</tr>
				<tr>
				<td align="center">&nbsp;</td>
				<td colspan="2" align="left">
				<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="LANDefault('2')"><LABEL id="btnLANSubmit2">LAN默认值</LABEL></a>
				<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="WANDefault('2')"><LABEL id="btnWANSubmit2">WAN默认值</LABEL></a></td>
				</tr>
				<tr style="display:none;">
				<td height="26" align="right" valign="middle" id="Tdfirst"><LABEL id="laFirst2">编码模式</LABEL></td>
				<td colspan="2" align="left" valign="top"><select name="first2" size="1" class="text" id="first2" >
				<option id="opFirst3" value="0" selected="selected">质量优先</option>
				<option id="opFirst4" value="1">帧率优先</option>
				</select></td>
				</tr>
				</table>
				</div>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl116">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div id="StrNotice" class="divnotice">
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laLANAlert">LAN:局域网.</LABEL><br />
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laWANAlert">WAN:广域网.</LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input type="hidden" value="120" name="maxfrmintr" id="maxfrmintr">
<input type="hidden" value="25" name="maxfrmrate" id="maxfrmrate">
<input type="hidden" value="1" name="nlevel" id="nlevel">
<input type="hidden" value="1" name="nfluctuate" id="nfluctuate">
</form>
<%outVideoEncodingCfgEx();%>
</body>
</html>
