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

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
</head>
<script language="javascript">
function Checkfrm(){
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/picture.xml', m_szLanguage);
	initChannel();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/pictureCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">抓拍图片参数</LABEL></li>
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
				<li class="vrig" id="laMain">
					<table width="520" border="0" cellpadding="5" cellspacing="1">
                            <tr>
                              <td width="160" height="25" align="right" valign="middle" id="Tdformat"><LABEL id="laPictureFormat">图片格式</LABEL></td>
                              <td align="left" valign="middle"><label>
                                <select name="pic_format" class="text" id="pic_format">
                                  <option value="0">jpg</option>
                                  <option value="1">bmp</option>
                                </select>
                              </label></td>
                            </tr>
                            <tr>
                              <td height="25" align="right" valign="middle" id="Tdcif"><LABEL id="laResolution">分辨率</LABEL></td>
                              <td align="left" valign="middle"><select name="pic_cif" class="text" id="pic_cif">
                                <option value="0">704 * 576</option>
                                <option value="1">352 * 288</option>
                                <option value="2">176 * 144</option>
                                </select></td>
                            </tr>
                            <tr id="trQuality" style="display:none;">
                              <td height="25" align="right" valign="middle" id="Tdquality"><LABEL id="laQuality">图片质量</LABEL></td>
                              <td align="left" valign="middle">
							  <select name="quality" size="1" class="text" id="quality" >
                                <option value="0" selected="selected">1</option>
                                <option value="1">2</option>
                                <option value="2">3</option>
                                <option value="3">4</option>
                                <option value="4">5</option>
                                <option value="5">6</option>
                              </select>
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
</form>
<%outPictureCfgEx();%>

</body>
</html>
