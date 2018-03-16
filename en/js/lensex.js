// JavaScript Document
var chgsetvideo = 0;
var isAWBTab = 0;
var isExposureTab = 0;
var SliderExChange	= 0;
var mybriSlider, myconSlider, mychrSlider, mysatSlider, myacuSlider, myredSlider, mybluSlider, mygamSlider;
var myawbredSlider, myawbgreenSlider, myawbblueSlider, myblcSlider, myrestSlider, myircfSlider, myagcSlider, myslowSlider, myagcmaxSlider, myirislevelSlider, myircf2Slider;
var myslowshutterSlider, myIRCFSlider, mywdrSlider, mysnrSlider, myfocusSlider;
var myaemaxSlider, myautoagcSlider, myAntiFalseColorSlider, myAutoIRLevelSlider;
var initSNOK	= 0;
function initPage(){
	var devicetype 	= parseInt(getCookies("devicetype"));//0 高清COMS  1 高清CCD  2 标清CMOS  3 标清CCD  4 高清高速球
	try{
		initColor(devicetype);
		initAWB(devicetype);
		initAGC(devicetype);
		initBLC(devicetype);
		initShutter(devicetype);
		initIR(devicetype);
		initOther(devicetype);
		initIris(devicetype);
		initFocus(devicetype);
		initZoom(devicetype);
		initAutoAGC(devicetype);
		initAEMax(devicetype);
		initAEMaxTime(devicetype);
		initIRDetection(devicetype);
		initExposure(devicetype);//3516联动 AGC增益、彩转黑、最大曝光时间，故移到最后
	}catch(e){}
	try{
		setTimeout("SliderExChange	= 1;",1500);	
		setTimeout("initSNOK	= 1;",1500);	
	}catch(e){
		SliderExChange	= 1;
		initSNOK		= 1;
	}
}

function initir(){
	var devicetype 	= parseInt(getCookies("devicetype"));
	try{
		if(parseInt($s("vPwdFreq1").value)>=0){
			$s("setvideoPwdFreq1").style.display	= "";
			hsvctrlSub(1034, 2, 'btnPwdFreq'+$s("vPwdFreq1").value, parseInt($s("vPwdFreq1").value), parseInt($s("vPwdFreq1").value) ,1);
		}else{
			$s("setvideoPwdFreq1").style.display	= "none";	
		}	
	}catch(e){}
	try{
		setTimeout("SliderExChange	= 1;",1500);	
	}catch(e){
		SliderExChange	= 1;
	}
	
}
function initColor(paramtype){
	var flagopen	= 0;
	$s("setColordefault").style.display	= "none";
	$s("StrNotice").style.display		= "";

	$s("TrColorTab").style.display		= "";
	flagopen = initColorSlider(paramtype);
	if(flagopen==1){
		$s("TrColorTitle").style.display	= "";	
		$s("TrColorTab").style.display		= "";	
	}else{
		$s("TrColorTitle").style.display	= "none";	
		$s("TrColorTab").style.display		= "none";	
	}
}
/*
OBJSlider:	控件对象
OBJstr：		控件对象名称字符串
divSlider:	对象容器
objResult：	返回值显示对象
funResult:	回调函数
eventname:	回调事件名称
nmaxVal:	最大值
nminVal:	最小值
ndefVal:	默认值
paramcmd:	操作码
ninterval:	调节幅度
initSlider(agcmaxSlider, 'agcmaxSlider', 'myagcmax', 'stragcmax', snChangeEx, 'initdata', 255, 0, parseInt($s("maximumagc").value), 5304, 3 );
*/
function initSlider(OBJSlider, OBJstr, divSlider, objResult, funResult, eventname, nmaxVal, nminVal, ndefVal, paramcmd, ninterval){
  try{
	OBJSlider=new neverSliderBar(divSlider, eval(funResult), paramcmd, divSlider, objResult, nmaxVal, nminVal, ninterval);
	OBJSlider.sldMax=nmaxVal;
	OBJSlider.sldMin=nminVal;
	OBJSlider.setBtnStyle("sliderBtn");
	OBJSlider.setBtnStyleR("sliderBtnR");
	OBJSlider.setBarStyle("sliderBar");
	OBJSlider.setObjStyle("sliderObj");
	OBJSlider.setObjLStyle("sliderObjL");
	if(ninterval>0) OBJSlider.setIncrement(ninterval);
	//alert(OBJSlider+"-"+OBJstr+"-"+divSlider+"-"+objResult+"-"+funResult+"-"+eventname+"-"+nmaxVal+"-"+nminVal+"-"+ndefVal+"-"+paramcmd+"-"+ninterval);
	OBJSlider.init();
	OBJSlider.setSldPoint(ndefVal);
	snChangeEx(eventname, ndefVal, paramcmd, divSlider, objResult, nmaxVal, nminVal, ninterval);
	return OBJSlider;
  }catch(e){}	
}

