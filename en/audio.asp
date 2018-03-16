<html>
<head>
<title>Audio</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT">
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/send.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>
<script language="javascript" type="text/javascript" src="./js/cprogress.js"></script>
<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
</head>
<script language="javascript">
var initSNOK	= 0;
var inasd, inv, outsd, outv;
function Checkfrm(){
	if(bReboot==1&&window.confirm(ALERTREBOOTCFM)==false) {return false;}
	$("bitrate").disabled = false;
	setTimeout(do_submit,0);
}
function init(){
	ChangeLanguage('../xml/audio.xml', m_szLanguage);
	initChannel();
	if(typeof(inasd)!="object")inasd=new Slider($("inam"), $("inas"), {steps:15, wheel:!0, onChange:function(a){$("inas").setProperty("title", a); inv=a; $("inav").setProperty("text",inv); $("volume").value=inv}});
	if(typeof(outsd)!="object")outsd=new Slider($("outam"), $("outas"), {steps:15, wheel:!0, onChange:function(a){$("outas").setProperty("title", a); outv=a; $("outav").setProperty("text",outv);$("outvolume").value=outv}});
	
	var nintv=parseInt($("volume").value), noutv=parseInt($("outvolume").value);
	if(isNaN(nintv))nintv=0;
	if(isNaN(noutv))noutv=0;
	inasd.set(nintv); outsd.set(noutv);
	
	$("btnSave").addEvent("click", Checkfrm);
	initSNOK	= 1;
}
function altReboot(){bReboot=1;}
function chgbirtate(){
	var pflag= $("type").value;
	if(pflag=="8"){
		$("bitrate").value = 128000;
	}else{
		$("bitrate").value = 16000;
	}
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/audioCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">音频属性</LABEL></li>
			<li class="laHelp" style="display:none;"></a></li> 
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
			
			<ul id="show_Enable">
				<li class="tb1"><LABEL  id="laAudioEnable">音频开关</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<input name="ckaudio" type="checkbox" id="ckaudio" onClick="checkClick('audio_frm','ckaudio')" value="checkbox" />
				</li>
			</ul>
			<ul id="show_Audio_Input">
				<li class="tb1"><LABEL  id="laAudioInput">音频输入</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="inputtype" id="inputtype" class="select2" >
					<option value="0">麦克</option>
					<option value="1">线输入</option>
				</select>
				</li>
			</ul>
			<ul id="show_Type">
				<li class="tb1"><LABEL  id="laCompressionType">压缩格式</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="type" id="type" class="select2" onChange="chgbirtate()">
					<option value="0">MP3</option>
					<option value="1">WAV</option>
					<option value="2" selected>G.726</option>
				</select>
				</li>
			</ul>
			<ul id="show_Bitrate">
				<li class="tb1"><LABEL  id="laAudioBitrate">音频码率</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="bitrate" id="bitrate" class="select2" disabled="disabled">
					<option value="0">32K</option>
					<option value="1">64K</option>
				</select>
				</li>
			</ul>
			<ul id="show_Sampling">
				<li class="tb1"><LABEL  id="laSamplingRate">采样率</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="sampling" id="sampling" class="select2" onChange="altReboot()">
					<option value="0">32K</option>
					<option value="1">64K</option>
				</select>
				</li>
			</ul>
			<ul id="show_InVolume">
				<li class="tb1"><LABEL  id="laInputVolume">输入音量</LABEL></li>
				<li class="tb2"></li>
				<li class="lefsx">
					<div id='inam' class="sax">
						<div id='inas' class="skx"></div>
					</div>
					<div id="inav" class="num">0</div>
				</li>
				<li class="rig"><input name="volume" id="volume" type="hidden" value="4"></li>
			</ul>
			<ul id="show_OutVolume">
				<li class="tb1"><LABEL  id="laOutputVolume">输出音量</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
					<div id='outam' class="sax">
						<div id='outas' class="skx"></div>
					</div>
					<div id="outav" class="num">0</div>
				</li>
				<li class="rig"><input name="outvolume" id="outvolume" type="hidden" value="8"></li>
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
var progress=new CProgress("progress",0,100,0,1);progress.progressWidth=300;progress.Create();playInc=setInterval("progress.Inc();",50);
function playDiv(){$s("divAlert").innerHTML=ALERTAIINIT;$s("divProgress").style.display="";progress.SetPos(0);}
function displayDiv(){setTimeout("window.self.location.href='./audio.asp';",48000);playDiv();}
//-->
</script>
</div>
<%outAudioCfgEx();%>
</body>
</html>
