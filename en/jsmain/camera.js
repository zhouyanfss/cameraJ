// JavaScript Document
var OcBri, VcBri, OcCon, VcCon, OcHue, VcHue, OcSat, VcSat, OcAcu, VcAcu, OcRed, VcRed, OcBlu, VcBlu, OcGam, VcGam;
var OWBRed, VWBRed, OWBGre, VWBGre, OWBBlu, VWBBlu;
var OGCLevel, VGCLevel, OBLCLevel, VBLCLevel, OSSHT, VSSHT, OIRCLev, VIRCLev, OWDRLev, VWDRLev, OSNRLev, VSNRLev;
var OAFCLev, VAFCLev, OFocusLev, VFocusLev, OAEMax, VAEMax, OAutoAGC, VAutoAGC, OIRAuto, VIRAuto;
var ORes, VRes, OIRcf, VIRcf, OIRcf2, VIRcf2, OSlowLev, VSlowLev, OAGCMax, VAGCMax, OIRIS;
function initColorSlider(paramtype){
	var devicetype = paramtype;
	var flagopen = 0;
	var nintv=parseInt($("vBrightness").value);	//亮度
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesBri").style.display	= "";
		if(typeof(OcBri)!="object"){OcBri=new Slider($("g_cbri"), $("b_cbri"), {steps:255, wheel:!0, onChange:function(a){VcBri=a; $("b_cbri").setProperty("title", VcBri); $("v_cbri").setProperty("text", VcBri); httpSend(1000,1001,VcBri,0,0,OcBri,null)}});OcBri.set(nintv);}
		if(82==devicetype){
			if(parseInt($s("status13").value)==11){$("liImagesBri").style.display = "";
			}else{$("liImagesBri").style.display = "none";}
		}
		flagopen	= 1;
	}else{$s("liImagesBri").style.display = "none";}
	nintv=parseInt($("vContrast").value);	//对比度
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesCon").style.display	= "";
		if(typeof(OcCon)!="object"){OcCon=new Slider($("g_ccon"), $("b_ccon"), {steps:255, wheel:!0, onChange:function(a){VcCon=a; $("b_ccon").setProperty("title", VcCon); $("v_ccon").setProperty("text", VcCon); httpSend(1000,1002,VcCon,0,0,OcCon,null)}});OcCon.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesCon").style.display = "none";}
	nintv=parseInt($("vHue").value);	//色度
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesHue").style.display	= "";
		if(typeof(OcHue)!="object"){OcHue=new Slider($("g_chue"), $("b_chue"), {steps:255, wheel:!0, onChange:function(a){VcHue=a; $("b_chue").setProperty("title", VcHue); $("v_chue").setProperty("text", VcHue); httpSend(1000,1003,VcHue,0,0,OcHue,null)}});OcHue.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesHue").style.display = "none";}
	nintv=parseInt($("vSaturation").value);	//饱和度
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesSat").style.display	= "";
		if(typeof(OcSat)!="object"){OcSat=new Slider($("g_csat"), $("b_csat"), {steps:255, wheel:!0, onChange:function(a){VcSat=a; $("b_csat").setProperty("title", VcSat); $("v_csat").setProperty("text", VcSat); httpSend(1000,1004,VcSat,0,0,OcSat,null)}});OcSat.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesSat").style.display = "none";}
	nintv=parseInt($("vSharpness").value);	//锐度
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesAcu").style.display	= "";
		if(typeof(OcAcu)!="object"){OcAcu=new Slider($("g_cacu"), $("b_cacu"), {steps:255, wheel:!0, onChange:function(a){VcAcu=a; $("b_cacu").setProperty("title", VcAcu); $("v_cacu").setProperty("text", VcAcu); httpSend(1000,1005,VcAcu,0,0,OcAcu,null)}});OcAcu.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesAcu").style.display = "none";}
	nintv=parseInt($("vRed").value);	//红色
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesRed").style.display	= "";
		if(typeof(OcRed)!="object"){OcRed=new Slider($("g_cred"), $("b_cred"), {steps:255, wheel:!0, onChange:function(a){VcRed=a; $("b_cred").setProperty("title", VcRed); $("v_cred").setProperty("text", VcRed); httpSend(1000,1006,VcRed,0,0,OcRed,null)}});OcRed.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesRed").style.display = "none";}
	nintv=parseInt($("vBlue").value);	//蓝色
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesBlu").style.display	= "";
		if(typeof(OcBlu)!="object"){OcBlu=new Slider($("g_cblu"), $("b_cblu"), {steps:255, wheel:!0, onChange:function(a){VcBlu=a; $("b_cblu").setProperty("title", VcBlu); $("v_cblu").setProperty("text", VcBlu); httpSend(1000,1008,VcBlu,0,0,OcBlu,null)}});OcBlu.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesBlu").style.display = "none";}
	nintv=parseInt($("vGamma").value);	//Gamma
	if(!isNaN(nintv) && nintv>=0){
		$("liImagesGam").style.display	= "";
		if(typeof(OcGam)!="object"){OcGam=new Slider($("g_cgam"), $("b_cgam"), {steps:255, wheel:!0, onChange:function(a){VcGam=a; $("b_cgam").setProperty("title", VcGam); $("v_cgam").setProperty("text", VcGam); httpSend(1000,1009,VcGam,0,0,OcGam,null)}});OcGam.set(nintv);}
		flagopen = 1;
	}else{$s("liImagesGam").style.display = "none";}
	return flagopen;
}
function initWBSlider(){
	if(isAWBTab==0||$("TdAWB").style.display=="none"||$("TrAWBTable").style.display=="none"){return false;}
	$("DivWBTab").style.display	= "";
	var nintv=parseInt($("vAWBRed").value);	//白平衡 红
	if(!isNaN(nintv) && nintv>=0){
		$("liWBRed").style.display	= "";
		if(typeof(OWBRed)!="object"){OWBRed=new Slider($("g_wbred"), $("b_wbred"), {steps:255, wheel:!0, onChange:function(a){VWBRed=a; $("b_wbred").setProperty("title", VWBRed);$("v_wbred").setProperty("text", VWBRed); httpSend(1000,1011,VWBRed,0,0,OWBRed,null)}});OWBRed.set(nintv);}
	}else{$s("liWBRed").style.display = "none";}
	nintv=parseInt($("vAWBGreen").value);	//白平衡 绿
	if(!isNaN(nintv) && nintv>=0){
		$("liWBGre").style.display	= "";
		if(typeof(OWBGre)!="object"){OWBGre=new Slider($("g_wbgre"), $("b_wbgre"), {steps:255, wheel:!0, onChange:function(a){VWBGre=a; $("b_wbgre").setProperty("title", VWBGre); $("v_wbgre").setProperty("text", VWBGre); httpSend(1000,1012,VWBGre,0,0,OWBGre,null)}});OWBGre.set(nintv);}
	}else{$s("liWBGre").style.display = "none";}
	nintv=parseInt($("vAWBBlue").value);	//白平衡 蓝
	if(!isNaN(nintv) && nintv>=0){
		$("liWBBlu").style.display	= "";
		if(typeof(OWBBlu)!="object"){OWBBlu=new Slider($("g_wbblu"), $("b_wbblu"), {steps:255, wheel:!0, onChange:function(a){VWBBlu=a; $("b_wbblu").setProperty("title", VWBBlu); $("v_wbblu").setProperty("text", VWBBlu); httpSend(1000,1013,VWBBlu,0,0,OWBBlu,null)}});OWBBlu.set(nintv);}
	}else{$s("liWBBlu").style.display = "none";}
}
function initGCSlider(){
	if($("TdAGC").style.display=="none"||$("TrAGCTable").style.display=="none"){return false;}
	$("DivAGCTab").style.display	= "";
	var nintv=parseInt($("vAGCLevel").value);	//增益 调节值
	if(!isNaN(nintv) && nintv>=0){
		$("liGCLevel").style.display	= "";
		if(typeof(OGCLevel)!="object"){OGCLevel=new Slider($("g_gclev"), $("b_gclev"), {steps:255, wheel:!0, onChange:function(a){VGCLevel=a; $("b_gclev").setProperty("title", VGCLevel);$("v_gclev").setProperty("text", VGCLevel); httpSend(1000,1015,VGCLevel,0,0,OGCLevel,null)}});OGCLevel.set(nintv);}
	}else{$s("liGCLevel").style.display = "none";}
}
function initBLCSlider(){
	if($("TdBLC").style.display=="none"||$("TrBLCTable").style.display=="none"){return false;}
	$("DivBLCTab").style.display	= "";
	var nintv=parseInt($("vBLCLevel").value);	//背光补偿 补偿值
	if(!isNaN(nintv) && nintv>=0){
		$("liBLCLevel").style.display	= "";
		if(typeof(OBLCLevel)!="object"){OBLCLevel=new Slider($("g_blclev"), $("b_blclev"), {steps:255, wheel:!0, onChange:function(a){VBLCLevel=a; $("b_blclev").setProperty("title", VBLCLevel);$("v_blclev").setProperty("text", VBLCLevel); httpSend(1000,1017,VBLCLevel,0,0,OBLCLevel,null)}});OBLCLevel.set(nintv);}
	}else{$s("liBLCLevel").style.display = "none";}
}
function initSSHTSlider(){
	if($("TdShutter").style.display=="none"||$("TrShutterTable").style.display=="none"){return false;}
	$("DivShutter").style.display	= "";
	var nintv=parseInt($("vSlowShutterLevel").value);	//慢快门调节
	if(!isNaN(nintv) && nintv>=0){
		$("liSSHTLevel").style.display	= "";
		if(typeof(OSSHT)!="object"){OSSHT=new Slider($("g_ssht"), $("b_ssht"), {steps:255, wheel:!0, onChange:function(a){VSSHT=a; $("b_ssht").setProperty("title", VSSHT);$("v_ssht").setProperty("text", VSSHT); httpSend(1000,1026,VSSHT,0,0,OSSHT,null)}});OSSHT.set(nintv);}
	}else{$s("liSSHTLevel").style.display = "none";}
}
function initIRCSlider(){
	if($("TdIR").style.display=="none"||$("TrIRTable").style.display=="none"){return false;}
	$("divIRCItem").style.display	= "";
	var nintv=parseInt($("vIRCFLevel").value);	//IR 灵敏度
	if(!isNaN(nintv) && nintv>=0){
		$("liIRCLevel").style.display	= "";
		if(typeof(OIRCLev)!="object"){OIRCLev=new Slider($("g_irclev"), $("b_irclev"), {steps:255, wheel:!0, onChange:function(a){VIRCLev=a; $("b_irclev").setProperty("title", VIRCLev);$("v_irclev").setProperty("text", VIRCLev); httpSend(1000,1047,VIRCLev,0,0,OIRCLev,null)}});OIRCLev.set(nintv);}
	}else{$s("liIRCLevel").style.display = "none";}
}
function initWDRSlider(){
	if($("TdOther").style.display=="none"||$("TrOtherTable").style.display=="none"){return false;}
	$("divWDRItem").style.display	= "";
	var nintv=parseInt($("vWDRLevel").value);	//宽动态 调节值
	if(!isNaN(nintv) && nintv>=0){
		$("liWDRLevel").style.display	= "";
		if(typeof(OWDRLev)!="object"){OWDRLev=new Slider($("g_wdrlev"), $("b_wdrlev"), {steps:255, wheel:!0, onChange:function(a){VWDRLev=a; $("b_wdrlev").setProperty("title", VWDRLev);$("v_wdrlev").setProperty("text", VWDRLev); httpSend(1000,1038,VWDRLev,0,0,OWDRLev,null)}});OWDRLev.set(nintv);}
	}else{$s("liWDRLevel").style.display = "none";}
}
function initSNRSlider(){
	if($("TdOther").style.display=="none"||$("TrOtherTable").style.display=="none"){return false;}
	$("divSNRItem").style.display	= "";
	var nintv=parseInt($("vSmartNRLevel").value);	//智能降噪 调节值
	if(!isNaN(nintv) && nintv>=0){
		$("liSNRLevel").style.display	= "";
		if(typeof(OSNRLev)!="object"){OSNRLev=new Slider($("g_snrlev"), $("b_snrlev"), {steps:255, wheel:!0, onChange:function(a){VSNRLev=a; $("b_snrlev").setProperty("title", VSNRLev);$("v_snrlev").setProperty("text", VSNRLev); httpSend(1000,1052,VSNRLev,0,0,OSNRLev,null)}});OSNRLev.set(nintv);}
	}else{$s("liSNRLevel").style.display = "none";}
}
function initAFCSlider(){
	if($("TdOther").style.display=="none"||$("TrOtherTable").style.display=="none"){return false;}
	$("divAFCItem").style.display	= "";
	var nintv=parseInt($("vantifalsecolor").value);	//去伪彩 阀值调节
	if(!isNaN(nintv) && nintv>=0){
		$("liAFCLevel").style.display	= "";
		if(typeof(OAFCLev)!="object"){OAFCLev=new Slider($("g_afclev"), $("b_afclev"), {steps:255, wheel:!0, onChange:function(a){VAFCLev=a; $("b_afclev").setProperty("title", VAFCLev);$("v_afclev").setProperty("text", VAFCLev); httpSend(1000,1060,VAFCLev,0,0,OAFCLev,null)}});OAFCLev.set(nintv);}
	}else{$s("liAFCLevel").style.display = "none";}
}
function initFocusSlider(){
	if($("TdFocus").style.display=="none"||$("TrFocusTable").style.display=="none"){return false;}
	$("divFocusItem").style.display	= "";
	var nintv=parseInt($("vFocusLevel").value);	//手动聚焦 焦距
	if(!isNaN(nintv) && nintv>=0){
		$("liFocusLevel").style.display	= "";
		if(typeof(OFocusLev)!="object"){OFocusLev=new Slider($("g_foclev"), $("b_foclev"), {steps:255, wheel:!0, onChange:function(a){VFocusLev=a; $("b_foclev").setProperty("title", VFocusLev);$("v_foclev").setProperty("text", VFocusLev); httpSend(1000,1044,VFocusLev,0,0,OFocusLev,null)}});OFocusLev.set(nintv);}
	}else{$s("liFocusLevel").style.display = "none";}
}
function initAEMaxSlider(){
	if($("TdAEMax").style.display=="none"||$("TrAEMaxTable").style.display=="none"){return false;}
	$("divAEMaxItem").style.display	= "";
	var nintv=parseInt($("maximumae").value);	//自动曝光快门最大值
	if(!isNaN(nintv) && nintv>=0){
		$("liAEMaxLevel").style.display	= "";
		if(typeof(OAEMax)!="object"){OAEMax=new Slider($("g_aemax"), $("b_aemax"), {steps:255, wheel:!0, onChange:function(a){VAEMax=a; $("b_aemax").setProperty("title", VAEMax);$("v_aemax").setProperty("text", VAEMax); httpSend(1000,1054,VAEMax,0,0,OAEMax,null)}});OAEMax.set(nintv);}
	}else{$s("liAEMaxLevel").style.display = "none";}
}
function initAutoAGCSlider(){
	if($("TdAutoAGC").style.display=="none"||$("TrAutoAGCTable").style.display=="none"){return false;}
	$("divAutoAGCItem").style.display	= "";
	var nintv=parseInt($("maximumagc").value);	//自动增益限制
	if(!isNaN(nintv) && nintv>=0){
		$("liAutoAGCLevel").style.display	= "";
		if(typeof(OAutoAGC)!="object"){OAutoAGC=new Slider($("g_autoagc"), $("b_autoagc"), {steps:255, wheel:!0, onChange:function(a){VAutoAGC=a; $("b_autoagc").setProperty("title", VAutoAGC);$("v_autoagc").setProperty("text", VAutoAGC); httpSend(1000,1056,VAutoAGC,0,0,OAutoAGC,null)}});OAutoAGC.set(nintv);}
	}else{$s("liAutoAGCLevel").style.display = "none";}
}
function initIRAutoSlider(){
	if($("TrAutoDetection").style.display=="none"||$("TrIRDetectionModeTable").style.display=="none"){return false;}
	$("divIRAutoItem").style.display	= "";
	var nintv=parseInt($("vautodetection").value);	//视频检测 IR 灵敏度
	if(!isNaN(nintv) && nintv>=0){
		$("liIRAutoLevel").style.display	= "";
		if(typeof(OIRAuto)!="object"){OIRAuto=new Slider($("g_irauto"), $("b_irauto"), {steps:255, wheel:!0, onChange:function(a){VIRAuto=a; $("b_irauto").setProperty("title", VIRAuto);$("v_irauto").setProperty("text", VIRAuto); httpSend(1000,1047,VIRAuto,0,0,OIRAuto,null)}});OIRAuto.set(nintv);}
	}else{$s("liIRAutoLevel").style.display = "none";}
}

function initRestrainSlider(){
	if($("TrRestrainLev").style.display=="none"||$("TdLens").style.display=="none"){return false;}
	$("divResItem").style.display	= "";
	var nintv=parseInt($("reductionlevel").value);	//噪声抑制 抑制值
	if(!isNaN(nintv) && nintv>=0){
		$("liRestrain").style.display	= "";
		if(typeof(ORes)!="object"){ORes=new Slider($("g_Res"), $("b_Res"), {steps:255, wheel:!0, onChange:function(a){VRes=a; $("b_Res").setProperty("title", VRes);$("v_Res").setProperty("text", VRes); httpSend(5000,5016,VRes,0,0,ORes,null)}});ORes.set(nintv);}
	}else{$s("liRestrain").style.display = "none";}
}
function initIRcfSlider(){
	if($("TdIRcf2").style.display=="none"||$("TrIRcfset").style.display=="none"){return false;}
	$("divIRcfItem").style.display	= "";
	var nintv=parseInt($("ircfvalue").value);	//彩转黑阀值
	if(!isNaN(nintv) && nintv>=0){
		$("liIRcf").style.display	= "";
		if(typeof(OIRcf)!="object"){OIRcf=new Slider($("g_ircf"), $("b_ircf"), {steps:255, wheel:!0, onChange:function(a){VIRcf=a; $("b_ircf").setProperty("title", VIRcf);$("v_ircf").setProperty("text", VIRcf); httpSend(5000,5014,VIRcf,0,0,OIRcf,null)}});OIRcf.set(nintv);}
	}else{$s("liIRcf").style.display = "none";}
}
function initIRcf2Slider(){
	if($("TdIRcf2CH6300").style.display=="none"||$("TrIRcfsetCH6300").style.display=="none"){return false;}
	$("divIRcf2Item").style.display	= "";
	var nintv=parseInt($("ircfvalue").value);	//彩转黑阀值 6300
	if(!isNaN(nintv) && nintv>=0){
		$("liIRcf2").style.display	= "";
		if(typeof(OIRcf2)!="object"){OIRcf2=new Slider($("g_ircf2"), $("b_ircf2"), {steps:255, wheel:!0, onChange:function(a){VIRcf2=a; $("b_ircf2").setProperty("title", VIRcf2);$("v_ircf2").setProperty("text", VIRcf2); httpSend(5000,5014,VIRcf2,0,0,OIRcf2,null)}});OIRcf2.set(nintv);}
	}else{$s("liIRcf2").style.display = "none";}
}
function initAutoAGCPTZSlider(){
	if($("TdAE").style.display=="none"||$("strAESet").style.display=="none"){return false;}
	if($("ctrl50").className=="btn1"){return false;}
	$("divAutoAGCItem").style.display	= "";
	var nintv=parseInt($("agcpvalue").value);	//自动增益限制
	if(!isNaN(nintv) && nintv>=0){
		$("liAutoAGCLevel").style.display	= "";
		if(typeof(OAutoAGC)!="object"){OAutoAGC=new Slider($("g_autoagc"), $("b_autoagc"), {steps:255, wheel:!0, onChange:function(a){VAutoAGC=a; $("b_autoagc").setProperty("title", VAutoAGC);$("v_autoagc").setProperty("text", VAutoAGC); httpSend(5000,5303,VAutoAGC,0,0,OAutoAGC,null)}});OAutoAGC.set(nintv);}
	}else{$s("liAutoAGCLevel").style.display = "none";}
}
function initSlowLevSlider(){
	if($("TrSlowAuto").style.display=="none"||$("TdAE").style.display=="none"||$("strAESet").style.display=="none"){return false;}
	$("divSlowLevItem").style.display	= "";
	var nintv=parseInt($("slowautolevel").value);	//慢速快门
	if(!isNaN(nintv) && nintv>=0){
		$("liSlowLevel").style.display	= "";
		if(typeof(OSlowLev)!="object"){OSlowLev=new Slider($("g_slowlev"), $("b_slowlev"), {steps:255, wheel:!0, onChange:function(a){VSlowLev=a; $("b_slowlev").setProperty("title", VSlowLev);$("v_slowlev").setProperty("text", VSlowLev); httpSend(5000,5210,VSlowLev,0,0,OSlowLev,null)}});OSlowLev.set(nintv);}
	}else{$s("liSlowLevel").style.display = "none";}
}
function initAGCMaxSlider(){
	if($("TdAGC").style.display=="none"||$("TrAGCSC220TSet").style.display=="none"){return false;}
	$("divAGCMaxItem").style.display	= "";
	var nintv=parseInt($("maximumagc").value);	//最大增益值
	if(!isNaN(nintv) && nintv>=0){
		$("liAGCMax").style.display	= "";
		if(typeof(OAGCMax)!="object"){OAGCMax=new Slider($("g_agcmax"), $("b_agcmax"), {steps:255, wheel:!0, onChange:function(a){VAGCMax=a; $("b_agcmax").setProperty("title", VAGCMax);$("v_agcmax").setProperty("text", VAGCMax); httpSend(5000,5304,VAGCMax,0,0,OAGCMax,null)}});OAGCMax.set(nintv);}
	}else{$s("liAGCMax").style.display = "none";}
}
function initIrisSlider(){
	if($("TdIris").style.display=="none"||$("TrIrisTable").style.display=="none"||$("btnIris1").className=="btn1"){return false;}
	$("divIrisItem").style.display	= "";
	var nintv=parseInt($("vIrisLevel").value);
	if(!isNaN(nintv) && nintv>=0){
		$("liIris").style.display	= "";
		if(typeof(OIRIS)!="object"){OIRIS=new Slider($("g_iris"), $("b_iris"), {steps:255, wheel:!0, onChange:function(a){VIRIS=a; $("b_iris").setProperty("title", VIRIS);$("v_iris").setProperty("text", VIRIS); httpSend(5000,5304,VIRIS,0,0,OIRIS,null)}});OIRIS.set(nintv);}
	}else{$s("liIris").style.display = "none";}
}

function httpSend(pFlag, pCMD, pCTRL, pSTEP, PRES, oSlider, oText){
	sendBTNSettingEx(pFlag, pCMD, pCTRL, pSTEP, PRES, oSlider, oText);
	//$("ocx")&&ocx.SetColor(0,gca,gcb,gcc,gcd)
}

