<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBasic</title>
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
<script language="javascript" type="text/javascript" src="./jsmain/camera.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/lensex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
<script type="text/JavaScript" language="javascript" src="./js/hsvbtn.js"></script>
</head>
<script language="javascript">

//判断输入字符的类型  
function CharMode(iN){  
	if (iN>=48 && iN <=57) //数字  
		return 1;  
	if (iN>=65 && iN <=90) //大写  
		return 2;   
	if (iN>=97 && iN <=122) //小写  
		return 4;  
	else  
		return 8;   
}  
 
//返回字符组合模式
function checkNo(sPW){  
	Modes=0;  
	for (i=0;i<sPW.length;i++){  
		//密码模式  
		Modes|=CharMode(sPW.charCodeAt(i));  
	}  
	return Modes;  
} 

var senasd, sen;
function Checkfrm(){


	if($s("imagenametype").value == 1 && $s("prefix").value == "")
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENAMENULL, 3E3, 1);
		return false;
	}
	if(checkNo($s("prefix").value) >=8)
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENOERROR, 3E3, 1);
		return false;
	}

	setTimeout(do_submit,0);
	return false;
}
function init(){
	if(parseInt($("smartfacebw").value)==1){
		$("laExpansioncoefficient_div").style.display="none";
		$("imgsDIV").style.display="none";
		$("zhuapaiDIV").style.display="";
		$("laFaceImageNameType_div").style.display="none";
		$("OriginalQuality_kz").style.display="none";
		$("FastCaptureFrames_kz").style.display="none";
		$("IntervalTime_kz").style.display="none";
		$("rlbkDIV").style.display="";
		$("EveryNthFrame_kz").style.display='none';
		$("divHuman").style.display='none';
			snapmodekz();
	}else if(parseInt($("smartfacebw").value)==0){
			changenametype();
        	snapmodekz();
        	imagetypekz();
	}

	if(parseInt($("FaceAttribute").value)==1){
		$("divHuman").style.display='';
	}
	ChangeLanguage('../xml/videomask.xml', m_szLanguage);
	initChannel();


	if($("privateupload").value == 1){
		$("serviceup").style.display='';
	}else{
		$("serviceup").style.display='none';
	}
	if(typeof(senasd)!="object")senasd=new Slider($("inam"), $("inas"), {steps:10, wheel:!0, onChange:function(a){$("inas").setProperty("title", a); sen=a; $("inav").setProperty("text",sen); $("sensitivity").value=sen}});
	

	var nsen=parseInt($("sensitivity").value);
	if(isNaN(nsen)) nsen=0;
	senasd.set(nsen);
	
	//if(nsen == -1){$("show_Sensitivity").style.display="none;";}


	
	$("btnSave").addEvent("click", Checkfrm);
	$("laOLdds").addEvent("click", Checkfrm1);
}

function shttpupt () {
	if($("privateupload").value == 1){
		$("serviceup").style.display='';
	}else{
		$("serviceup").style.display='none';
	}
}

function snapmodekz(){
	if($("snapmode").value == 0){
		$("BeatTimes_kz").style.display='';
		$("FastCaptureFrames_kz").style.display='none';
		$("IntervalTime_kz").style.display='none';
		$("EveryNthFrame_kz").style.display='none';
		$("FastCaptureFrames_kz1").style.display='none';
	}else if($("snapmode").value == 1){
		$("BeatTimes_kz").style.display='none';
		$("FastCaptureFrames_kz").style.display='';
		$("IntervalTime_kz").style.display='none';
		$("EveryNthFrame_kz").style.display='none';
			$("FastCaptureFrames_kz1").style.display='none';
	}else if($("snapmode").value == 2){
		$("BeatTimes_kz").style.display='none';
		$("FastCaptureFrames_kz").style.display='none';
		$("IntervalTime_kz").style.display='';
		$("EveryNthFrame_kz").style.display='none';
			$("FastCaptureFrames_kz1").style.display='none';
	}else if($("snapmode").value == 3){
		$("BeatTimes_kz").style.display='none';
		$("FastCaptureFrames_kz").style.display='none';
		$("IntervalTime_kz").style.display='none';
		$("EveryNthFrame_kz").style.display='';
		$("FastCaptureFrames_kz1").style.display='none';
	}else if($("snapmode").value == 4){
		$("BeatTimes_kz").style.display='none';
		$("FastCaptureFrames_kz").style.display='none';
		$("IntervalTime_kz").style.display='none';
		$("EveryNthFrame_kz").style.display='none';
		$("FastCaptureFrames_kz1").style.display='';

	}

}

