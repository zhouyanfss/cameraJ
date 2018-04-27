<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接入配置</title>
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
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

function init(){
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/zxlwCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">接入配置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
				<table width="100%" cellpadding="5" cellspacing="1">
                <tr>
                  <td width="24%" height="21" align="right" id="Tdurl">服务器IP</td>
                  <td width="76%" height="21" align="left"><input name="rgmip" type="text" class="text" id="rgmip" maxlength="32" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdport">
&nbsp;&nbsp;&nbsp;服务器端口&nbsp;</td>
                  <td height="21" align="left"><input name="remport" type="text" class="text" id="remport" onKeyPress="event.returnValue=isDigit();" maxlength="5"  /></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdpuid">PUID</td>
                  <td height="15" align="left"><input name="puid" type="text" class="text" id="puid" maxlength="20"  /></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdpsw">密码</td>
                  <td height="15" align="left"><input name="password" type="password" class="text" id="password" maxlength="32" style="width:132px;"/></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdtype">码流类型</td>
                  <td height="15" align="left">
                    <select name="vtype" class="input2" id="vtype">
                      <option value="0">视频流</option>
                      <option value="1">混和流</option>
                    </select>
                  </td>
                </tr>
                <tr style="display:none;">
                  <td width="118" height="15" align="right" id="Tdsensor">探头报警联动</td>
                  <td width="217" height="15" align="left" class="btd">
                    <select name="vsensor" class="input2" id="vsensor">
                      <option value="0">无</option>
                    </select>
                  </td>
                </tr>
			 <tr>
                  <td height="15" align="right" id="Tdinfo">相关信息</td>
                  <td height="21" align="left"><textarea name="accessinfo" cols="38" rows="3" disabled class="input_buton_hui_4" id="accessinfo">success</textarea></td>
                </tr>
				</table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl90">
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
<script language="javascript">
try{
  if(lanset==0){
	for(i=1;i<=110;i++){
		$s("vsensor").options[$s("vsensor").length] = new Option("Preset-"+i,i);
	}
	$s("vsensor").options[$s("vsensor").length] = new Option("Auto Scan",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("P&amp;T Scan",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Preset Tour-1",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Preset Tour-2",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Figure Scan-1",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Figure Scan-2",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Figure Scan-3",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("Figure Scan-4",$s("vsensor").length);
  }else{
	for(i=1;i<=110;i++){
		$s("vsensor").options[$s("vsensor").length] = new Option("预置位-"+i,i);
	}
	$s("vsensor").options[$s("vsensor").length] = new Option("自动扫描",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("削苹果扫描",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("预置位巡视-1",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("预置位巡视-2",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("花样扫描-1",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("花样扫描-2",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("花样扫描-3",$s("vsensor").length);
	$s("vsensor").options[$s("vsensor").length] = new Option("花样扫描-4",$s("vsensor").length);
  }
}catch(e){}
</script>
<%outZxlwCfgEx();%>
</body>
</html>
