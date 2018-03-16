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
function chgntype(){
	if($s("cknat").value=="0"){
		$s("strlensc").style.display 	= "";
		$s("strlensnap").style.display 	= "none";
		$s("strlensnatback").style.display 	= "none";
	}else{
		$s("strlensc").style.display 	= "none";
		$s("strlensnap").style.display 	= "";
		$s("strlensnatback").style.display 	= "";
	}
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
	}
	chgntype();
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/hxhtCfgEx"  style="margin:0px; padding:0px;">
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
                      <td width="85" height="18" align="right" id="Tdlenst1">镜头ID1</td>
                      <td width="162" align="left" id="Tdlensid1"><input name="lensid1" type="text" class="text" id="lensid1" value="12345678901234567890" maxlength="20" style="width:160px;" /></td>
                      <td width="60" align="right" id="Tdlenst2" style="display:none;">镜头ID2</td>
                      <td width="162" align="left" id="Tdlensid2" style="display:none;"><input name="lensid2" type="text" id="lensid2" class="text" maxlength="20" style="width:160px;" /></td>
                    </tr>
                    <tr id="Tdlenst34" style="display:none;">
                      <td height="18" align="right" id="Tdlenst3" style="display:none;">镜头ID3</td>
                      <td align="left" id="Tdlensid3" style="display:none;"><input name="lensid3" type="text" id="lensid3" class="text" maxlength="20" style="width:160px;" /></td>
                      <td align="right"><div id="Divlenst4" style="margin:0px; padding:0px;display:none;">镜头ID4</div></td>
                      <td align="left"><div id="Divlensid4" style="margin:0px; padding:0px;display:none;"><input name="lensid4" type="text" id="lensid4" class="text" maxlength="20" style="width:160px;" /></div></td>
                    </tr>
                <tr id="strlensvp">
                  <td height="18" align="right" valign="middle" id="Tdvport">视频端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="videoport" type="text" id="videoport" class="text" value="4600" maxlength="32" /></td>
                </tr>
                <tr id="strlensap">
                  <td height="18" align="right" valign="middle" id="Tdaport">音频端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="audioport" type="text" id="audioport" class="text" value="4601" maxlength="32" /></td>
                </tr>
                <tr id="strlensmp">
                  <td height="18" align="right" valign="middle" id="Tdmport">消息端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="msgport" type="text" id="msgport" class="text" value="4602" maxlength="32" /></td>
                </tr>
                <tr id="strlensrp">
                  <td height="18" align="right" valign="middle" id="Tdpport">回放端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="replayport" type="text" id="replayport" class="text" value="4603" maxlength="32" /></td>
                </tr>
                <tr id="strlensfp">
                  <td height="18" align="right" valign="middle" id="Tdfport">FTP 端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="ftpport" type="text" id="ftpport" class="text" value="21" maxlength="32" /></td>
                </tr>
		<tr id="strlensyt">
                  <td height="18" align="right" valign="middle" id="Tdupnpserve">映射服务端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="upnpserve" type="checkbox" id="upnpserve" value="0" onClick="checkclick('lens_frm','upnpserve')" /></td>
                </tr>
                <tr id="strlensrt">
                  <td height="18" align="right" valign="middle" id="Tdrstorage">远程存储模式</td>
                  <td height="18" colspan="3" align="left" valign="middle">
                    <select name="rstorage" id="rstorage" class="input2">
                      <option value="0">拉模式</option>
                      <option value="1">推模式</option>
                    </select>                  </td>
                </tr>
                <tr id="strusercon">
                  <td height="18" align="right" valign="middle" id="Tdusernum">用户连接数</td>
                  <td height="18" colspan="3" align="left" valign="middle">
                    <input name="usernum" type="text" id="usernum" class="text" value="21" maxlength="2" onKeyPress="event.returnValue=isDigit();" />                  </td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdcenterurl">接入服务器地址</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="centeraddr" type="text" id="centeraddr" maxlength="32" class="text" /></td>
                </tr>
                <tr>
                  <td height="18" align="right" valign="middle" id="Tdcenterport">接入服务器端口</td>
                  <td height="18" colspan="3" align="left" valign="middle"><input name="centerport" type="text" class="text" id="centerport" maxlength="32" />
                    <input name="lensidnum" type="hidden" id="lensidnum" value="1" /></td>
               </tr>
                <tr id="strlensnat">
                  <td height="18" align="right" valign="middle" id="Tdnat">接入方式</td>
                  <td height="18" colspan="3" align="left" valign="middle">
				  <select name="cknat" id="cknat" class="input2" onChange="chgntype();">
                      <option value="0">短连接</option>
                      <option value="1">长连接</option>
				  </select>
				  </td>
                </tr>
                <tr id="strlensc" style="display:none;">
                  <td height="18" align="right" id="Tdntype">回放方式</td>
                  <td height="18" colspan="3" align="left">
                    <select name="ntype" id="ntype" class="input2">
                      <option value="0">FTP</option>
                      <option value="1">TCP</option>
                    </select>
                  </td>
                </tr>
                <tr id="strlensnap" style="display:none;">
                  <td height="18" align="right" id="Tdntsnap">前端抓拍</td>
                  <td height="18" colspan="3" align="left"><input name="cksnap" type="checkbox" id="cksnap" value="0" onClick="checkclick('outcfg_frm','cksnap');" /></td>
                </tr>
                <tr id="strlensnatback" style="display:none;">
                  <td height="18" align="right" id="Tdntsnap2">在NAT后面</td>
                  <td height="18" colspan="3" align="left"><input name="cknatafter" type="checkbox" id="cknatafter" value="0" onClick="checkclick('outcfg_frm','cknatafter');" /></td>
                </tr>
                <tr id="strlensnatthru" style="display:none;">
                  <td height="18" align="right" id="Tdntsnap3">支持NAT穿越</td>
                  <td height="18" colspan="3" align="left"><input name="cknatpass" type="checkbox" id="cknatpass" value="0" onClick="checkclick('outcfg_frm','cknatpass');" /></td>
                </tr>
                <tr id="strlcvideo">
                  <td height="18" align="right" id="Tdlcvideo">天翼特殊接入</td>
                  <td height="18" colspan="3" align="left"><input name="ckextend" type="checkbox" id="ckextend" value="0" onClick="checkclick('outcfg_frm','ckextend');" /></td>
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
<%outHxhtCfgEx();%>
</body>
</html>
