// JavaScript Document
var bRECORD = new Array(0,0,0,0), bCALL, bLISTEN = new Array(0,0,0,0), bSCALE, bORIGINAL; 
var RIGHT_BAR_SHOW=!1, RIGHT_FOCUS_SHOW=!1, RIGHT_PTZ_SHOW=!1, RIGHT_SIDE=0;
var gsld1, gsld2, gsld3, gsld4, gca=0, gcb=0, gcc=0, gcd=0, ptzbc, gpc=0;
var b_INIT_Images=!1, b_INIT_PTZ=!1, Ptz_Menu_Height=0;
var PTZAuto=!1, PTZStop=1;
var bLogin=!1, bPreview=!1;
function ocxConfirm(){
	try{
		if($("WebCMS").attr("StartPreview") == undefined) {
			if(window.confirm("ALERTOCX") == true){window.location.href='/WebCMS.exe';}
		}
	}catch(e){}
}

function loginNVS(){
	try{
		$("WebCMS").m_szUrl		= getDocURL();
		$("WebCMS").m_dwDataPort= parseInt($("port").value);
		$("WebCMS").m_szUserName= $("username").value;
		$("WebCMS").m_szPassword= $("password").value;
		
		$("WebCMS").SetLoginMode(1); 
		$("WebCMS").ShowTips(0); 
		$("WebCMS").ShowAlarmDialog(0); 
		$("WebCMS").SetFullWindow(1);
		$("WebCMS").m_ProtocolType	= 0; 
		//if(lanset==1){
		if(1){$("WebCMS").m_bEnglish	= 0;
		}else{$("WebCMS").m_bEnglish	= 1;}
		//alert("URL=" + getDocURL() + " Port=" + $("port").value + " Username=" + $("username").value + " Password=" + $("password").value);
		$("WebCMS").Login(); 
	}catch(e){}
}
function onLoginNVS(nResult){
	try{
		if(nResult >= 2){
			$("WebCMS").m_ChnNo=0;
			$("WebCMS").StartPreview();
			bLogin=1; bPreview=1;
		}
	}catch(e){}
return false;

	try{
		if(nResult < 2){
		  if($("viewer").value=="yes"){
			  switch(nResult){
				case -1:	
					window.status = ALERTVIEWLOGINERRORCODE1;  break;
				case -2:	
					window.status = ALERTVIEWLOGINERRORCODE2;  break;
				case -3:	
					window.status = ALERTVIEWLOGINERRORCODE3;  break;
				case -4:	
					window.status = ALERTVIEWLOGINERRORCODE4;  break;
				case -5:	
					window.status = ALERTVIEWLOGINERRORCODE5;  break;
				case -6:	
					window.status = ALERTVIEWLOGINERRORCODE6;  break;
				case -7:	
					window.status = ALERTVIEWLOGINERRORCODE7;  break;
				default:
					window.status = ALERTVIEWLOGINERRORCODE8 + nResult; break;
			  }
		  }
			return false;
		}
		$("WebCMS").m_ChnNo=0;
		$("WebCMS").StartPreview();
	}catch(e){
		if(nResult >= 2){
			$("WebCMS").m_ChnNo = 0;
			$("WebCMS").StartPreview();
		}
	}
}
function stopPreview(){if(bPreview)$("WebCMS").StopPreview(),bPreview=!1;}
function stopViewLogout(){if(bPreview)$("WebCMS").StopPreview(),bPreview=!1;if(bLogin)$("WebCMS").Logout(),bLogin=!1;}
function startPreview(){
	if(!bPreview)$("WebCMS").StartPreview(),bPreview=1;
	
	jQuery(".btnArea").click(function(e){
        e.stopPropagation();  
		
		var ele = jQuery(this).find(".selectArea");
		if(ele.is(":visible")){
			ele.hide();
		}
		else{
			jQuery(".selectArea").hide();
			ele.show();
		}
	});
}
function changeStream(CTRL_OBJ, CTRL_CMD){
	if(CTRL_CMD	== 61){	//主码流
		$("b_Stream2").className = "b_Stream1";
		if(CTRL_OBJ)CTRL_OBJ.className = "b_Stream2";
		stopPreview();
		$("WebCMS").SetStreamType(0);
		startPreview();
	}else{				//次码流
		$("b_Stream1").className = "b_Stream1";
		if(CTRL_OBJ)CTRL_OBJ.className = "b_Stream2";
		stopPreview();
		$("WebCMS").SetStreamType(1);
		startPreview();
	}
	if(bORIGINAL) funOriginal($("b_original"), 1);
	if(bSCALE) funScale($("b_scale"), 1);
}

