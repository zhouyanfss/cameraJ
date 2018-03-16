<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html> 
<head>
<title>WEB SERVICE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/language.js"></script>
<script type="text/javascript" src="script/flush_string.js"></script>

<script type="text/javascript" src="jsmain/getcookie.js"></script>
<script type="text/javascript" src="jsmain/centerview.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="style/index.css" />
<link rel="stylesheet" type="text/css" media="screen" href="style/menus.css" />
</head>
<body>
<!-----辅助信息-------->
<div id="divType" style="display:none; width:0px; height:0px;"></div>
<div style="display:none; width:0px; height:0px;">
<form name="outcfg_frm" id="outcfg_frm" method="post" action="" style="height:0px;">
	<input type="hidden" value="1" 	id="nwindows"  	name="nwindows" >
	<input type="hidden" value="0" 	id="zoomin"  	name="zoomin" >
	<input type="hidden" value="1" 	id="bCenterWeb" name="bCenterWeb" >
	<input type="hidden" value="1" 	id="vlanguage" 	name="vlanguage" ><!--0EngLish	1Chinese//-->
	
	<input type="hidden" value="0" 	id="digest"  	name="digest" >
	<input type="hidden" value="1" 	id="ipc"  		name="ipc" >
	
	<input type="hidden" name="url" 	id="url" 	value="192.168.1.231" />
	<input type="hidden" name="port" 	id="port" 	value="5000"/>
	<input type="hidden" name="uname" 	id="uname" 	value="admin"/>
	<input type="hidden" name="passwd" 	id="passwd" value="admin"/>
	
	<input type="hidden" value="4" name="nlevel" 	id="nlevel" />
	
	<input type="hidden" value="4" 	id="devicetype" 	name="devicetype" />
	<input type="hidden" value="1" name="nchannel" 	id="nchannel" />
	<input type="hidden" value="0" name="nstorage" 		id="nstorage" />
		
	<input type="hidden" value="1920" 	id="mainwidth"  	name="mainwidth" >
	<input type="hidden" value="1280" 	id="mainheight"  	name="mainheight" >
	<input type="hidden" value="640"  	id="subwidth"  		name="subwidth" >
	<input type="hidden" value="480" 	id="subheight"  	name="subheight" >
	
	<input type="hidden" value="64" 	id="vbri" 		name="vbri">
	<input type="hidden" value="127" 	id="vhue" 		name="vhue">
	<input type="hidden" value="78" 	id="vcon" 		name="vcon">
	<input type="hidden" value="210" 	id="vsat" 		name="vsat">
	
	<input type="hidden" value="1" name="OutputCtrl1" id="OutputCtrl1">
	<input type="hidden" value="0" name="OutputCtrl2" id="OutputCtrl2">
	<input type="hidden" value="0" name="OutputCtrl3" id="OutputCtrl3">
	<input type="hidden" value="0" name="OutputCtrl4" id="OutputCtrl4">
	<input type="hidden" value="0" name="OutputCtrl5" id="OutputCtrl5">
	<input type="hidden" value="0" name="OutputCtrl6" id="OutputCtrl6">
	<input type="hidden" value="0" name="OutputCtrl7" id="OutputCtrl7">
	<input type="hidden" value="0" name="OutputCtrl8" id="OutputCtrl8">
	<input type="hidden" value="1" name="noutput" 	  id="noutput" />
	
	<input type="hidden" value="0" 	id="iswifi"  	name="iswifi" >
	<input type="hidden" value="0" 	id="wifi"  		name="wifi" >
	<input type="hidden" value="0" 	id="IsCDMA"  	name="IsCDMA" >
	<input type="hidden" value="0" 	id="mobilecfg" 	name="mobilecfg" >
	<input type="hidden" value="0" 	id="IsGPS"  	name="IsGPS" >
	<input type="hidden" value="0" 	id="netsnmp"  	name="netsnmp" >
	<input type="hidden" value="0" 	id="httpscfg"  	name="httpscfg" >

	<input type="hidden" value="0" 	id="zxlwcfg"  	name="zxlwcfg" >
	<input type="hidden" value="0" 	id="hxhtcfg"  	name="hxhtcfg" >
	<input type="hidden" value="0" 	id="xdtxcfg"  	name="xdtxcfg" >
	<input type="hidden" value="0" 	id="accesscfg"  name="accesscfg" >
	<input type="hidden" value="0" 	id="smcfg"  	name="smcfg" >
	<input type="hidden" value="0" 	id="gb28181"  	name="gb28181" >
</form>
</div>
<div class="ie6-out">
  <div class="ie6-in">
	<div class="min-width">
	  <div id="main">
		<!-----mb0 设置-------->
		<div id="mb0" style="display:none; min-width:1000px; margin-top:7px;">
		  <div class="settingDiv" id="divSetting">
		  	<div id="mb0_setting_bar" class="settingleft"></div>
			<div id="mb0_setting" class="settingright">
				<iframe id="set_fm" src="" width="100%" height="100%" frameborder="0" style="min-width:760px;min-height:510px;_height:510px;y-overflow:auto;x-overflow:hidden;"></iframe>
			</div>
		  </div>
		</div>
		
		<div class="footer"></div>
	  </div>
	  <!----<div id="main"> --->
	</div>
  </div>
</div>
<div id="estopAll" style="display:none;" class="estopAll" ></div>
<iframe name="btnHit" id="btnHit" src="" align="btnHit" frameborder="0" scrolling="no" style="background-color:#000000;" height="0" width="0"></iframe>
<%outLoginCMS();%>
</body>
</html>