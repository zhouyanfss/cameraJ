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
function Checkfrm(paramnum){
	
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

function init(){

}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/accessCfgEx"  style="margin:0px; padding:0px;">
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
                  <td width="145" height="21" align="right" id="Tdurl">服务器URL</td>
                  <td height="21" align="left"><input name="rgmip" type="text" class="text" id="rgmip" maxlength="64" /></td>
                </tr>
                <tr>
                  <td height="21" align="right" id="Tdport">服务器端口</td>
                  <td height="21" align="left"><input name="rgmport" type="text" class="text" id="rgmport" onKeyPress="event.returnValue=isDigit();" maxlength="8"  /></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdpuid">PUID</td>
                  <td height="15" align="left"><input name="puid" type="text" class="text" id="puid" maxlength="20"  /></td>
                </tr>
                <tr style="display:none;">
                  <td height="15" align="right" id="Tdguid">GUID</td>
                  <td height="15" align="left"><input name="guid" type="text" class="text" id="guid" value="200803040101010101" maxlength="20"  />
                  X</td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdname">用户名</td>
                  <td height="15" align="left"><input name="username" type="text" class="text" id="username" maxlength="32"  /></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdpsw">密码</td>
                  <td height="15" align="left"><input name="password" type="password" class="text" id="password" maxlength="32" style="width:132px;"/></td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdvimode">视频传输方式</td>
                  <td height="15" align="left">
                    <select name="videomode" class="input2" id="videomode">
                      <option value="0">TCP</option>
                      <option value="1">UDP</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdvpackmode">视频打包方式</td>
                  <td height="15" align="left">
                    <select name="vpackmode" class="input2" id="vpackmode">
                      <option value="0">TS</option>
                      <option value="1">ISMA</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdpicmode">图片上传方式</td>
                  <td height="15" align="left">
                    <select name="pictruemode" class="input2" id="pictruemode">
                      <option value="0">HTTP</option>
                      <option value="1">FTP</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td height="15" align="right" id="Tdrtspupnpport">RTSP映射端口</td>
                  <td height="15" align="left"><input name="rtspupnpport" type="text" class="text" id="rtspupnpport" maxlength="32"  /></td>
                </tr>
                <tr style="display:none;">
                  <td height="15" align="right" id="Tdmode">接入公网方式</td>
                  <td height="15" align="left"><label>
                    <select name="accessmode" class="input2" id="accessmode">
                      <option value="0">固定IP上网</option>
                      <option value="1">ADSL拔号上网</option>
                      <option value="2">路由共享上网</option>
                    </select>
                  X</label></td>
                </tr>
                <tr style="display:none;">
                  <td height="15" align="right" id="Tdrouterip">公网IP</td>
                  <td height="15" align="left"><input name="routerip" type="text" class="text" id="routerip" value="192.168.1.3" maxlength="32"  />
                  X</td>
                </tr>
				 <tr>
                  <td height="15" align="right" id="Tdinfo">相关信息</td>

                  <td height="21" align="left"><textarea name="accessinfo" cols="32" rows="3" disabled class="input_buton_hui_4" id="accessinfo">success</textarea></td>
                </tr>
				</table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl166">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" onClick="Checkfrm(1);">上线</a>
			<a hidefocus="true" href="javascript:;" id="btnSave" onClick="Checkfrm(0)">下线</a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div id="StrNotice" class="divnotice">
		<span style="color:#FF0000; padding-right:12px;">*</span>RTSP映射端口为0时，不映射处理.
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input name="debuginfo" type="hidden" id="debuginfo" value="1">
<input name="sumbittype" type="hidden" id="sumbittype" value="1">
</form>
<%outAccessCfgEx();%>
</body>
</html>
