<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
    setTimeout(do_submit,0);
	return false;
}
function dianji(){
	if($("PicUploadMode").value==0){
			$("chart").style.display='';
			$("chart1").style.display='none';
	}else if($("PicUploadMode").value==1){
			$("chart").style.display='none';
			$("chart1").style.display='';
	}else if($("PicUploadMode").value==2){
     			$("chart").style.display='';
     			$("chart1").style.display='';
     	}
}
function init(){
	dianji();
	ChangeLanguage('../xml/parameter.xml', m_szLanguage);
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/setCarCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain" style="margin-left: 20px">
				<table width="650" cellpadding="5" cellspacing="1">

			    <tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laSwitch"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">

					 <select name="CarEnable" id="CarEnable">
						<option id="laClose" value="0"></option>
						<option id="laOpen" value="1"></option>
					 </select>
				  </td>
			    </tr>

				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laSendpicture"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">

				   <select name="CAR_FTP_Eable" id="CAR_FTP_Eable">
						<option id="laClose" value="0"></option>
						<option id="laOpen" value="1"></option>
					 </select>
				  </td>
			  	</tr>

				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laTriggermode"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
				 	 <select name="DetectMode" id="DetectMode">
						<option id="DetectMode1" value="0"></option>
						<option id="DetectMode2" value="1"></option>
						<option id="DetectMode3" value="2"></option>
 					 </select>
				  </td>
				</tr>

				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laEnvironment"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
				 	 <select name="DetectAspect" id="DetectAspect">
						<option id="Environment1" value="1"></option>
						<option id="Environment2" value="2"></option>
						<option id="Environment3" value="3"></option>
 					 </select>
				  </td>
				</tr>

				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laImageupload"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
					 <select name="PicUploadMode" id="PicUploadMode" onclick="dianji()">
						<option id="Imageupload1" value="0"></option>
						<option id="Imageupload2" value="1"></option>
						<option id="Imageupload3" value="2"></option>
					 </select>
				  </td>
				</tr>

				  <tr id="chart" style="display: none">
					  <td height="18" align="right" valign="middle"><LABEL id="lagraphs"></LABEL></td>
					  <td height="18" align="left" valign="middle" colspan="2"><input name="BigPicQuality" type="text" class="text" id="BigPicQuality"  />(0~99)</td>
				  </tr>

				  <tr id="chart1" style="display: none">
					  <td height="18" align="right" valign="middle"><LABEL id="lagraphs1"></LABEL></td>
					  <td height="18" align="left" valign="middle" colspan="2"><input name="LittlePicQuality" type="text" class="text" id="LittlePicQuality"  />(0~99)</td>
				  </tr>


				  <tr>
					  <td height="18" align="right" valign="middle"><LABEL id="laMin"></LABEL></td>
					  <td height="18" align="left" valign="middle" colspan="2"><input name="CarPlateMinSize" type="text" class="text" id="CarPlateMinSize"  />(80~400)</td>
				  </tr>

				  <tr>
					  <td height="18" align="right" valign="middle"><LABEL id="laMax"></LABEL></td>
					  <td height="18" align="left" valign="middle" colspan="2"><input name="CarPlateMaxSize" type="text" class="text" id="CarPlateMaxSize"  />(80~400)</td>
				  </tr>

				  <tr>
					  <td height="18" align="right" valign="middle"><LABEL id="lainterval"></LABEL></td>
					  <td height="18" align="left" valign="middle" colspan="2"><input name="SamePlateIntervel" type="text" class="text" id="SamePlateIntervel"  />(1~180)<label id="lam"></label></td>
				  </tr>
				<!--<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laDetection"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
				 	 <select name="Detection" id="Detection">
						<option id="Detection1" value="0"></option>
						<option id="Detection2" value="1"></option>
 					 </select>
				  </td>
				</tr>-->

				<tr style="display: none">
				  <td height="22" align="right"><LABEL id="laCity"></LABEL></td>
				  <td height="22" align="left">
				  <select name="province"  id="province">
					 <!--<option id="opCity0" value="0">数字及字母</option>
					 <option id="opCity1" value="1">数字</option>
					 <option id="opCity2" value="2">字母</option>//-->
					 <option id="opCity3" value="3">全国</option>
					 <option id="opCity4" value="4">北京</option>
					 <option id="opCity5" value="5">上海</option>
					 <option id="opCity6" value="6">天津</option>
					 <option id="opCity7" value="7">重庆</option>
					 <option id="opCity8" value="8">黑龙江</option>
					 <option id="opCity9" value="9">吉林</option>
					 <option id="opCity10" value="10">辽宁</option>
					 <option id="opCity11" value="11">内蒙古</option>
					 <option id="opCity12" value="12">河北</option>
					 <option id="opCity13" value="13">山东</option>
					 <option id="opCity14" value="14">山西</option>
					 <option id="opCity15" value="15">安徽</option>
					 <option id="opCity16" value="16">江苏</option>
					 <option id="opCity17" value="17">浙江</option>
					 <option id="opCity18" value="18">福建</option>
					 <option id="opCity19" value="19">广东</option>
					 <option id="opCity20" value="20">河南</option>
					 <option id="opCity21" value="21">江西</option>
					 <option id="opCity22" value="22">湖南</option>
					 <option id="opCity23" value="23">湖北</option>
					 <option id="opCity24" value="24">广西</option>
					 <option id="opCity25" value="25">海南</option>
					 <option id="opCity26" value="26">云南</option>
					 <option id="opCity27" value="27">贵州</option>
					 <option id="opCity28" value="28">四川</option>
					 <option id="opCity29" value="29">陕西</option>
					 <option id="opCity30" value="30">甘肃</option>
					 <option id="opCity31" value="31">宁夏</option>
					 <option id="opCity32" value="32">青海</option>
					 <option id="opCity33" value="33">西藏</option>
					 <option id="opCity34" value="34">新疆</option>
				  </select>
				  </td>
				</tr>
<!--
				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laTrigger"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
						 <select name="Trigger" id="Trigger">
						<option id="Trigger1" value="0"></option>
						<option id="Trigger2" value="1"></option>
						<option id="Trigger3" value="2"></option>
					 </select>
				  </td>
				</tr>

				<tr>
				  <td height="18" align="right" valign="middle"><LABEL id="laProperties"></LABEL></td>
				  <td height="18" align="left" valign="middle" colspan="2">
					 <select name="Properties" id="Properties">
						<option id="Properties1" value="0"></option>
						<option id="Properties2" value="1"></option>
					 </select>
				  </td>
				</tr>
				<tr>
					<td height="22" align="right"><LABEL id="laKKType"></LABEL></td>
					<td height="24" align="left">
				  <span><input name="police" type="checkbox" id="police" value="0" onClick="checkClick('outcfg_frm','police');" /></span><LABEL id="laPolice" ></LABEL>
				  <span class="spvalue"><input name="army" type="checkbox" id="army" value="0" onClick="checkClick('outcfg_frm','army');" /></span><LABEL id="laArmy" ></LABEL>
				  <span class="spvalue"><input name="apolice" type="checkbox" id="apolice" value="0" onClick="checkClick('outcfg_frm','apolice');" /></span><LABEL id="laAPolice"></LABEL>
				  <span class="spvalue"><input name="coach" type="checkbox" id="coach" value="0" onClick="checkClick('outcfg_frm','coach');" /></span><LABEL id="laCoach" ></LABEL> <!--<br /> -->
				<!--  <span><input name="yellow" type="checkbox" id="yellow" value="0" onClick="checkClick('outcfg_frm','yellow');" /></span><LABEL id="laYellow" ></LABEL>
				  <span class="spvalue"><input name="individuation" type="checkbox" id="individuation" value="0" onClick="checkClick('outcfg_frm','individuation');" /></span><LABEL id="laIndividuation"></LABEL>
				  <span class="spvalue"><input name="motorcycle" type="checkbox" id="motorcycle" value="0" onClick="checkClick('outcfg_frm','motorcycle');" /></span><LABEL id="laMotorcycle"></LABEL>
				  <span class="spvalue"><input name="hkmacao" type="checkbox" id="hkmacao" value="0" onClick="checkClick('outcfg_frm','hkmacao');" /></span><LABEL id="laHKMacao"></LABEL>
					</td>
				</tr>
				-->

              </table>
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl166">
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
</form>
<%outCarCfgEx();%>
</body>
</html>
