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
	switch(parseInt($s("lensidnum").value)){
	case 1:
		$s("Tdlenst1").style.display = "";
		$s("Tdlensid1").style.display = "";
		$s("Tdlenst2").style.display = "none";
		$s("Tdlensid2").style.display = "none";
		$s("Tdlenst34").style.display = "none";
		break;
	case 2:
		$s("Tdlenst1").style.display = "";
		$s("Tdlensid1").style.display = "";
		$s("Tdlenst2").style.display = "";
		$s("Tdlensid2").style.display = "";
		$s("Tdlenst34").style.display = "none";
		break;
	case 3:
		$s("Tdlenst1").style.display = "";
		$s("Tdlensid1").style.display = "";
		$s("Tdlenst2").style.display = "";
		$s("Tdlensid2").style.display = "";
		$s("Tdlenst34").style.display = ""; 
		$s("Tdlenst3").style.display = "";
		$s("Tdlensid3").style.display = "";
		$s("Divlenst4").style.display = "none";
		$s("Divlensid4").style.display = "none";
		break;
	case 4:
		$s("Tdlenst1").style.display = "";
		$s("Tdlensid1").style.display = "";
		$s("Tdlenst2").style.display = "";
		$s("Tdlensid2").style.display = "";
		$s("Tdlenst34").style.display = "";
		$s("Tdlenst3").style.display = "";
		$s("Tdlensid3").style.display = "";
		$s("Divlenst4").style.display = "";
		$s("Divlensid4").style.display = "";
		break;
	default:
		$s("Tdlenst1").style.display = "";
		$s("Tdlensid1").style.display = "";
		$s("Tdlenst2").style.display = "none";
		$s("Tdlensid2").style.display = "none";
		$s("Tdlenst34").style.display = "none";
		break;
	}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/xdtxCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
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
                      <td width="86" height="18" align="right" id="Tdlenst1">镜头ID1</td>
                      <td width="150" align="left" id="Tdlensid1"><input name="lensid1" type="text" class="text" id="lensid1" maxlength="20" style="width:160px;" /></td>
                      <td width="86" align="right" id="Tdlenst2" style="display:none;">镜头ID2</td>
                      <td width="147" align="left" id="Tdlensid2" style="display:none;"><input name="lensid2" type="text" id="lensid2" class="text" maxlength="20" style="width:160px;" /></td>
                    </tr>
                    <tr id="Tdlenst34" style="display:none;">
                      <td height="18" align="right" id="Tdlenst3" style="display:none;">镜头ID3</td>
                      <td align="left" id="Tdlensid3" style="display:none;"><input name="lensid3" type="text" id="lensid3" class="text" maxlength="20" style="width:160px;" /></td>
                      <td align="right"><div id="Divlenst4" style="margin:0px; padding:0px;display:none;">镜头ID4</div></td>
                      <td align="left"><div id="Divlensid4" style="margin:0px; padding:0px;display:none;"><input name="lensid4" type="text" id="lensid4" class="text" maxlength="20" style="width:160px;" /></div></td>
                    </tr>
                    <tr id="Tdlenspt12" style="display:none;">
                      <td width="86" height="18" align="right" id="Tdlenspt1">pin码 </td>
                      <td width="150" align="left" id="Tdlenspv1"><input name="lenspin1" type="text" id="lenspin1" class="text" maxlength="20" style="width:160px;" /></td>
                      <td width="86" align="right" id="Tdlenspt2" style="display:none;"> pin码 2</td>
                      <td width="147" align="left" id="Tdlenspv2" style="display:none;"><input name="lenspin2" type="text" id="lenspin2" class="text" maxlength="20" style="width:160px;" /></td>
                    </tr>
                    <tr id="Tdlenspt34" style="display:none;">
                      <td height="18" align="right" id="Tdlenspt3" style="display:none;">pin码 3</td>
                      <td align="left" id="Tdlenspv3" style="display:none;"><input name="lenspin3" type="text" id="lenspin3" class="text" maxlength="20" style="width:160px;" /></td>
                      <td align="right"><div id="Divlenspt4" style="margin:0px; padding:0px;display:none;">pin码 4</div></td>
                      <td align="left"><div id="Divlenspv4" style="margin:0px; padding:0px;display:none;"><input name="lenspin4" type="text" id="lenspin4" class="text" maxlength="20" style="width:160px;" /></div></td>
                    </tr>
                <tr id="strconnect">
                  <td height="18" align="right" id="Tdctype">连接类型</td>
                  <td height="18" colspan="3" align="left"><label>
                    <select name="ctype" id="ctype" class="input2">
                      <option value="0">UDP</option>
                      <option value="1">TCP</option>
                      <option value="2">JPG</option>
                    </select>
                  </label></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdcenterurl">中心服务器地址</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="centeraddr" type="text" id="centeraddr" maxlength="32" class="text" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdcenterport">中心服务器端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="centerport" type="text" class="text" id="centerport" maxlength="32" />
                    <input name="lensidnum" type="hidden" id="lensidnum" value="1" /></td>
               </tr>
			 <tr>
                  <td height="15" align="right" id="Tdinfo">相关信息</td>
                  <td height="21" align="left" colspan="3"><textarea name="accessinfo" cols="38" rows="3" disabled class="input_buton_hui_4" id="accessinfo">success</textarea></td>
                </tr>             </table>
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
</form>
<%outXdtxCfgEx();%>
</body>
</html>