function initAWB(paramtype){
	var flagopen	= 0;
	if(parseInt($("vAWBRed").value)>=0){$("liWBRed").style.display	= "";flagopen = 1;
	}else{$("liWBRed").style.display = "none";}
	if(parseInt($("vAWBGreen").value)>=0){$("liWBGre").style.display	= "";flagopen = 1;
	}else{$("liWBGre").style.display = "none";}
	if(parseInt($("vAWBBlue").value)>=0){$("liWBBlu").style.display	= "";flagopen = 1;
	}else{$("liWBBlu").style.display = "none";}
	isAWBTab	= flagopen;
	if(parseInt($("vAutoAWB").value)>=0){
		$("DivAWB").style.display	= "";flagopen = 1;
		hsvctrlSub(1010, 1, 'btnAWB', 0, parseInt($("vAutoAWB").value) ,1);
	}else{$("DivAWB").style.display	= "none";}
	if(flagopen==1){$("TrAWBTable").style.display = "";
	}else{$("TrAWBTable").style.display = "none";}
}
function initAGC(paramtype){
	var flagopen	= 0;
	if(parseInt($s("vAGCLevel").value)>=0){
		if(parseInt($s("vAutoAGC").value)==0){$s("liGCLevel").style.display	= "none";
		}else{$s("liGCLevel").style.display	= "";flagopen	= 1;}
	}else{$s("liGCLevel").style.display	= "none";}
	if(parseInt($s("vAutoAGC").value)>=0){
		$s("DivAGC").style.display	= "";flagopen = 1;
		hsvctrlSub(1014, 1, 'btnAGC', 0, parseInt($s("vAutoAGC").value) ,1);
	}else{$s("DivAGC").style.display = "none";}
	if(flagopen==1){$s("TrAGCTable").style.display	= "";
	}else{$s("TrAGCTable").style.display = "none";}
}
function initBLC(paramtype){
	var flagopen	= 0;
	if(parseInt($s("vBLCLevel").value)>=0){
		$s("liBLCLevel").style.display = ""; flagopen = 1;
	}else{$s("liBLCLevel").style.display = "none";}
	if(parseInt($s("vAutoBLC").value)>=0){
		$s("DivBLC").style.display	= ""; flagopen	= 1;
		hsvctrlSub(1016, 1, 'btnBLC', 0, parseInt($s("vAutoBLC").value) ,1);
	}else{$s("DivBLC").style.display	= "none";}
	if(flagopen==1){$s("TrBLCTable").style.display	= "";
	}else{$s("TrBLCTable").style.display = "none";}
}
function initExposure(paramtype){
	var flagopen	= 0;
	if((paramtype==4||paramtype==8)&&parseInt($s("vAutoExposure").value)>0){
		flagopen	= 1;
		$s("setvideoAutoExp").style.display	= "";
		$s("selAutoExposure").value	= parseInt($s("vAutoExposure").value);
	}else{
		$s("setvideoAutoExp").style.display	= "none";	
	}
	if(paramtype!=4&&paramtype!=8&&parseInt($s("vExposureTime").value)>=0){
		flagopen	= 1;
		$s("setvideoExp").style.display	= "";
		$s("selExposureTime").value	= parseInt($s("vExposureTime").value);
	}else{
		$s("setvideoExp").style.display	= "none";	
	}
	isExposureTab	= flagopen;
	if(parseInt($s("vAutoExposure").value)>=0){
		flagopen	= 1;
		$s("DivExposure").style.display	= "";
		hsvctrlSub(1020, 1, 'btnAutoExp', 0, parseInt($s("vAutoExposure").value) ,1);
	}else{
		$s("DivExposure").style.display	= "none";	
	}
	if(flagopen==1){
		$s("TrExposureTable").style.display	= "";
	}else{
		$s("TrExposureTable").style.display	= "none";	
		return false;
	}
}
function initShutter(paramtype){
	var flagopen	= 0;
	if(parseInt($s("vAutoShutter").value)>=0){
		flagopen	= 1;
		$s("setvideoShutter").style.display	= "";
		hsvctrlSub(1022, 1, 'btnAutoShutter', 0, parseInt($s("vAutoShutter").value) ,1);
	}else{
		$s("setvideoShutter").style.display	= "none";	
	}
	if(parseInt($s("vShutterSpeed").value)>=0){
		flagopen	= 1;
		if(parseInt($s("vAutoShutter").value)==0){
			$s("setvideoAutoShutter").style.display	= "none";
		}else{
			$s("setvideoAutoShutter").style.display	= "";
		}
		$s("selShutterSpeed").value	= parseInt($s("vShutterSpeed").value);
	}else{
		$s("setvideoAutoShutter").style.display	= "none";	
	}
	if(parseInt($s("vSlowShutter").value)>=0){
		$s("setvideoSlowShutter").style.display	= ""; flagopen	= 1;
		hsvctrlSub(1025, 1, 'btnSlowShutter', 0, parseInt($s("vSlowShutter").value) ,1);
		if(parseInt($s("vSlowShutterLevel").value)>=0){
			if(parseInt($s("vSlowShutter").value)==0){$s("liSSHTLevel").style.display	= "none";
			}else{$s("liSSHTLevel").style.display = "";}
		}else{$s("liSSHTLevel").style.display = "none";}
	}else{$s("setvideoSlowShutter").style.display = "none";}
	
	if(flagopen==1){
		$s("TrShutterTable").style.display	= "";
	}else{
		$s("TrShutterTable").style.display	= "none";	
	}
}
function initIR(paramtype){
	var flagopen = 0;
	if(parseInt($s("vIRCFMode").value)>=0){
		flagopen	= 1;
		$s("setvideoIRCFMode").style.display	= "";
		hsvctrlSub(1028, 2, 'btnIRCFMode'+$s("vIRCFMode").value, parseInt($s("vIRCFMode").value), parseInt($s("vIRCFMode").value) ,1);
	}else{
		$s("setvideoIRCFMode").style.display	= "none";	
	}	
	if(parseInt($s("vIRLightType").value)>=0){
		flagopen	= 1;
		$s("setvideoIRLightType").style.display	= "";
		hsvctrlSub(1029, 3, 'btnIRLightType'+$s("vIRLightType").value, parseInt($s("vIRLightType").value), parseInt($s("vIRLightType").value) ,1);
	}else{
		$s("setvideoIRLightType").style.display	= "none";	
	}
	if(parseInt($s("vIRCFLevel").value)>=0){
		$s("divIRCItem").style.display = ""; flagopen = 1;
	}else{$s("divIRCItem").style.display = "none";}
	if(parseInt($s("btimevalue").value)>=0){
		flagopen	= 1;
		$s("setvideoIRTimeControl").style.display	= "";
	}else{
		$s("setvideoIRTimeControl").style.display	= "none";	
	}
	if(parseInt($s("btimeshutter").value)>=0){
		$s("TrTimeShutter").style.display	= "";
	}else{
		$s("TrTimeShutter").style.display	= "none";	
	}
	
	if(flagopen==1){
		$s("TrIRTable").style.display	= "";
	}else{
		$s("TrIRTable").style.display	= "none";	
	}
}
function initOther(paramtype){
	var flagopen = 0;
	if(parseInt($s("vMirror").value)>=0){
		flagopen	= 1;
		$s("btnMirror").style.display	= "";
		hsvctrlSub(1031, 1, 'btnMirror', 0, parseInt($s("vMirror").value) ,1);
	}else{
		$s("btnMirror").style.display	= "none";
	}
	if(parseInt($s("vFlip").value)>=0){
		flagopen	= 1;
		$s("btnFlip").style.display	= "";
		hsvctrlSub(1032, 1, 'btnFlip', 0, parseInt($s("vFlip").value) ,1);
	}else{
		$s("btnFlip").style.display	= "none";
	}
	if(parseInt($s("vAutoFlip").value)>=0){
		flagopen	= 1;
		$s("btnAutoFlip").style.display	= "";
		hsvctrlSub(1033, 1, 'btnAutoFlip', 0, parseInt($s("vAutoFlip").value) ,1);
	}else{
		$s("btnAutoFlip").style.display	= "none";
	}
	if(flagopen==1){
		$s("setvideoMirrorFlip").style.display	= "";
	}else{
		$s("setvideoMirrorFlip").style.display	= "none";	
	}
	
	if(parseInt($s("vPwdFreq1").value)>=0){
		flagopen	= 1;
		$s("setvideoPwdFreq1").style.display	= "";
		hsvctrlSub(1034, 2, 'btnPwdFreq'+$s("vPwdFreq1").value, parseInt($s("vPwdFreq1").value), parseInt($s("vPwdFreq1").value) ,1);
		if(paramtype==15){
			chgaemaxtime(parseInt($s("vPwdFreq1").value));
		}
	}else{
		$s("setvideoPwdFreq1").style.display	= "none";	
	}	
	if(parseInt($s("vPwdFreq2").value)>=0){
		flagopen	= 1;
		$s("setvideoPwdFreq2").style.display	= "";
		hsvctrlSub(1035, 3, 'btnPwdFreq'+(parseInt($s("vPwdFreq2").value)+2), parseInt($s("vPwdFreq2").value), parseInt($s("vPwdFreq2").value) ,1);
	}else{
		$s("setvideoPwdFreq2").style.display	= "none";	
	}

	if(parseInt($s("vCTB").value)>=0){
		flagopen	= 1;
		$s("setvideoCTB").style.display	= "";
		hsvctrlSub(1036, 1, 'btnCTB', 0, parseInt($s("vCTB").value) ,1);
	}else{
		$s("setvideoCTB").style.display	= "none";	
	}

	if(parseInt($s("vWDRLevel").value)>=0){flagopen	= 1;}
	if(parseInt($s("vWDRLevel2").value)>0 && parseInt($s("vWDRLevel2").value)<=3){
		flagopen	= 1;
		$s("btnWDR" + $s("vWDRLevel2").value).className	= "";
		$s("btnWDR" + $s("vWDRLevel2").value).className	= "btn2";
	}
	if(parseInt($s("vWDR").value)>=0){
		flagopen	= 1;
		$s("setvideoWDR").style.display	= "";
		hsvctrlSub(1037, 1, 'btnWDR', 0, parseInt($s("vWDR").value) ,1);
	}else{
		$s("setvideoWDR").style.display	= "none";	
	}

	if(parseInt($s("vLowLight").value)>=0){
		flagopen	= 1;
		$s("setvideoLowLightTitle").style.display	= "";
		$s("setvideoLowLight").style.display		= "";
		$s("selLowLight").value		= $s("vLowLight").value;
	}else{
		$s("setvideoLowLightTitle").style.display	= "none";	
		$s("setvideoLowLight").style.display	= "none";	
	}
	
	if(parseInt($s("vImageMode").value)>=0){
		flagopen	= 1;
		$s("setvideoImageMode").style.display	= "";
		hsvctrlSub(1040, 2, 'btnImageMode'+$s("vImageMode").value, parseInt($s("vImageMode").value), parseInt($s("vImageMode").value) ,1);
	}else{
		$s("setvideoImageMode").style.display	= "none";	
	}	
	if(parseInt($s("vLSC").value)>=0){
		flagopen	= 1;
		$s("setvideoLSC").style.display	= "";
		hsvctrlSub(1048, 1, 'btnLSC', 0, parseInt($s("vLSC").value) ,1);
	}else{
		$s("setvideoLSC").style.display	= "none";
	}
	if(parseInt($s("v2DNR").value)>=0){
		flagopen	= 1;
		$s("setvideo2DNR").style.display	= "";
		hsvctrlSub(1065, 1, 'btn2DNR', 0, parseInt($s("v2DNR").value) ,1);
	}else{
		$s("setvideo2DNR").style.display	= "none";
	}
	if(parseInt($s("v3DNR").value)>=0){
		flagopen	= 1;
		$s("setvideo3DNR").style.display	= "";
		hsvctrlSub(1049, 1, 'btn3DNR', 0, parseInt($s("v3DNR").value) ,1);
	}else{
		$s("setvideo3DNR").style.display	= "none";
	}
	if(parseInt($s("v3DNRLevel").value)>0 && parseInt($s("v3DNRLevel").value)<=3){
		flagopen	= 1;
		$s("btn3DNR" + $s("v3DNRLevel").value).className	= "";
		$s("btn3DNR" + $s("v3DNRLevel").value).className	= "btn2";
	}
	if(parseInt($s("vSmartNR").value)>=0){
		flagopen	= 1;
		$s("setvideoSmartNR").style.display	= "";
		hsvctrlSub(1051, 1, 'btnSmartNR', 0, parseInt($s("vSmartNR").value) ,1);
	}else{
		$s("setvideoSmartNR").style.display	= "none";
	}
	if(parseInt($s("vSmartNRLevel").value)>=0){flagopen	= 1;}
	
	
//20130306
	if(parseInt($s("vantifogging").value)>=0){
		flagopen	= 1;
		$s("setvideoAntiFogging").style.display	= "";
		hsvctrlSub(1059, 1, 'btnAntiFogging', 0, parseInt($s("vantifogging").value) ,1);
	}else{
		$s("setvideoAntiFogging").style.display	= "none";	
	}

	if(parseInt($s("vantifalsecolor").value)>=0){
		$s("liAFCLevel").style.display = ""; flagopen = 1;
	}else{$s("liAFCLevel").style.display = "none";}

	if(parseInt($s("vantitrembling").value)>=0){
		flagopen	= 1;
		$s("setvideoAntiTrembling").style.display	= "";
		hsvctrlSub(1061, 1, 'btnAntiTrembling', 0, parseInt($s("vantitrembling").value) ,1);
	}else{
		$s("setvideoAntiTrembling").style.display	= "none";	
	}

	if(parseInt($s("vrotation").value)>=0){
		flagopen	= 1;
		$s("setvideoRotationTitle").style.display	= "";
		$s("setvideoRotation").style.display		= "";
		$s("selrotation").value		= $s("vrotation").value;
	}else{
		$s("setvideoRotationTitle").style.display	= "none";	
		$s("setvideoRotation").style.display		= "none";	
	}
	
	if(flagopen==1){
		$s("TrOtherTable").style.display	= "";
	}else{
		$s("TrOtherTable").style.display	= "none";	
	}
}
function initIris(paramtype){
	var flagopen = 0;
	if(parseInt($s("vIrisLevel").value)>=0&&(parseInt($s("vAutoIris").value)==1||parseInt($s("vAutoIris").value)<0)){
		$s("DivIrisTab").style.display	= "";
		flagopen	= 1;
	}else{
		$s("DivIrisTab").style.display	= "none";	
	}
	if(parseInt($s("vAutoIris").value)>=0){
		$s("DivIris").style.display	= "";
		flagopen	= 1;
		hsvctrlSub(1041, 2, 'btnIris0', parseInt($s("vAutoIris").value), parseInt($s("vAutoIris").value) ,1);
	}else{
		$s("DivIris").style.display	= "none";	
	}
	if(parseInt($s("vlensshading").value)>=0){$s("DivLensShading").style.display = ""; flagopen = 1;
	}else{$s("DivLensShading").style.display = "none";}
	if(parseInt($s("vautoirisshading").value)>=0){
		$s("DivAutoIrisShading").style.display	= "";
		flagopen	= 1;
	}else{
		$s("DivAutoIrisShading").style.display	= "none";	
	}
	if(flagopen==1){
		$s("TrIrisTable").style.display	= "";
	}else{
		$s("TrIrisTable").style.display	= "none";	
		return false;
	}
	if(paramtype==15){
		$s("btnIris0").value	= HTMLAUTOIRISREVISE;
		$s("btnIris1").value	= HTMLAUTOIRISENABLE;
	}else{
	  if(lanset==0){
		$s("btnIris0").value	= ManualIristxt;
		$s("btnIris1").value	= AutoIristxt;
	  }
	}
}
function initFocus(paramtype){
	var flagopen = 0;
	if(parseInt($s("vFocusLevel").value)>=0){
		$s("liFocusLevel").style.display = ""; flagopen = 1;
	}else{$s("liFocusLevel").style.display = "none";}
	if(parseInt($s("vAutoFocus").value)>=0){
		$s("DivFocus").style.display	= "";
		flagopen	= 1;
		hsvctrlSub(1043, 1, 'btnFocus', 0, parseInt($s("vAutoFocus").value) ,1);
	}else{$s("DivFocus").style.display	= "none";}
	if(flagopen==1){$s("TrFocusTable").style.display = "";
	}else{$s("TrFocusTable").style.display = "none";}
}

