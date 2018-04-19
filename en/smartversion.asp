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
	if($("ismask").value=="1"){	sumbitok();}else{setTimeout(do_click,0);}
	return false;
}
function do_click(){$("BtnSubmit").click();}
function init(){
	ChangeLanguage('../xml/audio.xml', m_szLanguage);
	initChannel();
	setTimeout("initvideo(0);", 320);
	
	//$("btnSave").addEvent("click", Checkfrm);
	return true;
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/smartVersionCFgEx"  style="margin:0px; padding:0px;">
<div id="divMain" style="height:300px;">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laFaceVersions"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<div style="margin-left: 130px;margin-top: 30px;">
					<div style="width: 60px;" ><LABEL id="laFaceVersionSFs"></LABEL></div>
						<div style="margin-top: -17px;margin-left:60px;">
							<input name="sfver" disabled="disabled" type="text" class="text" id="sfver" value="" />
					</div>
				</div>
				<div style="margin-left: 130px;margin-top: 10px;">
					<div style="width: 60px;" ><LABEL id="laFaceVersionMBs"></LABEL></div>
						<div style="margin-top: -17px;margin-left:60px;">
							<input name="mvver" disabled="disabled" type="text" class="text" id="mvver" value="" />
					</div>
				</div>
		</div>
</div>
</div>
</form>
<%outSmartVersionCFgEx();%>
</body>
</html>