// function changeStreamArea(areaId){
	
	// var ele = jQuery("#" + areaId);
	// if(ele.is(":visible")){
		// ele.hide();
	// }
	// else{
		// jQuery(".selectArea").hide();
		// ele.show();
	// }
// }


jQuery(document).click(function(){
        jQuery(".selectArea").hide();
		
    });

function funSnap(CTRL_OBJ){	//抓图
	$("WebCMS").ChannelCapture(0, 0);
}
function funRecord(CTRL_OBJ){		//录像
debugger;
	var nWindows = $("nwindows").value;
	if(!bRECORD[nWindows]){
		var Recordstart = $("WebCMS").StartRecord();
		if(Recordstart){
			CTRL_OBJ.className = "leftbtn record1";
			window.status = ALERTRECORD + '...... ' + ALERTSAVE + ': ' + $("WebCMS").GetRecordPath();
			bRECORD[nWindows] = 1;
		}
	}else{
		var Recordstart = $("WebCMS").StopRecord();
		if(Recordstart){
			CTRL_OBJ.className = "leftbtn record";
			window.status = ALERTSTOP;
			bRECORD[nWindows] = 0;
			setTimeout("window.status='';",5000);
		}
	}
	//initState(1);	
} 
function funCall(CTRL_OBJ)	{ //对讲开关
	if(!bCALL){
		$("WebCMS").StartTalk();
		CTRL_OBJ.className = "leftbtn talk1";
		window.status = ALERTCALL + '......';
		bCALL = 1;
	}else{
		$("WebCMS").StopTalk();
		CTRL_OBJ.className = "leftbtn talk";
		window.status = ALERTSTOP;
		bCALL = 0;
		setTimeout("window.status='';", 5000);
	}
	//initState(1);
}
function funListen(CTRL_OBJ){ //声音开关
	var nWindows = $("nwindows").value;
	if(!bLISTEN[0]){
		var startbool = $("WebCMS").PlayAudio(1);
		if(startbool){
			CTRL_OBJ.className	= "leftbtn voice1";
			window.status= ALERTLISTEN + '......';
			bLISTEN[0] = 1;
		}
	}else{ //关闭声音
		var startbool = $("WebCMS").PlayAudio(0);
		if(startbool){
			CTRL_OBJ.className	= "leftbtn voice";
			window.status= ALERTSTOP;
			bLISTEN[0] = 0;
			setTimeout("window.status='';", 5000);
		}
	}
	//initState(1);
}
function funClrAlarm(CTRL_OBJ){	//报警清除
	$("WebCMS").ClearAlarm();
	$("b_almout").style.display		= "none";
}
function funZoomIn(CTRL_OBJ){	//局部放大
	if($("zoomin").value == "2") return false;
	if($("zoomin").value == "0"){
		$("WebCMS").ImageZoomIn(1);
		$("zoomin").value = 1;
		CTRL_OBJ.className = "leftbtn zoom1";
	}else{
		$("WebCMS").ImageZoomIn(0);
		$("zoomin").value = 0;
		CTRL_OBJ.className = "leftbtn zoom";
	}
}
function funFull(CTRL_OBJ){
	$("WebCMS").FullScreen();
}
function funScale(CTRL_OBJ, CTRL_CMD){
	if(!bSCALE && !CTRL_CMD){
		if(bORIGINAL) funOriginal($("b_original"), 1);
		if(RIGHT_BAR_SHOW || RIGHT_PTZ_SHOW) funImageCtrl($("b_image"), 1);
		if(CTRL_OBJ)CTRL_OBJ.className	= "leftbtn scale1";
		bSCALE	= 1;
		var a, b, c_a, c_b;
		var bStream	= $("WebCMS").GetStreamType();
		c_a	= parseInt($("video1").style.width);
		c_b	= parseInt($("videoH").style.height);
		if(!bStream){
			a	= parseInt($("mainwidth").value);
			b	= parseInt($("mainheight").value);
		}else{
			a	= parseInt($("subwidth").value);
			b	= parseInt($("subheight").value);
		}
		autoScaleWH(a, b, c_a, c_b);
	}else{
		if(CTRL_OBJ)CTRL_OBJ.className = "leftbtn scale";
		bSCALE	= 0; manualResize();
	}
	//alert("bSCALE=" + bSCALE);
}
function funOriginal(CTRL_OBJ, CTRL_CMD){
	if(!bORIGINAL && !CTRL_CMD){
		if(bSCALE) funScale($("b_scale"), 1);
		if(RIGHT_BAR_SHOW || RIGHT_PTZ_SHOW) funImageCtrl($("b_image"), 1);
		if(CTRL_OBJ)CTRL_OBJ.className	= "leftbtn original1";
		bORIGINAL	= 1;
		var a, b, c_a, c_b;
		var bStream	= $("WebCMS").GetStreamType();
		c_a	= parseInt($("video1").style.width);
		c_b	= parseInt($("videoH").style.height);
		if(!bStream){
			a	= parseInt($("mainwidth").value);
			b	= parseInt($("mainheight").value);
		}else{
			a	= parseInt($("subwidth").value);
			b	= parseInt($("subheight").value);
		}
//alert("a=" + a + " b=" + b + " c_a=" + c_a + " c_b=" + c_b);
		autoOriginalWH(a, b, c_a, c_b);
	}else{
		if(CTRL_OBJ)CTRL_OBJ.className = "leftbtn original";
		bORIGINAL = 0; manualResize();
	}
	//alert("bORIGINAL=" + bORIGINAL);
}
function funImageCtrl(CTRL_OBJ, CTRL_CMD){
	if(bORIGINAL) funOriginal($("b_original"), 1);
	if(bSCALE) funScale($("b_scale"), 1);
	if(bORIGINAL || bSCALE) return false;
	if(!RIGHT_BAR_SHOW && !CTRL_CMD){
		CTRL_OBJ.className	= "Rightbtn image1";
		$("b_ptz").className	= "Rightbtn ptz";
		RIGHT_BAR_SHOW	= 1;
		RIGHT_FOCUS_SHOW= 0;
		RIGHT_PTZ_SHOW	= 0;
		RIGHT_SIDE		= 250;
		$("image_adjust").style.display="";		//亮色调节
		$("focus_adjust").style.display="none";	//聚焦变倍
		$("ptz_control").style.display="none";	//球机PTZ 聚焦变倍
		if(!b_INIT_Images){
			g_xmlhttp.open("get", "html/body_images.html", false);
			SafeHttpSend(g_xmlhttp, null);
			//g_xmlhttp.onreadystatechange = function()
			{
				if (g_xmlhttp.readyState != 4){return false;}
				document.getElementById("image_adjust").innerHTML = g_xmlhttp.responseText;
			}
			initImages();b_INIT_Images=1;
			ApplyXmlLang("images.xml", m_szLanguage);
		}
	}else{
		CTRL_OBJ.className = "Rightbtn image";
		$("b_ptz").className = "Rightbtn ptz";
		RIGHT_BAR_SHOW	= 0;
		RIGHT_FOCUS_SHOW= 0;
		RIGHT_PTZ_SHOW	= 0;
		RIGHT_SIDE		= 0;
		$("image_adjust").style.display="none";	//亮色调节
		$("focus_adjust").style.display="none";	//聚焦变倍
		$("ptz_control").style.display="none";	//球机PTZ 聚焦变倍
	}
	manualResize();	
}
function funPTZCtrl(CTRL_OBJ, CTRL_CMD){
	if(bORIGINAL) funOriginal($("b_original"), 1);
	if(bSCALE) funScale($("b_scale"), 1);
	if(bORIGINAL || bSCALE) return false;
	if(!RIGHT_PTZ_SHOW && !CTRL_CMD){
		if(CTRL_OBJ)CTRL_OBJ.className	= "Rightbtn ptz1";
		if($("b_image"))$("b_image").className	= "Rightbtn image";
		RIGHT_BAR_SHOW	= 0;
		RIGHT_FOCUS_SHOW= 0;
		RIGHT_PTZ_SHOW	= 1;
		RIGHT_SIDE		= 250;
		$("image_adjust").style.display="none";	//亮色调节
		$("focus_adjust").style.display="none";	//聚焦变倍
		$("ptz_control").style.display="";		//球机PTZ 聚焦变倍
		if(!b_INIT_PTZ){
			g_xmlhttp.open("get", "html/body_ptz_control.html", false);
			SafeHttpSend(g_xmlhttp, null);
			//g_xmlhttp.onreadystatechange = function()
			{
				if (g_xmlhttp.readyState != 4){return false;}
				document.getElementById("ptz_control").innerHTML = g_xmlhttp.responseText;
			}
			initPTZCtrl();b_INIT_PTZ=1;
			ApplyXmlLang("ptz.xml", m_szLanguage);
		}
		
		$("imgspread").src="../image/spread.gif";
	}else{
		if(CTRL_OBJ)CTRL_OBJ.className = "Rightbtn ptz";
		if($("b_image"))$("b_image").className = "Rightbtn image";
		RIGHT_BAR_SHOW	= 0;
		RIGHT_FOCUS_SHOW= 0;
		RIGHT_PTZ_SHOW	= 0;
		RIGHT_SIDE		= 0;
		$("image_adjust").style.display="none";	//亮色调节
		$("focus_adjust").style.display="none";	//聚焦变倍
		//$("ptz_control").style.display="none";	//球机PTZ 聚焦变倍
		
		$("imgspread").src="../image/spread_left.gif";
	}
	manualResize();
}
//自动适应宽高比
function autoScaleWH(V_W, V_H, C_W, C_H){
	var ImageWidth 		= parseInt(V_W);
	var ImageHeight 	= parseInt(V_H);
	var BodyWidth		= parseInt(C_W);
	var BodyHeight		= parseInt(C_H);
	if(isNaN(ImageWidth) || isNaN(ImageHeight) || isNaN(BodyWidth) || isNaN(BodyHeight)) return false;
	var tmpWidth, tmpHeight;
	if(ImageWidth/ImageHeight >= BodyWidth/BodyHeight){
		if(ImageWidth > BodyWidth){tmpWidth = BodyWidth; tmpHeight = (ImageHeight*BodyWidth)/ImageWidth; 
		}else{tmpWidth = ImageWidth; tmpHeight = ImageHeight;} 
	 }else{ 
		if(ImageHeight > BodyHeight){tmpWidth = (ImageWidth*BodyHeight)/ImageHeight; tmpHeight = BodyHeight; 
		}else{tmpWidth = ImageWidth; tmpHeight = ImageHeight;} 
	 }
	 ImageWidth = parseInt(tmpWidth); ImageHeight = parseInt(tmpHeight);
	if(ImageHeight < BodyHeight){$("video1").setStyle("paddingTop", ((BodyHeight-ImageHeight)/2) + "px");}
	$("WebCMS").style.width	= ImageWidth + "px";
	$("WebCMS").style.height	= ImageHeight + "px";
}
//自动适应原始大小(a, b, c_a, c_b);
function autoOriginalWH(V_W, V_H, C_W, C_H){
	var a	= V_W;
	var b	= V_H;
	var c_a	= C_W;
	var c_b	= C_H;
	if(a>=c_a && b>=c_b){
		$("mb").setStyle("min-width", a + "px");
		$("mb").setStyle("width", a + "px");
		$("mb").setStyle("height", (b-78) + "px");
		$("videoH").setStyle("min-width", (a+30) + "px");
		$("videoH").setStyle("width", (a+30) + "px");
		$("videoH").setStyle("height", b + "px");
		$("videoCon").setStyle("width", "100%");
		$("videoCon").setStyle("height", "100%");
		$("video1").setStyle("width", a + "px");
		$("video1").setStyle("height", "100%");
	}else if(a>=c_a && b<c_b){
		$("mb").setStyle("min-width", a + "px");
		$("mb").setStyle("width", a + "px");
		$("videoH").setStyle("min-width", (a+30) + "px");
		$("videoH").setStyle("width", (a+30) + "px");
		$("videoCon").setStyle("width", "100%");
		$("video1").setStyle("width", a + "px");
	}else if(a<c_a && b>=c_b){
		$("mb").setStyle("height", (b-78) + "px");
		$("videoH").setStyle("height", b + "px");
		$("videoCon").setStyle("height", "100%");
		$("video1").setStyle("height", "100%");
	}
	if(b < c_b){$("video1").setStyle("paddingTop", ((c_b-b)/2) + "px");}//$("video1").style.paddingTop	= (c_b-b)/2;
	$("WebCMS").style.width	= a + "px";
	$("WebCMS").style.height	= b + "px";
}
function setColor(pFlag, pCMD, pCTRL, pSTEP, PRES, oSlider, oText){
	if(!b_INIT_Images)return false;
	sendBTNSettingEx(pFlag, pCMD, pCTRL, pSTEP, PRES, oSlider, oText);
	//$("ocx")&&ocx.SetColor(0,gca,gcb,gcc,gcd)
}
function resetColor(){
	sendBTNSettingEx(1000, 1001, 11000, 0, 0, gsld1, 't_sld1');
	setTimeout("sendBTNSettingEx(1000, 1002, 11000, 0, 0, gsld2, 't_sld2');", 320);
	setTimeout("sendBTNSettingEx(1000, 1003, 11000, 0, 0, gsld4, 't_sld4');", 720);
	setTimeout("sendBTNSettingEx(1000, 1004, 11000, 0, 0, gsld3, 't_sld3');", 1120);
}
function initImages(){
	if(typeof(gsld1)!="object")gsld1=new Slider($("sa1"), $("sk1"), {steps:255, wheel:!0, onChange:function(a){$("sk1").setProperty("title", a); gca=a; $("t_sld1").setProperty("text", gca); setColor(1000,1001,gca,0,0,gsld1,null)}});
	if(typeof(gsld2)!="object")gsld2=new Slider($("sa2"), $("sk2"), {steps:255, wheel:!0, onChange:function(a){$("sk2").setProperty("title", a); gcb=a; $("t_sld2").setProperty("text",gcb); setColor(1000,1002,gcb,0,0,gsld2,null)}});
	if(typeof(gsld4)!="object")gsld4=new Slider($("sa4"), $("sk4"), {steps:255, wheel:!0, onChange:function(a){$("sk4").setProperty("title", a); gcd=a; $("t_sld4").setProperty("text",gcd); setColor(1000,1003,gcd,0,0,gsld4,null)}});
	if(typeof(gsld3)!="object")gsld3=new Slider($("sa3"), $("sk3"), {steps:255, wheel:!0, onChange:function(a){$("sk3").setProperty("title", a); gcc=a; $("t_sld3").setProperty("text",gcc); setColor(1000,1004,gcc,0,0,gsld3,null)}});
	var nbri=parseInt($("vbri").value), nhue=parseInt($("vhue").value), ncon=parseInt($("vcon").value), nsat=parseInt($("vsat").value);
	if(isNaN(nbri))nbri=0;
	if(isNaN(ncon))ncon=0;
	if(isNaN(nhue))nhue=0;
	if(isNaN(nsat))nsat=0;
	gsld1.set(nbri);gsld2.set(ncon);gsld4.set(nhue);gsld3.set(nsat);
	
	$("b_reset").addEvent("click",function(){resetColor();});
}
function initPTZCtrl(){
	var CMDVALUE = parseInt($("devicetype").value);
	if(typeof(ptzbc)!="object"){ptzbc=new Slider($("bcx"), $("bck"), {steps:100, wheel:!0, onChange:function(a){gca=a; $("bck").setProperty("title", gca); $("t_bcn").setProperty("text", gca); setCookies("nBCValue", gca, 1); }});}
	var nbc = parseInt(getCookies("nBCValue"));if(isNaN(nbc)){nbc=50;} ptzbc.set(nbc);
	//addEventPTZ(OBJ, ATTRTITLE, DOWNCMD, UPCMD, OUTCMD, CLICKCMD)
	addEventPTZ("yt1", "Left-Up", 	1, 1, 	0,  0);
	addEventPTZ("yt2", "Up", 		1, 30, 	30, 0);
	addEventPTZ("yt3", "Right-Up", 	1, 1, 	0,  0);
	addEventPTZ("yt4", "left", 		3, 32,	32, 0);
	addEventPTZ("yt5", "Auto", 		0, 0,	0,  11);
	addEventPTZ("yt6", "Right", 	4, 33,	33, 0);
	addEventPTZ("yt7", "Left-Down", 1, 1, 	0,  0);
	addEventPTZ("yt8", "Down", 		2, 31, 	31, 0);
	addEventPTZ("yt9", "Right-Down",1, 1, 	0,  0);
	
	addEventPTZ("b_bb1", "Zoom +",	9,  38, 	38, 0);
	addEventPTZ("b_bb2", "Zoom -",	10, 39, 	39, 0);
	addEventPTZ("b_bj1", "Focus +",	5,  34, 	34, 0);
	addEventPTZ("b_bj2", "Focus -",	6,  35, 	35, 0);
	addEventPTZ("b_gq1", "zoom -",	7,  36, 	36, 0);
	addEventPTZ("b_gq2", "zoom -",	8,  37, 	37, 0);
	
	var a=new Fx.Tween("gjxx","height",{duration:500});$("b_xl").addEvent("click",function(b){(new Event(b)).stop();$("gjxx").offsetHeight-0==0?(a.start("height",0,300+Ptz_Menu_Height),$("b_xl").className="b_up",$("tiaojie").style.display="none"):(a.start("height",280+Ptz_Menu_Height,0),$("b_xl").className="b_down",$("tiaojie").style.display="")});
	
	addEventPTZ("b_yzws", "Preset", 	0,  0,  0,  19);
	addEventPTZ("b_yzwc", "Preset Call",0,  0,  0,  20);
	addEventPTZ("b_light", "Lighting", 	13, 14, 0, 0);
	addEventPTZ("b_brush", "Wiper", 	15, 16, 0, 0);

	switch(CMDVALUE){
//1:2路 4路DVS-0x01.2:单路DVS-0x02.3:960H-0x03.4:720P CCD-0x04.
//16:WDR-0x10.17:低端-0x11.18:中端,低照-0x12.19:高端,超低照-0x13.
//32:低照-0x20.33:低成本-0x21.49:500W-0x31.
	case 1:	case 2:	case 3:case 4:case 16:	case 17:case 18:case 19:case 32:case 33:case 49:
		$("pev_xbtm").style.display = "";
		$("pev_btm").style.display = "none";
		$("yzw").style.display = "";
		$("gjxx").style.display = "none";
	break;
//34:一体机芯-0x22.80:日立110-0x50.81:日立220-0x51.82:SONY 6300-0x52.
	case 34:case 80:case 81:case 82:
		$("pev_xbtm").style.display = "none";
		$("pev_btm").style.display = "";
		$("yzw").style.display = "none";
		$("gjxx").style.display = "";
		$("presetnum").length = 0;
		for(i=1;i<256;i++){
			$("presetnum").options[$("presetnum").length] = new Option(i,i);
		}
		$("presetnum").value = "1";	
	break;
	default:	//其他
	break;
	}	
}
function addEventPTZ(OBJ, ATTRTITLE, DOWNCMD, UPCMD, OUTCMD, CLICKCMD){
	if(DOWNCMD) $(OBJ).addEvent("mousedown",function(a){preventM(a);funPTZSub(DOWNCMD); $("ptzimg").src="../image/ptz/"+ OBJ +".png";});
	if(UPCMD) $(OBJ).addEvent("mouseup",function(a){preventM(a);funPTZSub(UPCMD);$("ptzimg").src="../image/ptz/p0.png";});
	if(OUTCMD) $(OBJ).addEvent("mouseout",function(a){preventM(a);funPTZSub(OUTCMD);});
	if(CLICKCMD) $(OBJ).addEvent("click",function(a){funPTZSub(CLICKCMD);});
	
}
function funPTZSub(CMDVALUE){
	var intNum	= parseInt(CMDVALUE);
	var wPTZData= parseInt($("t_bcn").innerHTML);
	var intData	= parseInt($("pv").value);
	var wPTZCmd	= intNum;
	var NVSObj	= $("WebCMS");
	if(isNaN(wPTZData)) wPTZData=50;
	if(isNaN(intData)) intData=1;
	switch(intNum){
		case 1:case 2:case 3:case 4:
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			PTZStop	= 0; PTZAuto = 0;
		break;
		case 11:case 12:	//云台控制 上下左右、自动开关
			if(!PTZAuto){wPTZCmd = 11; PTZAuto = 1;
			}else{wPTZCmd = 12; PTZAuto = 0;}
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			PTZStop	= 1;
		break;
		case 30:case 31:case 32:case 33:	//云台停止 上下左右
		//if(PTZStop==1||event.button==1){
			if(!PTZStop){
				NVSObj.PTZCtrl(wPTZCmd, wPTZData); PTZStop	= 1;
			}
		break;
		case 19:			//预设
			wPTZData = intData;
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			window.status = ALERTPRESETSET;
		break;
		case 20:			//调用
			wPTZData = intData;
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			window.status = ALERTPRESETCALL;
		break;
		case 5:case 6:case 7:case 8:case 9:case 10:
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			PTZStop	= 0;
		break;
		case 34:case 35:case 36:case 37:case 38:case 39:
		if(!PTZStop){
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
			PTZStop	= 1;
		}
		break;
		default:			//其他操作
			NVSObj.PTZCtrl(wPTZCmd, wPTZData);
		break;
	}
}
var arrAlarms = new Array();
var strBinary, nAlarmi;
function onAlarms(nALARMS){
	var bType = 0;
	var textAlarm;
	arrAlarms.length =0 ;
	strBinary	= "";
	nAlarmi	= 0;
	funToBinary(nALARMS);
	for(i=arrAlarms.length; i>=0; i--){
		switch(arrAlarms[i]){
		  case 0:case 1:case 2:case 3:
			textAlarm = ALERTSENSORALARM
			break;
		  case 4:case 5:case 6:case 7:
			textAlarm = ALERTMOTIONALARM;
			break;
		  case 8:case 9:case 10:case 11:
			textAlarm = ALERTLOSEALARM;
			break;
		  case 12:case 13:case 14:case 15:
			textAlarm = ALARTCLOSEALARM;
			bType  = 1;
			break;
		  default :
			textAlarm="";
			break;
		}
		if(textAlarm != ""){
			var daten;
			daten = new Date();
			var strHours = daten.getHours();
			var strMinutes = daten.getMinutes();
			var strSeconds = daten.getSeconds();
			var strNowTime = funFormatTime(strHours) + ":" + funFormatTime(strMinutes) + ":" + funFormatTime(strSeconds);
			textAlarm = strNowTime + textAlarm;
		}
		if(bType == 1 || nALARMS >= 4096) return false;
		$("d_alarmtip").style.display="";
		if(arrAlarms[i]>=12)i=-1;
	}
}
function funToBinary(nALARMS){
	var tmpAlarms	= nALARMS;
	if(tmpAlarms%2==0){
		strBinary =strBinary + "0";
	}else{
		strBinary =strBinary + "1";
		arrAlarms.push(nAlarmi);
	}
	nAlarmi++;
	tmpAlarms=parseInt(tmpAlarms/2);
	
	if(tmpAlarms<=0){
		strBinary = strBinary + "0";	
		return(strBinary);
	}else{
		funToBinary(tmpAlarms);
	}
}
function funFormatTime(pTime){
	var reStr = pTime.toString();if(reStr.length < 2){return("0" + reStr);}else{return(reStr);}
}