function initZoom(paramtype){
	var flagopen = 0;
	if(parseInt($s("vZoomSpeed").value)>=0){
		flagopen	= 1;
		$s("setvideoZoomSpeed").style.display	= "";
		hsvctrlSub(1045, 2, 'btnZoomSpeed'+$s("vZoomSpeed").value, parseInt($s("vZoomSpeed").value), parseInt($s("vZoomSpeed").value) ,1);
	}else{
		$s("setvideoZoomSpeed").style.display	= "none";
	}
	
	if(parseInt($s("vAutoPTZSpeed").value)>=0){
		flagopen	= 1;
		$s("setvideoPTZSpeed").style.display	= "";
		hsvctrlSub(1046, 1, 'btnAutoPTZSpeed', 0, parseInt($s("vAutoPTZSpeed").value) ,1);
	}else{
		$s("setvideoPTZSpeed").style.display	= "none";
	}
	
	if(flagopen==1){
		$s("TrZoomTable").style.display	= "";
	}else{
		$s("TrZoomTable").style.display	= "none";
		return false;
	}
}
function initAEMax(paramtype){
	var flagopen	= 0;
	if(parseInt($s("maximumae").value)>=0){
		$s("liAEMaxLevel").style.display = ""; flagopen = 1;
	}else{$s("liAEMaxLevel").style.display = "none";}

	if(parseInt($s("vmaximumae").value)>=0){
		$s("DivAEMax").style.display = ""; flagopen = 1;
		hsvctrlSub(1053, 1, 'btnAEMax', 0, parseInt($s("vmaximumae").value) ,1);
	}else{$s("DivAEMax").style.display = "none";}

	if(flagopen==1){$s("TrAEMaxTable").style.display = "";
	}else{$s("TrAEMaxTable").style.display = "none";}
}
function initAEMaxTime(paramtype){
	if(parseInt($s("vmaxaetime").value)>=0){
		$s("selAEMaxTime").value	= $s("vmaxaetime").value;
		$s("TrAEMaxTimeTable").style.display	= "";
	}else{
		$s("TrAEMaxTimeTable").style.display	= "none";	
		return false;
	}
}
function initAutoAGC(paramtype){
	var flagopen	= 0;
	if(parseInt($s("maximumagc").value)>=0){
		$s("liAutoAGCLevel").style.display = ""; flagopen = 1;
	}else{$s("liAutoAGCLevel").style.display = "none";}
	if(parseInt($s("vmaximumagc").value)>=0){
		$s("DivAutoAGC").style.display = ""; flagopen = 1;
		hsvctrlSub(1055, 1, 'btnAutoAGC', 0, parseInt($s("vmaximumagc").value) ,1);
	}else{$s("DivAutoAGC").style.display = "none";}

	if(flagopen==1){$s("TrAutoAGCTable").style.display = "";
	}else{$s("TrAutoAGCTable").style.display = "none";}

}
function initIRDetection(paramtype){
	if(parseInt($s("virdetectionmode").value)>=0){
		$s("selIRDetectionMode").value	= $s("virdetectionmode").value;
		$s("TrIRDetectionModeTable").style.display	= "";
	}else{
		$s("TrIRDetectionModeTable").style.display	= "none";	
	}
	if(parseInt($s("vautodetection").value)>=0){$s("liIRAutoLevel").style.display = "";}
	if(parseInt($s("virdetection").value)>=0){
		$s("selIRDetection").value	= $s("virdetection").value;
	}
	$s("TrAutoDetection").style.display = "none";
	$s("TrTimeDetection").style.display = "none";
	$s("TrIRDetection").style.display 	= "none";
	$s("btimevalue").value	= "1";

	//红外机器输出控制
	if(parseInt($s("virioicr").value)>=0){	//ICR控制
		$s("selIRIOICR").value	= $s("virioicr").value;
		$s("divIRIOICR").style.display	= "";
	}else{
		$s("divIRIOICR").style.display	= "none";
	}
	if(parseInt($s("virioir").value)>=0){	//红外灯控制
		$s("selIRIOIR").value	= $s("virioir").value;
		$s("divIRIOIR").style.display	= "";
	}else{
		$s("divIRIOIR").style.display	= "none";
	}
	if(parseInt($s("virioicr").value)>=0 || parseInt($s("virioir").value)>=0){
		$s("TrIRIOTable").style.display	= "";
	}else{
		$s("TrIRIOTable").style.display	= "none";	
	}
	return true;
}

