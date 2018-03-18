<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本地设置</title>
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
	SetLocal();
	
	//saveCookie("SaveYes","ok",7);
	return true;
}
var  Rec_check_str = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ°′″１２３４５６７８９０～！＂＇·……ˇ＠¨〈〉「」『』．‖〃〔〕〖〗—（），。【】《》？；‘：“”［］｛｝—＋＝｜｀、《》~`!@#$%^&*()_+|-=\'/<>[],.:; \\";

function SetLocal(){
	var Rectime, CapPath, RecPath, DecPriority, vblank;
	var bitrate;

	Rectime		= $s("Rectime").value;
	RecPath		= $s("RecPath").value;
	DecPriority	= $s("DecPriority").value;
	bitrate 	= $s("bitrate").value;
	if(RecPath != "")	{
		if(!check_com(RecPath,Rec_check_str)){
			remarkDisplay("divAlertHTML", "* " + ALERTRECORDPATH, 3E3, 1);
			return (false);
		}
	}else{
		remarkDisplay("divAlertHTML", "* " + ALERTRECORDPATH, 3E3, 1);
		return (false);
	}
	
	if($s("vblank").checked==true){
		vblank	= 1;
	}else{
		vblank	= 0;
	}
	$p("WebCMS").SetRecordPackTime(Rectime);
	$p("WebCMS").SetRecordPath(RecPath);
	$p("WebCMS").SetDecoderPriority(DecPriority);
	$s("RecPath").value = $p("WebCMS").GetRecordPath();
	$p("WebCMS").SetDeflash(vblank);
	$p("WebCMS").SetStreamType(bitrate);
	
	remarkDisplay("divAlertHTML", "* " + ALERTSAVESUCCEED, 3E3, 1);
}


var StrRec,Strdisk,StrGetLocal;
function GetLocal(){
 	window.clearTimeout(StrGetLocal);
	var Reci,Decnum,bitrate;
	

	$s("Rectime").value = $p("WebCMS").GetRecordPackTime();
	$s("RecPath").value = $p("WebCMS").GetRecordPath();
	Decnum = $p("WebCMS").GetDecoderPriority();
	if(Decnum==true){
		$s("DecPriority").options[1].selected=true;
	}else{
		$s("DecPriority").options[0].selected=true;
	}
	
	bitrate	= $p("WebCMS").GetStreamType()
	if(bitrate==1){
		$s("bitrate").options[1].selected=true;
	}else{
		$s("bitrate").options[0].selected=true;
	}	
	if($p("WebCMS").GetDeflash==1){
		$s("vblank").checked = true ;
	}else{
		$s("vblank").checked = false;
	}
}
function init(){
//m_szLanguage="en";
	ChangeLanguage('../xml/local.xml', m_szLanguage);
	StrGetLocal = setTimeout('GetLocal();',321);
	$("btnSave").addEvent("click",Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/localCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Bitrate" style="display:none;">
				<li class="tb1"><LABEL id="laBitrate">码流选择</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="bitrate" id="bitrate">
					<option id="opBitrate1" value="0" selected>主码流</option>
					<option id="opBitrate2" value="1">次码流</option>
				</select>
				</li>
			</ul>
			<ul id="show_Priority">
				<li class="tb1"><LABEL id="laDecPriority">预览模式</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="DecPriority" id="DecPriority">
					<option id="opDecPriority1" value="0">实时优先</option>
					<option id="opDecPriority2" value="1" selected>流畅优先</option>
				</select>
				</li>
			</ul>
			<ul id="show_Blank">
				<li class="tb1"><LABEL id="laBlank">消除闪烁</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<input name="vblank" type="checkbox" id="vblank" value="0" />
				</li>
			</ul>
			
			<ul id="show_PackTime">
				<li class="tb1"><LABEL id="laRecordPackTime">录像文件打包时间</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<select name="Rectime" id="Rectime" >
					<option value="1">1</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="60">60</option>
				</select>
				</li>
				<li class="rig"><LABEL id="laRecordPackTimeUnit">分</LABEL></li>
			</ul>
			<ul id="show_PackPath">
				<li class="tb1"><LABEL id="laRecordPackPath">录像/抓拍文件存储目录</LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<input name="RecPath" type="text" class="text" id="RecPath" value="" maxlength="56">
				</li>
				<li class="rig"><LABEL id="laRecordPackPathAlert"></LABEL></li>
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
</body>
</html>
