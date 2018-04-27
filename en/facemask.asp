<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>video</title>
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
<script type="text/javascript" src="jsmain/base64.js"></script>
<script type="text/javascript" src="jsmain/md5.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	if($("ismask").value=="1"){	sumbitokOneRegion();}else{setTimeout(do_click,0);}
	return false;
}
function do_click(){$("BtnSubmit").click();}
function init(){
	ChangeLanguage('../xml/videomask.xml', m_szLanguage);
	initChannel();
	setTimeout("initvideo(0);", 320);
	
	$("btnSave").addEvent("click", Checkfrm);
	return true;
}
</script>
<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(1)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>
<script language="javascript" for="WebCMS" event="CBK_GetTrackerArea(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight)">
	SetGetAreaOneRegion(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight);
</script>
<div style="z-index: 0; position:absolute; margin:0px; padding:0px; top:460px; left: 210px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%;" id="DivUpdateAlert">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center 
bgColor=#ffffe7 border=1>
  <TBODY>
  <TR>
  <TD align=middle height=56 >
<form name=loading id="loading" style="margin:0px; padding:0px;">
 <p align=center> 
 <div style="text-align:center; height:38px; padding-top:18px;" id="Divloading" ><img src="images/loading.gif" width="32" height="32"></div>
 <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:12px;" id="Divtext" size="2" face="Arial"><LABEL id="laDateSubmitWaittin">数据提交中，请稍等......</LABEL></div>
 </p>
</form>
  </TD></TR>
  </TBODY></TABLE></div>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/FaceMaskCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab"  style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laFaceRegion"></LABEL></li>
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
				<div id="divChannelTitle"><LABEL id="laChannel">:</LABEL></div>
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
				<div id="divChannelSyncTitle"><LABEL id="laChannelSync"></LABEL></div>
				</td>
                </tr>
           </table>
				</li>
			</ul>

			<ul id="show_Main">
				<li class="vrig" id="laMain">
		  <table border="0" width="420" cellspacing="0" cellpadding="0">
               <tr>
                <td valign="top">
				<object name="WebCMS" ID="WebCMS" width="420" height="288" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" CODEBASE="/WebCMS.exe#Version=2,0,0,0"></object>				</td>
              </tr>
                <tr>
                 <td height="28" valign="middle"><div id="Divckmask" class="divvalue" style="margin-left:15px;"><input name="ckon" type="checkbox" id="ckon" onClick="checkClick('','ckon');" value="1" checked="CHECKED"  /></div><div id="Divckmaskt" style="width:230px; text-align:left;"><LABEL id="laFaceRegionSwitch"></LABEL></div>
				   <input name="nLeft1" type="hidden" id="nLeft1" value="0" />
				<input name="nTop1" type="hidden" id="nTop1" value="0" />
				<input name="nWidth1" type="hidden" id="nWidth1" value="0" />
				<input name="nHeight1" type="hidden" id="nHeight1" value="0" />
				<input name="nLeft2" type="hidden" id="nLeft2" value="0" />
				<input name="nTop2" type="hidden" id="nTop2" value="0" />
				<input name="nWidth2" type="hidden" id="nWidth2" value="0" />
				<input name="nHeight2" type="hidden" id="nHeight2" value="0" />
				<input name="nLeft3" type="hidden" id="nLeft3" value="0" />
				<input name="nTop3" type="hidden" id="nTop3" value="0" />
				<input name="nWidth3" type="hidden" id="nWidth3" value="0" />
				<input name="nHeight3" type="hidden" id="nHeight3" value="0" />
				<input name="nLeft4" type="hidden" id="nLeft4" value="0" />
				<input name="nTop4" type="hidden" id="nTop4" value="0" />
				<input name="nWidth4" type="hidden" id="nWidth4" value="0" />
				<input name="nHeight4" type="hidden" id="nHeight4" value="0" />	
				<input name="fanzhuan" type="hidden" id="fanzhuan" value="0" />	
				<input name="jingxiang" type="hidden" id="jingxiang" value="0" />	
				<input name="xuanzhuan" type="hidden" id="xuanzhuan" value="0" />	
				<input name="nEncWidth" type="hidden" id="nEncWidth" value="0" />	
				<input name="nEncHeight" type="hidden" id="nEncHeight" value="0" />	
					</td>
                </tr>
              <tr>
                 <td height="32" align="center" valign="middle">
<a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoOneRegion()" id="btnMaskAreaSet"><LABEL id="laFaceRegionSet"></LABEL></a>
<a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselallOneRegion()" id="btnMaskAll" disabled="disabled"><LABEL id="laAll"></LABEL></a>
<a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselclrOneRegion()" id="btnMaskClear" disabled="disabled"><LABEL id="laCls"></LABEL></a>
				<input name="MAnum" type="hidden" id="MAnum" value="0">
				<input name="ismask" type="hidden" id="ismask" value="0">
				<input name="islens" type="hidden" id="islens" value="1"></td>
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
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input name="BtnSubmit" type="submit" class="button" id="BtnSubmit"  style="width:86px; display:none;" value="Submit"/>
</form>
<%outFaceMaskCfgEx();%>
</body>
</html>