function shortcutset(paramflag,paramobj){
	window.status = "";
	chgsetvideo		= 0;
	if(paramflag==0){	//清亮
		if($s("btnStandardDefault").checked==0){
			$s("btnStandardDefault").value	= 0;
		}else{
//清亮勾选上(Standard标准)
			$s("btnStandardDefault").value	= 1;
			mybriSlider.setSldPoint(69);					//[255]亮度255 	69 -> 27.0588235294
			setTimeout('mysatSlider.setSldPoint(22);',50);	//[127]饱和度127	11 -> 8.6614173
			setTimeout('myacuSlider.setSldPoint(160);',100);//[8]  锐度8 	5 -> 62.5
			setTimeout('myredSlider.setSldPoint(17);',150);	//[15] 红色15	1 -> 6.666666666
			setTimeout('mybluSlider.setSldPoint(136);',200);//[15] 蓝色15	8 -> 53.33333
			setTimeout('mygamSlider.setSldPoint(75);',250);	//[11] Gamma	30 35 40 45 ~~ 80 	45(3) -> 27.2727
			//setTimeout('myconSlider.setSldPoint(108);',300);//[7]高清下的对比度 12~19 15(3) -> 42.8571
		}
		$s("btnColorfulDefault").checked	= 0;
		$s("btnColorfulDefault").value	= 0;
	}else{			//鲜艳
		if($s("btnColorfulDefault").checked==0){
			$s("btnColorfulDefault").value	= 0;
		}else{
//鲜艳勾选上
			$s("btnColorfulDefault").value	= 1;
			mybriSlider.setSldPoint(69);					//[255]亮度255 	69 -> 27.0588235294
			setTimeout('mysatSlider.setSldPoint(92);',50);	//[127]饱和度127	11 -> 8.6614173
			setTimeout('myacuSlider.setSldPoint(160);',100);//[8]  锐度8 	5 -> 62.5
			setTimeout('myredSlider.setSldPoint(136);',150);	//[15] 红色15	1 -> 6.666666666
			setTimeout('mybluSlider.setSldPoint(136);',200);//[15] 蓝色15	8 -> 53.33333
			setTimeout('mygamSlider.setSldPoint(50);',250);	//[11] Gamma	30 35 40 45 ~~ 80 	45(3) -> 27.2727
			//setTimeout('myconSlider.setSldPoint(144);',300);//[7]高清下的对比度 12~19 15(3) -> 42.8571
		}
		$s("btnStandardDefault").checked	= 0;
		$s("btnStandardDefault").value	= 0;
	}
}