//刷新实时视频控制状态 0:复位状态, 1:刷新状态
function initState(CTRL_CMD){
	var i;
	if(!CTRL_CMD){
		bCALL	= 0;
		for(i=0; i<4; i++){
			bRECORD[i]	= 0;
			bLISTEN[i]	= 0;
		}
		bSCALE	= 0;
		bORIGINAL	= 0;
		if($("b_record"))$("b_record").className	= "leftbtn record";	//录像
		if($("b_talk"))$("b_talk").className	= "leftbtn talk";	//对讲
		if($("b_voice"))$("b_voice").className	= "leftbtn voice";	//监听
		if($("zoomin").value == "1"){$("WebCMS").ImageZoomIn(0); $("b_zoom").className = "leftbtn zoom"; $("zoomin").value = 0;}	//局部放大
		if($("b_scale"))$("b_scale").className	= "leftbtn scale";	//宽高比
		if($("b_original"))$("b_original").className	= "leftbtn original";	//原始大小
	}else{
	  try{
		var nWindows= parseInt($("nwindows").value);
		if(bRECORD[nWindows]){
			$("b_record").className	= "leftbtn record1";
		}else{
			$("b_record").className	= "leftbtn record";
		}
		if(bCALL){
			$("b_talk").className	= "leftbtn talk1";
		}else{
			$("b_talk").className	= "leftbtn talk";
		}
		if(bLISTEN[0]){
			$("b_voice").className	= "leftbtn voice1";
		}else{
			$("b_voice").className	= "leftbtn voice";
		}
		if($("zoomin").value == "2"){
			$("b_zoom").className	= "leftbtn zoom2";
		}else if($("zoomin").value == "1"){
			$("b_zoom").className	= "leftbtn zoom1";
		}else{
			$("b_zoom").className	= "leftbtn zoom";
		}
		if(bSCALE){
			$("b_scale").className	= "leftbtn scale";
		}else{
			$("b_scale").className	= "leftbtn scale";
		}
		if(bORIGINAL){
			$("b_original").className	= "leftbtn original1";
		}else{
			$("b_original").className	= "leftbtn original";
		}
	  }catch(e){}
	}
}
function enablepreset(){
	if($s("ckpreset").checked==false){
		setDisabled("b_yzs", 1);setDisabled("b_yzd", 1);
		setDisabled("presettitle", 1);$("presettitle").className="text distext";
	}else{
		setDisabled("b_yzs", 0);setDisabled("b_yzd", 0);
		setDisabled("presettitle", 0);$("presettitle").className="text";
	}
}
function hsvctrl(paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl){
	var tmpctrl,presetnum,presettitle,i;
	var devicetype = parseInt($("devicetype").value);
	tmpctrl	= paramctrl; presettitle	= "";
	switch(paramflag){
	case 3:
		$("ctrl"+nownum).className=""; $("ctrl"+nownum).className="a5 a5ac";
		$("ctrl"+oldnum).className=""; $("ctrl"+oldnum).className="a5 a5ac";
		$(paramobj).className=""; $(paramobj).className="a5 a5ed";
	break;
	case 5:
		if(paramcmd==6101||paramcmd==6102||paramcmd==6103){
			tmpctrl = parseInt($("presetnum").value); 
			if(isNaN(tmpctrl)){alert(ALERTPRESETNULL);return true;}
			if(tmpctrl<=0||tmpctrl>255){alert(ALERTPRESETLIMITS);return true;}
		}
		if(paramcmd==6101){
			presettitle = $("presettitle").value;
			if(presettitle==""){alert(ALERTPRESETTITLENULL);return true;}
			var tmppt	= presettitle.indexOf("||");
			if(tmppt!=-1){alert(ALERTPRESETTITLEERROR);return true;}
			$("presetstatus").value	= "1";
		}else if(paramcmd==6103){$("presetstatus").value = "0";}
	break;
	case 6:
		$("ctrl"+nownum).className=""; $("ctrl"+nownum).className="a5 a5ac";
		$("ctrl"+oldnum).className=""; $("ctrl"+oldnum).className="a5 a5ac";
		$(paramobj).className=""; $(paramobj).className="a5 a5ac";
	break;
	case 16:
		//$("ctrl"+nownum).className=""; $("ctrl"+nownum).className="btn3";
		//$("ctrl"+oldnum).className=""; $("ctrl"+oldnum).className="btn3";
		//$(paramobj).className=""; $(paramobj).className="btn3";
	break;
	default : break;
	}
	if(paramcmd==6201||paramcmd==6202||paramcmd==6203){
		tmpctrl	= parseInt($("scantype").value); if(isNaN(tmpctrl)){tmpctrl=1;}
	}
	btnsettinghsEx(6000,paramcmd,tmpctrl,presettitle);
}