function imagetypekz(){
	if($("imagetype").value==0){
		$("FaceQuality_kz").style.display='';
		$("OriginalQuality_kz").style.display='none';
	}else if($("imagetype").value==1){
		$("FaceQuality_kz").style.display='none';
		$("OriginalQuality_kz").style.display='';
	}else{
	    $("FaceQuality_kz").style.display='';
		$("OriginalQuality_kz").style.display='';
	}
}

function changenametype(){
	if($s("imagenametype").value == 0){
		$s("divPrefix").style.display='none';
	}else{
		$s("divPrefix").style.display='';
	}
}

function Checkfrm1(){
	
	$("isDefault").value = 1;
	setTimeout(do_submit,0);
	return false;
}


</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/netSmartFaceCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab"  style="display:none;">
		<ul>
			<li class="linow"><LABEL id="smartface"></LABEL></li>
			<li class="laHelp" style="display:none;"></a></li> 
		</ul>
	</div>
	<div class="maintab"style="height: 550px;">
        <div id="div_set" class="div_set">

			
			<ul id="show_Enable">
				<li class="tb1"><LABEL  id="laFaceEnable"></LABEL></li>
				<li class="tb2"></li>
				<li class="lef">
				<input name="cksmartface" type="checkbox" id="cksmartface" onClick="checkClick('','cksmartface')" value="checkbox" />
				</li>
			</ul><br />
			<!--发布时间1-->
		<div style="margin-left: 130px;">
			<tr>
	  			<td width="136" height="19" align="right" id="Tdtime1"><LABEL id="laRecordTime1">1</LABEL></td>
	  			<td align="left"><input name="ckevery" type="checkbox" id="ckevery" value="checkbox" onClick="checkClick('record_frm','ckevery')" />
				<input name="begh1" type="text" class="textmin" id="begh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				:
				<input name="begm1" type="text" class="textmin" id="begm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				--
				<input name="endh1" type="text" class="textmin" id="endh1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				:
				<input name="endm1" type="text" class="textmin" id="endm1" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
			</tr><br /><br />
		</div>
			<!--发布时间2-->
		<div style="margin-left: 130px;">
			<tr>
	  			<td height="25" align="right" id="Tdtime2"><LABEL id="laRecordTime2">2</LABEL></td>
	  			<td align="left"><input name="ckevery2" type="checkbox" id="ckevery2" value="checkbox" onClick="checkClick('record_frm','ckevery2')" />
	  			<input name="begh12" type="text" class="textmin" id="begh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				:
				<input name="begm12" type="text" class="textmin" id="begm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				--
				<input name="endh12" type="text" class="textmin" id="endh12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" />
				:
				<input name="endm12" type="text" class="textmin" id="endm12" onKeyPress="event.returnValue=isDigit();" size="2" maxlength="2" /></td>
			</tr><br /><br />
 		</div>
 			<!--灵敏度-->
		<div style="height: 20px;width:700px;margin-left: 50px;">
			<ul id="show_Sensitivity">
				<div style="width: 80px;height: 40px;margin-left: 80px;"><LABEL  id="laSensitivity"></LABEL></div>
				<div style="margin-top: -75px;margin-left:210px;width: 210px;"><li class="tb2"></li>
				<li class="lefsx">
					<div id='inam' class="sax">
						<div id='inas' class="skx"></div>
					</div>
					<div id="inav" class="num"></div>
				</li>
				<li class="rig"><input name="sensitivity" id="sensitivity" type="hidden" value=""></li>
			</div>
			</ul>
		</div>

				<!--抓拍模式-->
		<div id="zhuapaiDIV" style="margin-left: 130px;margin-top: 10px">
			<div style="width: 130px;" > <LABEL id="laSnapmode"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;"  >
				<select name="snapmode" id="snapmode"onclick="snapmodekz();" style="width:150px;border:solid 1px #000;">
					<option id="Snapmode0" value="0" selected="selected"></option>
					<option id="Snapmode1" value="1" ></option>
					<option id="Snapmode2" value="2" ></option>
					<option id="Snapmode3" value="3" ></option>
					<option id="Snapmode4" value="4" ></option>
				</select>
			</div>
		</div>
		<!--实时抓拍跟踪帧数-->
		<div id="divTrackframe" style="margin-left: 130px;margin-top:17px; display: none">
			<div style="width: 130px;" ><LABEL id="laTrackframe"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="trackframe" type="number" class="text" id="trackframe" maxlength="4" /></td>
				<td align="left" id="">&nbsp;(1~1500)</td>
			</div>
		</div>
			<!--抓拍次数-->
		<div id="BeatTimes_kz" style="margin-left: 130px;margin-top:17px;display: none">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="BeatTimes"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;">
				<select name="frequency" id="frequency" style="width:150px;border:solid 1px #000;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
				</select>
			</div>
		</div>
		
			<!--快速抓拍帧数-->
		<div id="FastCaptureFrames_kz" style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="FastCaptureFrames"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="Fast" type="text" class="text" id="Fast"  /></td>
			<td align="left" id="">&nbsp;(1~1500)</td>
			</div>
		</div>
			<!--快速抓拍帧数1-->
		<div id="FastCaptureFrames_kz1" style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="EveryNthFrame"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="Fast1" type="text" class="text" id="Fast1"  /></td>
			<td align="left" id="">&nbsp;(1~1500)</td>
			</div>
		</div>
		


		<!--间隔帧数-->
			<div id="EveryNthFrame_kz"  style="margin-left: 130px;margin-top:17px;">
				<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="EveryNthFrame"> </LABEL></div>
				<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="IntervalFrame" type="text" class="text" id="IntervalFrame"  /></td>
				<td align="left" id="">&nbsp;(1~1500)</td>
				</div>
			</div>


		<!--间隔时间-->
		<div id="IntervalTime_kz"  style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="IntervalTime"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="IntervalTimeID" type="text" class="text" id="IntervalTimeID"  /></td>
			<td align="left" id="">&nbsp;(1~30s)</td>
			</div>
		</div>

 			<!--人脸识别像素-->
 		<div style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="renlanzx"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="frmintr" type="text" class="text" id="frmintr" maxlength="8" /></td>
				<td align="left" id="">&nbsp;(30~300)</td>
			</div>	
		</div>

			<!--人脸周边区域扩展系数-->
		<div id="laExpansioncoefficient_div" style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;" ><LABEL id="laExpansioncoefficient"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="exnumber" type="text" class="text" id="exnumber" maxlength="3" /></td>
				<td align="left" id="">&nbsp;(0~10)</td>
			</div>
		</div>
			
				<!--人脸曝光模式-->
		<div id="rlbkDIV" style="margin-left: 130px;margin-top: 18px; display: none" >
			<div style="width: 130px;" > <LABEL id="laRenlianBaoGuang"> </LABEL> </div>
			<div style="margin-top: -20px;margin-left:137px;">
				<select name="renlianbg" id="renlianbg"style="width:150px;border:solid 1px #000;">
					<option id="laRenlianBaoGuang1" value="0"></option>
					<option id="laRenlianBaoGuang2" value="1"></option>
					<option id="laRenlianBaoGuang3" value="2"></option>
					<option id="laRenlianBaoGuang4" value="3"></option>
				</select>
			</div>
		</div><br />
				<!--背光补偿-->
		<div style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laBackB"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;">
				<select name="backlight" id="backlight"style="width:150px;border:solid 1px #000;">
					<option id="opSensorType222" value="0"></option>
					<option id="opSensorType111" value="1"></option>
				</select>
			</div>
		</div>
				<!--人脸跟踪-->
		<div style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laRenLianGenZong"></LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;">
				<select name="renliangz" id="renliangz"style="width:150px;border:solid 1px #000;">
					<option id="laRenLianGenZong0" value="0"></option>
					<option id="laRenLianGenZong1" value="1"></option>
					<!--<option id="laRenLianGenZong2" value="2"></option>-->
				</select>
			</div>
		</div>
				<!--FTP上传-->
		<div style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laFTPsc"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;">
				<select name="ftpuplo" id="ftpuplo"style="width:150px;border:solid 1px #000;">
					<option id="opSensorType2" value="0"></option>
					<option id="opSensorType1" value="1"></option>
				</select>
			</div>
		</div>
				<!--私有协议上传-->
		<div style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laSHTTPu"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;"  >
				<select name="privateupload" id="privateupload"onclick="shttpupt();" style="width:150px;border:solid 1px #000;">
					<option id="opSensorType22" value="0" selected="selected"></option>
					<option id="opSensorType11" value="1" ></option>
				</select>
			</div>
		</div>
				<!--服务器地址-->
		<div id="serviceup" style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laSHTTPu1"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;" ><input name="clientaddr" type="text" class="text" id="clientaddr" maxlength="32" /></div>
			<div style="width: 130px;margin-top: 8px;" > <LABEL id="laSHTTPu2"></LABEL></div>
			<div style="margin-top: -12px;margin-left: 137px;" ><input name="clientport" type="text" class="text" id="clientport" maxlength="32" /></div>
		</div>

				<!--图片上传格式-->
		<div id="imgsDIV" style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laImageType"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;"  >
				<select name="imagetype" id="imagetype"onclick="imagetypekz();" style="width:150px;border:solid 1px #000;">
					<option id="imagetype0" value="0" selected="selected"></option>
					<option id="imagetype1" value="1" ></option>
                    <option id="imagetype2" value="2" ></option>
				</select>
			</div>
		</div>

		<!--人脸质量-->
		<div id="FaceQuality_kz" style="margin-left: 130px;margin-top:17px;display: none">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="FaceQuality"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="FaceQualityID" type="text" class="text" id="FaceQualityID" /></td>
			<td align="left" id="">&nbsp;(1~99)</td>
			</div>
		</div>

		<!--原图质量-->
		<div id="OriginalQuality_kz" style="margin-left: 130px;margin-top:17px;">
			<div style="width: 130px;"  id="Tdfrmintr"><LABEL id="OriginalQuality"> </LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="OriginalQualityID" type="text" class="text" id="OriginalQualityID" /></td>
			<td align="left" id="">&nbsp;(1~99)</td>
			</div>
		</div>

				<!--图片上传格式-->
		<div id="laFaceImageNameType_div" style="margin-left: 130px;margin-top: 17px;">
			<div style="width: 130px;" > <LABEL id="laFaceImageNameType"></LABEL></div>
			<div style="margin-top: -20px;margin-left: 137px;"  >
				<select name="imagenametype" id="imagenametype" onclick="changenametype();" style="width:150px;border:solid 1px #000;">
					<option id="imagenametype0" value="0" selected="selected"></option>
					<option id="imagenametype1" value="1" ></option>
				</select>
			</div>
		</div>  
        
			<!--自定义前缀-->
 		<div style="margin-left: 130px;margin-top:17px;display: none" id="divPrefix">
			<div style="width: 130px;" ><LABEL id="laDefinedPrefix"></LABEL></div>
			<div style="margin-top: -20px;margin-left:137px;"><td align="left" valign="top"><input name="prefix" type="text" class="text" id="prefix" maxlength="15" /></td>
				<td align="left" id=""><LABEL id="laDefinedPrefixTip"></LABEL></td>
			</div>	
		</div>
		<!--人脸属性检测-->
			<div id="divHuman" style="margin-left: 130px;margin-top: 17px;display: none">
        			<div style="width: 130px;" > <LABEL id="laHuman"></LABEL></div>
        			<div style="margin-top: -20px;margin-left:137px;">
        				<select name="FaceAttributeEnable" id="FaceAttributeEnable"style="width:150px;border:solid 1px #000;">
        					<option id="laRenLianGenZong0" value="0"></option>
        					<option id="laRenLianGenZong1" value="1"></option>
        					<!--<option id="laRenLianGenZong2" value="2"></option>-->
        				</select>
        			</div>
        		</div>
        
   </div>
		<input type="hidden" value="0" 	id="isDefault"  	name="isDefault" >
		<input type="hidden" value="0" 	id="smartfacebw"  	name="smartfacebw" >
		<input type="hidden" value="0" 	id="FaceAttribute"  	name="FaceAttribute" >
</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl166">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true"  href="javascript:;" id="laOLdds"><LABEL id="laOLd09"></LABEL></a>	
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display: none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</div>
</form>
<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; top:180px; left:expression((document.body.offsetWidth-400)/2); " id="divProgress">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center bgColor=#ffffe7 border=1>
  <TR>
  <TD align=middle height=56 style="padding-top:12px;">
  <div id="progress" style="text-align:left;"></div>
  <div id="divAlert" style="text-align:center; padding-top:5px;"></div>
  </TD></TR>
  </TABLE>
</div>
<%outSmartFaceCfgEx();%>
</body>
</html>