/*paramcmd, objnum, paramobj, nownum, paramctrl, paramreserved
paramcmd：	操作命令指令
objnum:		操作对象数
paramobj：	对象名称
nownum：	选中当前对象
paramctrl：	操作数据
paramreserved：保留
*/
function hsvctrlEx(paramcmd, objnum, paramobj, nownum, paramctrl, paramreserved){
	window.status = "";
	var paramflag, ctrlvalue, i, tmpctrl;
	paramflag = 1000;
	ctrlvalue	= paramctrl;
	if(objnum!=10000){
		tmpctrl	= hsvctrlSub(paramcmd, objnum, paramobj, nownum, paramctrl, paramreserved);
		if(tmpctrl>=0)	ctrlvalue	= tmpctrl;
	}
	btnSettingEx(paramflag, paramcmd, ctrlvalue, 0, 0, "", "")
}
/*
paramreserved：1读取paramctrl值操作
*///hsvctrlSub(1010, 1, 'btnAWB', 0, parseInt($("vAutoAWB").value) ,1);
function hsvctrlSub(paramcmd, objnum, paramobj, nownum, paramctrl, paramreserved){
	var tmpobj, tmpctrl, returnvalue;
	var devicetype 	= parseInt(getCookies("devicetype"));//0 高清COMS  1 高清CCD  2 标清CMOS  3 标清CCD  4 高清高速球
	returnvalue	= -1;
	if(objnum==3){
		switch(paramcmd){
		case 1029:	//正常光|850mm|950mm
			for(i = 0; i < 3; i++){
				$s("btnIRLightType" + i).className	= "";
				$s("btnIRLightType" + i).className	= "btn1";
			}
			$s(paramobj).className			= "";
			$s(paramobj).className			= "btn2";
		break;
		case 1035:	//50HZ|60HZ|户外
			for(i = 2; i < 5; i++){
				$s("btnPwdFreq" + i).className	= "";
				$s("btnPwdFreq" + i).className	= "btn1";
			}
			$s(paramobj).className			= "";
			$s(paramobj).className			= "btn2";
		break;
		case 1038:	//宽动态 低|中|高
			for(i = 1; i < 4; i++){
				$s("btnWDR" + i).className	= "";
				$s("btnWDR" + i).className	= "btn1";
			}
			$s(paramobj).className			= "";
			$s(paramobj).className			= "btn2";
		break;
		case 1050:	//3D降噪 低|中|高
			for(i = 1; i < 4; i++){
				$s("btn3DNR" + i).className	= "";
				$s("btn3DNR" + i).className	= "btn1";
			}
			$s(paramobj).className			= "";
			$s(paramobj).className			= "btn2";
		break;
		default :
		break;
		}
		 returnvalue	= nownum;
	}else if(objnum==2){
		switch(paramcmd){
		case 1028:	//彩色|黑白
			if(tmpobj==null||tmpobj=="")	tmpobj = "btnIRCFMode";
		case 1034:	//50HZ|60HZ
			if(tmpobj==null||tmpobj=="")	tmpobj = "btnPwdFreq";
		case 1040:	//图像模式1|图像模式2
			if(tmpobj==null||tmpobj=="")	tmpobj = "btnImageMode";
		case 1045:	//高速|正常速度
			if(tmpobj==null||tmpobj=="")	tmpobj = "btnZoomSpeed";
			
			for(i = 0; i < 2; i++){
				$s(tmpobj + i).className	= "";
				$s(tmpobj + i).className	= "btn1";
			}
			$s(paramobj).className			= "";
			$s(paramobj).className			= "btn2";
		break;
		case 1041:	//自动光圈
			if(tmpobj==null||tmpobj==""){tmpobj = "btnIris";}
			for(i = 0; i < 2; i++){
				$s(tmpobj + i).className	= "";
				$s(tmpobj + i).className	= "btn1";
			}
			if(paramreserved==1){
				$s(tmpobj+nownum).className		= "";
				$s(tmpobj+nownum).className	= "btn2";
			}else{
				$s(paramobj).className			= "";
				$s(paramobj).className			= "btn2";
			}
			if(devicetype==17){		//松下sensor //宏视版本：在DC自动光圈下 开放快门可调节if(devicetype==11&&1==0){
				if(paramctrl==1){
					$s("setvideoAutoShutter").style.display	= "";
				}else{
					$s("setvideoAutoShutter").style.display	= "none";
				}
			}
			tmpctrl	= paramctrl;
		break;
		default :
		break;
		}
		 returnvalue	= nownum;
	}else{
		if(paramreserved==1){
			tmpctrl = paramctrl;
		}else if($s(paramobj).className=="btn2"){
			tmpctrl = 0;
		}else{
			tmpctrl = 1;
		}
		 if(tmpctrl==0){
		 	$s(paramobj).className	= "";
		 	$s(paramobj).className	= "btn1";
		 }else{
		 	$s(paramobj).className	= "";
		 	$s(paramobj).className	= "btn2";
		 }
		 returnvalue	= tmpctrl;
	}
	switch(paramcmd){
	case 1010: //白平衡(AWB)
		if(tmpctrl==1){
		   	$s("btnAWB").value	= ManualAWBtxt;
			if(isAWBTab==1){initWBSlider();}
		}else{$s("btnAWB").value = AutoAWBtxt; $s("DivWBTab").style.display = "none";}
	break;
	case 1014: //增益(AGC)
		if(tmpctrl==1){$s("btnAGC").value = ManualAGCtxt; initGCSlider();	//增益值
		}else{$s("btnAGC").value = AutoAGCtxt; $s("DivAGCTab").style.display = "none";}
	break;
	case 1016: //背光补偿(BLC)
		if(tmpctrl==1){initBLCSlider();
		}else{$s("DivBLCTab").style.display	= "none";}
	break;
	case 1020: //曝光(Exposure)
		if(tmpctrl==1){
			$s("btnAutoExp").value	= AutoExptxt;
			//$s("btnAutoExp").value	= AutoExptxt;
			if(isExposureTab==1) $s("DivExposureTab").style.display	= "";
		}else{
		   	$s("btnAutoExp").value	= AutoExptxt;
			$s("DivExposureTab").style.display	= "none";
		}
	break;
	case 1022: //自动快门
		if(tmpctrl==1){
			$s("btnAutoShutter").value	= ManualShuttertxt;
			if(parseInt($s("vShutterSpeed").value)>=0) $s("setvideoAutoShutter").style.display	= "";
		}else{
		   	$s("btnAutoShutter").value	= AutoShuttertxt;
			$s("setvideoAutoShutter").style.display	= "none";
		}
	break;
	case 1024: //快门/曝光优先
		if(tmpctrl==1){
			$s("btnShutterFirst").value	= ExposureFirsttxt;
		}else{
		   	$s("btnShutterFirst").value	= ShutterFirsttxt;
		}
	break;
	case 1025: //慢快门
		if(tmpctrl==1){initSSHTSlider();
		}else{$s("liSSHTLevel").style.display = "none";}
	break;
	case 1037: //宽动态
		if(tmpctrl==1){
			initWDRSlider();
			if(parseInt($s("vWDRLevel2").value)>=0){$s("setvideoWDRTab2").style.display	= "";}
		}else{$s("liWDRLevel").style.display = "none";$s("setvideoWDRTab2").style.display = "none";}
	break;
	case 1041: //白平衡控制
		if(tmpctrl==1){
			$s("liIris").style.display		= "";
			$s("DivIrisTab").style.display	= "";
			initIrisSlider();
		}else{$s("liIris").style.display	= "none";}
	break;
	case 1043: //聚焦
		if(tmpctrl==1){$s("btnFocus").value = ManualFocustxt; initFocusSlider();
		}else{$s("btnFocus").value = AutoFocustxt; $s("liFocusLevel").style.display = "none";}
	break;
	case 1049: //3D降噪
		if(tmpctrl==1){
			if(parseInt($s("v3DNRLevel").value)>=0) $s("setvideo3DNRTab").style.display	= "";
		}else{
			$s("setvideo3DNRTab").style.display	= "none";
		}
	break;
	case 1051: //智能降噪
		if(tmpctrl==1){initSNRSlider();
		}else{$s("liSNRLevel").style.display = "none";}
	break;
	case 1053: //自动曝光快门最大值
		if(parseInt($s("maximumae").value)>=0){
		  if(tmpctrl==1){initAEMaxSlider();
		  }else{$s("liAEMaxLevel").style.display = "none";}
		}
	break;
	case 1055: //自动增益限制
		if(parseInt($s("maximumagc").value)>=0){
		  if(tmpctrl==1){initAutoAGCSlider();
		  }else{$s("liAutoAGCLevel").style.display = "none";}
		}
	break;
	default :
	break;
	}

	return returnvalue;
}

function chghsvEx(paramflag, paramcmd, paramctrl){
	window.status = "";
	var ctrlvalue	= paramctrl;
	if(paramcmd==6104){
		ctrlvalue = $s("presetnum").value;
		if(ctrlvalue==""||ctrlvalue=="0"){
			return true;
		}
	}
	btnSettingEx(paramflag, paramcmd, ctrlvalue, 0, 0, "", "")
}

function snChangeEx(eventname, paramctrl, paramcmd, Gobj, Aobj, maxvalue, minvalue, ninterval){
try{
  if(eventname=="setPoint"){
	if(initSNOK==0) return false;
	window.status = "";
	var Gminv, Gmanv, Avalue,Tmpflag;
	Gminv	= minvalue;
	Gmanv	= maxvalue;
	Avalue	= parseInt($s(Aobj).innerHTML);
	if( Gminv > paramctrl ){		
		paramctrl	= Gminv;
	}else if( Gmanv < paramctrl ){
		paramctrl	= Gmanv;
	}
	if(Aobj!=null&&Aobj!=""){
		$s(Aobj).innerHTML = paramctrl;  
	}
	if(paramctrl != Avalue){
		if(paramcmd>=6000){
			Tmpflag = 6000;
		}else if(paramcmd>=5000&&paramcmd<6000){
			Tmpflag = 5000;
		}else if(paramcmd>=4000&&paramcmd<5000){
			Tmpflag = 4000;
		}else if(paramcmd>=3000&&paramcmd<4000){
			Tmpflag = 3000;
		}else if(paramcmd>=2000&&paramcmd<3000){
			Tmpflag = 2000;
		}else{
			Tmpflag = 1000;
		}
		btnSettingEx(Tmpflag, paramcmd, paramctrl, 0, 0,Gobj, Aobj);
		setTimeout("window.status=''",1000);
	}
  }else if(eventname=="initdata"){
	if(Aobj!=null&&Aobj!=""){
		$s(Aobj).innerHTML = paramctrl;  
	}
  }else if(eventname=="onmouseDown"){
	  OperableEx(1);
  }else if(eventname=="onmouseMove"||eventname=="onClick"||eventname=="onmouseUp"){
	if(initSNOK==0) return false;
	window.status = "";
	var Gminv, Gmanv, Avalue,Tmpflag;
	Gminv	= minvalue;
	Gmanv	= maxvalue;
	Avalue	= parseInt($s(Aobj).innerHTML);
	if(Math.abs(paramctrl-Avalue) < ninterval && SliderExChange !=0){
		return false;
	}
	if( Gminv > paramctrl ){		
		paramctrl	= Gminv;
	}else if( Gmanv < paramctrl ){
		paramctrl	= Gmanv;
	}
	if(Aobj!=null&&Aobj!=""){
		$s(Aobj).innerHTML = paramctrl;  
	}
	if(paramcmd>=6000){
		Tmpflag = 6000;
	}else if(paramcmd>=5000&&paramcmd<6000){
		Tmpflag = 5000;
	}else if(paramcmd>=4000&&paramcmd<5000){
		Tmpflag = 4000;
	}else if(paramcmd>=3000&&paramcmd<4000){
		Tmpflag = 3000;
	}else if(paramcmd>=2000&&paramcmd<3000){
		Tmpflag = 2000;
	}else{
		Tmpflag = 1000;
	}
	btnSettingEx(Tmpflag, paramcmd, paramctrl, 0, 0,Gobj, Aobj);
	setTimeout("window.status=''",1000);
	if(eventname=="onmouseUp"){
	  OperableEx(0);
	}
  }
	return true;
}catch(e){return false;}
}

var CtrlFlag;
function OperableEx(paramflag){
try{
	CtrlFlag	= paramflag;
}catch(e){return false;}
}

function lensDeployEx(paramflag,paramobj){
	if($s(paramobj).style.display == "none"){
		$s(paramobj).style.display = "";
	}else{
		$s(paramobj).style.display = "none";
	}
	switch(paramflag){
	  case 2:	
		if($("btnAWB").className=="btn2"){initWBSlider();}	//initWBSlider();
	  break;
	  case 3:	
		  initGCSlider();	//增益值
	  break;
	  case 4:	
			initBLCSlider();	//补偿值
	  break;
	  case 7:	
		  initSSHTSlider();		//慢快门调节
	  break;
	  case 8:	
		  initIRCSlider();		//灵敏度
	  break;
	  case 9:	
		  initWDRSlider();	//宽动态调节
		  initSNRSlider()	//智能降噪
		  initAFCSlider();	//去伪彩
	  break;
	  case 11:	
		  initFocusSlider();	//焦距
	  break;
	  case 13:	
		  initAEMaxSlider();	//自动曝光快门最大值
	  break;
	  case 14: 
		  initAutoAGCSlider();	//自动增益限制
	  break;
	  case 16: 	//红外检测模式
		if($s(paramobj).style.display == "none"){
			$s("TrAutoDetection").style.display = "none";
			$s("TrTimeDetection").style.display = "none";
			$s("TrIRDetection").style.display = "none";
		}else{
			if(parseInt($s("selIRDetectionMode").value)==0){		//自动检测
				$s("TrAutoDetection").style.display = "";
				$s("TrTimeDetection").style.display = "none";
				$s("TrIRDetection").style.display 	= "none";
				if(parseInt($s("vautodetection").value)>=0){initIRAutoSlider();}
			}else if(parseInt($s("selIRDetectionMode").value)==1){	//时间控制
				$s("TrAutoDetection").style.display = "none";
				$s("TrTimeDetection").style.display = "";
				$s("TrIRDetection").style.display 	= "none";
			}else if(parseInt($s("selIRDetectionMode").value)==2){	//光敏电阻检测
				$s("TrAutoDetection").style.display = "none";
				$s("TrTimeDetection").style.display = "none";
				$s("TrIRDetection").style.display 	= "";
			}
		}
	  break;
	  case 17: 	//红外检测模式 切换选项
		if(parseInt($s("selIRDetectionMode").value)==0){		//自动检测
			$s("TrAutoDetection").style.display = "";
			$s("TrTimeDetection").style.display = "none";
			$s("TrIRDetection").style.display 	= "none";
			if(parseInt($s("vautodetection").value)>=0){initIRAutoSlider();}
		}else if(parseInt($s("selIRDetectionMode").value)==1){	//时间控制
			$s("TrAutoDetection").style.display = "none";
			$s("TrTimeDetection").style.display = "";
			$s("TrIRDetection").style.display 	= "none";
		}else if(parseInt($s("selIRDetectionMode").value)==2){	//光敏电阻检测
			$s("TrAutoDetection").style.display = "none";
			$s("TrTimeDetection").style.display = "none";
			$s("TrIRDetection").style.display 	= "";
		}
	  break;
	  case 18: 	//红外机器输出控制
	  break;
	  default :
	  
	  break;
	}
}

function hsDeployEx(paramflag,paramobj){
	if($s(paramobj).style.display == "none"){
		$s(paramobj).style.display = "";
	}else{
		$s(paramobj).style.display = "none";
	}
	switch(paramflag){
	  case 2:	
	  	if($("ctrl8").className=="btn2"){initWBSlider();}		//initWBSlider();	//白平衡 红 绿 蓝
		initBLCSlider();	//补偿值
			  
	  	initRestrainSlider();	//抑制值
	  break;
	  case 4:	//彩转黑阀值
	  	initIRcfSlider();
	  break;
	  case 6:	//慢速自动
	  	initAutoAGCPTZSlider();//自动增益控制

	  	initSlowLevSlider();	//慢速自动
	  break;
	  case 7:	//最大增益值设置
	  	initAGCMaxSlider();
	  break;
	  case 8:	//光圈镜头
	  	initIrisSlider();
	  break;
	  case 9:	//自动彩转黑阀值
	  	initIRcf2Slider();
	  break;
	  default :
	  
	  break;
	}
}
