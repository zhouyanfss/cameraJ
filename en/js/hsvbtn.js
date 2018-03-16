// JavaScript Document
function initv(){
	var tmphs	= parseInt($s("hstype").value);

	if(tmphs==0){
		initcsatus();
	}else{
		initpsatus();
	}
	setTimeout("initvideo();", 320);

	var SaveYes = getCookies("SaveYes");
	if(SaveYes=="ok"){
		window.status = ALERTSAVESUCCESSED;
	}else{
		window.status = "";
	}
	setCookies("SaveYes","no",7);
	try{
		setTimeout("SliderExChange	= 1;",1500);	
		setTimeout("initSNOK	= 1;",1500);	
	}catch(e){
		SliderExChange	= 1;
		initSNOK		= 1;
	}
}
function initvideo(){
	var ChannelNum = nchannel;
	if(ChannelNum < 1 || isNaN(ChannelNum)){ChannelNum = 1;}
	//$s("WebCMS").m_szDeviceName	 = "NVS66163";
	$s("WebCMS").m_szUrl			= pageURL;
	$s("WebCMS").m_dwDataPort	= parseInt(pagePort);
	$s("WebCMS").m_szUserName	= pageUNAME;
	$s("WebCMS").m_szPassword	= pagePASSWORD;
	$s("WebCMS").m_ChnNo			= ChannelNum;
 
	$s("WebCMS").ShowTips(0);
	$s("WebCMS").ShowAlarmDialog(0);
	$s("WebCMS").SetFullWindow(1);
	$s("WebCMS").m_ProtocolType	= 0;
	$s("WebCMS").SetLoginMode(1);

	var Strtitle	= pageURL + ":" +pagePort + ":" +pageUNAME + ":" +pagePASSWORD
	//window.status	= Strtitle;
	$s("WebCMS").Login();
}
function initcsatus(){
	var i,tmpv,nnum,onum,pobj;
	var tmpirflag	= 1;
	var devicetype	= parseInt(getCookies("devicetype"));
	for(i=1;i<=10;i++){
		tmpv	= parseInt($s("status" + i).value);
		if(tmpv==1){
			nnum	= 2*i;
			onum	= 2*i-1;
		}else{
			nnum	= 2*i-1;
			onum	= 2*i;
		}
		if(nnum==11||nnum==12||nnum==13||nnum==14){continue;}
		if(5==i&&0==tmpv){	//背光补偿
//			$s("strctrl10").style.display	= "none"; 		//背光补偿
			if(devicetype != 34) $s("strctrl12").style.display	= ""; 			//宽动态模式
		}else if(5==i){
			$s("strctrl10").style.display=""; 
			if(devicetype != 34) $s("strctrl12").style.display="none"; 	
		}
		if(6==i&&0==tmpv){	//宽动态模式
			$s("strctrl10").style.display=""; 	
//			$s("strctrl12").style.display="none"; 	
		}else if(6==i){
			$s("strctrl10").style.display="none"; 	
			$s("strctrl12").style.display=""; 	
		}
		//hsvctrl(paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl);
		pobj	= "ctrl" + nnum;
		hsvctrl(pobj,nnum,onum,0,0,0);
	}
	tmpv	= parseInt($s("status11").value);
	if(tmpv==1){
		nnum	= 32;
		onum	= 31;
	}else{
		nnum	= 31;
		onum	= 32;
	}
	pobj	= "ctrl" + nnum;
	hsvctrl(pobj,nnum,onum,0,0,0);
	
	tmpv	= parseInt($s("status12").value);
	if(tmpv==1){
		pobj	= "ctrl34";
		nnum	= 33;
		onum	= 35;
	}else if(tmpv==2){
		pobj	= "ctrl35";
		nnum	= 33;
		onum	= 34;
	}else{
		pobj	= "ctrl33";
		nnum	= 34;
		onum	= 35;
	}
	hsvctrl(pobj,nnum,onum,3,0,0);
	
	tmpv	= parseInt($s("status13").value);
	var tmpAEValue	= parseInt(getCookies("AEVALUE"));
	if(tmpAEValue < 1 || tmpAEValue > 7){
		setCookies("AEVALUE", 2, 7);
	}
	if(tmpv<8&&tmpv>0){
		$s("aevalue").value			= tmpv;
		$s("ctrl47").className		= "";
		$s("ctrl47").className		= "btn2";
		if(devicetype!=82)
			$s("aevalue").style.display	= ""; 
		if(parseInt(tmpv)!=1&&parseInt(tmpv)!=4){
			tmpirflag	= 0;
		}
	setCookies("AEVALUE", tmpv, 7);
	}else if(tmpv<14&&tmpv>0){
		nnum	= tmpv+40;
		pobj	= "ctrl" + nnum;
		hsvctrl(pobj,nnum,nnum,10,0,tmpv);
	}
	if(tmpirflag==1){
		if(devicetype==82){
			//$s("TrIRcfCH6300Manual").style.display	= "";
			$s("TrIRTitle").style.display		= "none"; 
			$s("TrIRCtrl").style.display		= "none"; 
		}else{
			$s("strircftitle").style.display	= "";
			$s("strircfset").style.display		= "";
			$s("TrIRTitle").style.display		= ""; 
			$s("TrIRCtrl").style.display		= ""; 
		}
		$s("TrIRcf").style.display		= "none"; 
		$s("TrIRcfset").style.display	= "none"; 
	}else{
		if(devicetype==82){
			//$s("TrIRcfCH6300Manual").style.display	= "none";
			$s("TrIRTitle").style.display		= "none"; 
			$s("TrIRCtrl").style.display		= "none"; 
		}else{
			$s("strircftitle").style.display	= "none";
			$s("strircfset").style.display		= "none";
		}
	}
	if(devicetype==81||devicetype==82){	//8(SC220-1080p高清高速球)
		$s("TrAGCSC110T").style.display		= "none";
		$s("TrMode").style.display			= "none"; 
		
		tmpv	= parseInt($s("status4").value);
		if(tmpv==0){
			$s("TrAWBCtrl").style.display		= "";
			$s("TrAWBTable").style.display	= "none";
		}else{
			$s("TrAWBCtrl").style.display		= "none";
			$s("TrAWBTable").style.display	= "";
		}
		tmpv	= parseInt($s("status6").value);
		if(tmpv==1&&devicetype==81)
			$s("TrWDRCtrl").style.display	= "";
		else
			$s("TrWDRCtrl").style.display	= "none";
		tmpv	= parseInt($s("status7").value);
		if(tmpv==1&&(devicetype==81||devicetype==82)){
			$s("TrMirrorCtrl").style.display	= "";
		}else{
			$s("TrMirrorCtrl").style.display	= "none";
		}
	}else if(devicetype==34){	//自研机芯
		$s("TrZoom").style.display			= "none";	//变倍变速控制
		$s("strctrl12").style.display		= "none"; 	//宽动态模式
		$s("TrWDRCtrl").style.display		= "none"; 	//宽动态模式
		$s("TrMode").style.display			= "none"; 	//图像模式
		$s("Trepvalue").style.display		= "none"; 	//光圈优先
		$s("TrAGCSC110T").style.display		= "none"; 	//自动增益控制
		$s("strctrl10").style.display		= "none"; 	//背光补偿
		
		$s("TrAWBCtrl").style.display		= "none";
		$s("TrWDRCtrl").style.display		= "none";
	}else{
		$s("TrAWBCtrl").style.display		= "none";
		$s("TrWDRCtrl").style.display		= "none";
	}
	
	tmpv	= parseInt($s("status14").value);
	if(tmpv==1){
		nnum	= 37;
		onum	= 36;
	}else{
		nnum	= 36;
		onum	= 37;
	}
	pobj	= "ctrl" + nnum;
	hsvctrl(pobj,nnum,onum,0,0,0);

//背光补偿 值初始化处理
/*	var tmpvalue	= parseInt($s("blcvalue").value)
	$s("strsat").innerHTML	= tmpvalue;
	$s("mysat").value = Math.round((tmpvalue)*100/255);
	if($s("ctrl10").className=="btn2"){	
			if(devicetype==12){
				$s("TrBLCTable").style.display="none"; 
			}else{
				$s("TrBLCTable").style.display="";
			}
	}
*/
	if(parseInt($s("vBLCLevel").value)>=0){
		$s("liBLCLevel").style.display	= "";
		//$s("myblc").value	= parseInt($s("vBLCLevel").value);
	}else{
		$s("liBLCLevel").style.display	= "none";	
	}
	var flagopen	= 0;
	if(parseInt($s("vAWBRed").value)>=0){
		$("liWBRed").style.display = ""; flagopen = 1;
	}else{$("liWBRed").style.display = "none";}
	if(parseInt($s("vAWBGreen").value)>=0){
		$("liWBGre").style.display = ""; flagopen = 1;
	}else{$("liWBGre").style.display = "none";	}
	if(parseInt($s("vAWBBlue").value)>=0){
		$s("liWBBlu").style.display = ""; flagopen = 1;
	}else{$s("liWBBlu").style.display = "none";}
	isAWBTab	= flagopen;
	if(devicetype==82){
		if(parseInt($s("ircfvalue").value)>=0){$s("liIRcf2").style.display = "";
		}else{$s("liIRcf2").style.display = "none";}
	}else{
		if(parseInt($s("ircfvalue").value)>=0){$s("liIRcf").style.display	= "";
		}else{$s("liIRcf").style.display	= "none";}
	}
	//20110523
	if(parseInt($s("maximumagc").value)>=0){
		$s("liAGCMax").style.display	= "";	
		$s("TrAGCSC220T").style.display	= "";	
	}
	initColor(devicetype);
	initIris(devicetype);
	
	if(devicetype==82){
		tmpv	= parseInt($s("reductionvalue").value);	//噪声抑制
		if(tmpv==1){
			nnum	= 22;
			onum	= 21;
		}else{
			nnum	= 21;
			onum	= 22;
		}
		pobj	= "ctrl" + nnum;
		hsvctrl(pobj,nnum,onum,0,0,0);
		if(parseInt($s("reductionlevel").value)>=0){
			//$s("myrest").value	= parseInt($s("reductionlevel").value);
		}		
		
		tmpv	= parseInt($s("resolusionvalue").value);	//高解析度
		if(tmpv==1){
			nnum	= 24;
			onum	= 23;
		}else{
			nnum	= 23;
			onum	= 24;
		}
		pobj	= "ctrl" + nnum;
		hsvctrl(pobj,nnum,onum,0,0,0);
	}
	if(devicetype==82){
		tmpv	= parseInt($s("autoircfvalue").value);	//自动彩转黑
		if(tmpv==1){
			nnum	= 39;
			onum	= 38;
		}else{
			nnum	= 38;
			onum	= 39;
		}
		pobj	= "ctrl" + nnum;
		hsvctrl(pobj,nnum,onum,0,0,0);
	}
}

function initpsatus(){
	var i,tmpv,nnum,onum,pobj;
	var tmpflag;
	for(i=1;i<=7;i++){
		tmpv	= parseInt($s("status" + i).value);
		tmpflag = true;
		if(tmpv==1){
			if(i==3){
				nnum	= 2*i-1;
				onum	= 2*i;
			}else{
				tmpflag=false;
				nnum	= 2*i;
				onum	= 2*i-1;
			}
		}else{
			if(i==3) tmpflag=false;
			nnum	= 2*i-1;
			onum	= 2*i;
		}
		//hsvctrl(paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl);
		if(nnum==11||nnum==12||nnum==13||nnum==14){continue;}
		if(tmpflag==true){
			pobj	= "ctrl" + nnum;
			hsvctrl(pobj,nnum,onum,0,0,0);
		}
	}
}

function DVSStartView(nResult){
	if(nResult>=2){   
		$s("WebCMS").StartPreview();
	}else{
		window.status	= ALERTVIEWLOGINERRORCODE1 + " " + nResult;
	}
}
function Onbunloadclose(){
	$s("WebCMS").StopPreview();
	$s("WebCMS").Logout();
}
/*paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl
paramobj：	对象名称
nownum：	选中当前对象
oldnum：	选中当前对应对象
paramflag：	0 两按钮 1一按钮
paramcmd：	操作命令指令
paramctrl：	操作数据
*/
function hsvctrl(paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl){
	var tmpctrl;
	var presetnum,presettitle,i;
	var devicetype 	= parseInt(getCookies("devicetype"));
	tmphs	= parseInt($s("hstype").value);
	tmpctrl	= paramctrl;
	presettitle	= "";
	if(paramflag==0){
		$s("ctrl"+nownum).className="";
		$s("ctrl"+nownum).className="btn2";
		if(oldnum!=6){
			$s("ctrl"+oldnum).className="";
			$s("ctrl"+oldnum).className="btn1";
		}
		if(12==nownum&&11==oldnum&&tmphs==0){
			$s("strctrl10").style.display="none"; 	
			$s("TrBLCTable").style.display="none"; 
		}else if(11==nownum&&12==oldnum&&tmphs==0){
			$s("strctrl10").style.display=""; 			
			if($s("ctrl10").className=="btn2"){	
			if(devicetype==82){$s("TrBLCTable").style.display="none"; 
			}else{$s("TrBLCTable").style.display="";}
			}
		}
		if(10==nownum&&9==oldnum&&tmphs==0){
			$s("strctrl12").style.display="none"; 
			if(devicetype==82){
				$s("TrBLCTable").style.display="none"; 
			}else{
				$s("TrBLCTable").style.display="";
				initBLCSlider();
			}
		}else if(9==nownum&&10==oldnum&&tmphs==0){
			if(devicetype!=34) $s("strctrl12").style.display=""; 	
			$s("TrBLCTable").style.display="none"; 	
		}
		if(devicetype==82){
			if(31==nownum&&0==paramctrl&&tmphs==0){
				hsvctrl('ctrl38',38,39,0,5104,1);
			}else if(39==nownum&&0==paramctrl&&tmphs==0){
				hsvctrl('ctrl32',32,31,0,5101,1);
				$s("TrIRcfsetCH6300").style.display		= "";
	  			initIRcf2Slider();
			}else if(38==nownum&&1==paramctrl&&tmphs==0){
				$s("TrIRcfsetCH6300").style.display		= "none";
			}
		}
		
		if(tmphs==0&&nownum==7){	//白平衡控制
			if(devicetype==81||devicetype==82)
				$s("TrAWBCtrl").style.display	= ""; 	
			$s("TrAWBTable").style.display	= "none";
		}else if(tmphs==0&&nownum==8){
			$s("TrAWBCtrl").style.display	= "none";
			$s("TrAWBTable").style.display	= "";
		  	initWBSlider();		//白平衡 红 绿 蓝
		}else if(tmphs==0&&nownum==12){	//宽动态模式
			if(devicetype==81)
				$s("TrWDRCtrl").style.display	= ""; 	
		}else if(tmphs==0&&nownum==11){
			$s("TrWDRCtrl").style.display	= "none"; 	
		}else if(tmphs==0&&nownum==14){	//镜像
			if(devicetype==81||devicetype==82)
				$s("TrMirrorCtrl").style.display	= ""; 	
		}else if(tmphs==0&&nownum==13){
			$s("TrMirrorCtrl").style.display	= "none"; 	
		}else if(tmphs==0&&nownum==22){
			$s("TrRestrainLev").style.display	= ""; 
			initRestrainSlider();
		}else if(tmphs==0&&nownum==21){
			$s("TrRestrainLev").style.display	= "none"; 	
		}
/*	}else if(paramflag==41){
		$s("btnIris"+nownum).className="";
		$s("btnIris"+nownum).className="btn2";
		$s("btnIris"+oldnum).className="";
		$s("btnIris"+oldnum).className="btn1";
		
		if(tmphs==0&&nownum==0){	//白平衡控制
			$s("liIris").style.display		= "none";
		}else if(tmphs==0&&nownum==1){
			$s("liIris").style.display		= "";
			$s("DivIrisTab").style.display	= "";
			initIrisSlider();
		}
*/	}else if(paramflag==3){
		$s("ctrl"+nownum).className="";
		$s("ctrl"+nownum).className="btn1";
		$s("ctrl"+oldnum).className="";
		$s("ctrl"+oldnum).className="btn1";
		$s(paramobj).className="";
		$s(paramobj).className="btn2";
	}else if(paramflag==5){
		if(paramcmd>6100&&paramcmd<6110){
			presetnum = $s("presetnum").value;
			if(presetnum==""){
				alert(ALERTPRESETNULL);
				return true;
			}
			tmpctrl	= parseInt(presetnum);
			if(tmpctrl<=0||tmpctrl>255){
				alert(ALERTPRESETLIMITS);
				return true;
			}
		}
		if(paramcmd==6101){
			presettitle = $s("presettitle").value;
			if(presettitle==""){
				alert(ALERTPRESETTITLENULL);
				return true;
			}
			var tmppt	= presettitle.indexOf("||");
			if(tmppt!=-1){
				alert(ALERTPRESETTITLEERROR);
				return true;
			}
			$s("presetstatus").value	= "1";
		}else if(paramcmd==6103){
			$s("presetstatus").value	= "0";
		}
	}else if(paramflag==6){
		$s("ctrl"+nownum).className="";
		$s("ctrl"+nownum).className="btn1";
		$s("ctrl"+oldnum).className="";
		$s("ctrl"+oldnum).className="btn1";
		$s(paramobj).className="";
		$s(paramobj).className="btn1";
	}else if(paramflag==16){
		$s("ctrl"+nownum).className="";
		$s("ctrl"+nownum).className="btn3";
		$s("ctrl"+oldnum).className="";
		$s("ctrl"+oldnum).className="btn3";
		$s(paramobj).className="";
		$s(paramobj).className="btn3";
	}else if(paramflag==9){
		//$s("ctrl"+nownum).className="";
		//$s("ctrl"+nownum).className="btn1";
		$s("ctrl"+oldnum).className="";
		$s("ctrl"+oldnum).className="btn1";
	}else if(paramflag==1){
		var nnum,pobj;
		for(i=13;i<=22;i++){
			nnum	= i+28;
			//hsvctrl(paramobj,nownum,oldnum,paramflag,paramcmd,paramctrl);
			pobj	= "ctrl" + nnum;
			if(pobj!=paramobj){
				$s(pobj).className="";
				$s(pobj).className="btn1";
				switch(nnum){
				  case 48:
					 $s("spvalue").style.display	= "none";
				  break;
				  case 49:
					 $s("epvalue").style.display	= "none";
				  break;
				  case 50:
					 $s("liAutoAGCLevel").style.display	= "none";
				  break;
				  default :
				  break;
				}
			}
		}
		if(paramflag!=9){
			$s(paramobj).className="";
			$s(paramobj).className="btn2";
		}
		//if($s(paramobj).className=="btn2"){
			//$s(paramobj).className="";
			//$s(paramobj).className="btn1";
			//tmpctrl	= 0;
		//}else{
			//$s(paramobj).className="";
			//$s(paramobj).className="btn2";
		//}
		switch(nownum){
		  case 48:
		 	 if($s(paramobj).className=="btn2")
				$s("spvalue").style.display	= "";
			 else
				$s("spvalue").style.display	= "none";
		  break;
		  case 49:
		 	 if($s(paramobj).className=="btn2")
				$s("epvalue").style.display	= "";
			 else
				$s("epvalue").style.display	= "none";
		  break;
		  case 50:
		 	 if($s(paramobj).className=="btn2")
				$s("liAutoAGCLevel").style.display	= "";
			 else
				$s("liAutoAGCLevel").style.display	= "none";
		  break;
		  default :
		  break;
		}
	}else if(paramflag==10){
		var paramobj,paramvalue,tmpreturn;
		var maxi	= 50;
		if(devicetype==8) maxi = 49;
		if(devicetype==82) maxi = 53;
		for(i=47;i<=maxi;i++){
			paramobj	= "ctrl"+i;
			switch(i){
			  case 47:
			  	if(devicetype==82)
					paramvalue = "NULL";
				else
					paramvalue = "aevalue";
			  break;
			  case 48:
				paramvalue = "spvalue";
			  break;
			  case 49:
				paramvalue = "epvalue";
			  break;
			  case 50:
				paramvalue = "liAutoAGCLevel";
			  break;
			  case 51:
				paramvalue = "NULL";
			  break;
			  case 52:
				paramvalue = "liSlowLevel";
			  break;
			  case 53:
				paramvalue = "NULL";
			  break;
			  default :
				paramvalue = "aevalue";
			  break;
			}
			if(nownum==i){
				tmpreturn = chgautoae(paramobj,paramvalue,1,i);
				if(tmpreturn>=0) tmpctrl= tmpreturn;
			}else{
				chgautoae(paramobj,paramvalue,0,i);
			}
		}
		if(nownum==50){
			initAutoAGCPTZSlider();
		}else if(nownum==52){
			initSlowLevSlider();
		}
	}else{
		if(paramcmd==0){		//返回状态值
			if(tmpctrl==0){
				$s(paramobj).className="";
				$s(paramobj).className="btn1";
			}else{
				$s(paramobj).className="";
				$s(paramobj).className="btn2";
			}
		}else{
			if($s(paramobj).className=="btn2"){
				$s(paramobj).className="";
				$s(paramobj).className="btn1";
				tmpctrl	= 0;
			}else{
				$s(paramobj).className="";
				$s(paramobj).className="btn2";
				tmpctrl	= 1;
			}
		}
		switch(nownum){
		  case 47:
		 	 if($s(paramobj).className=="btn2"&&devicetype!=82)
				$s("aevalue").style.display	= "";
			 else
				$s("aevalue").style.display	= "none";
		  break;
		  case 48:
		 	 if($s(paramobj).className=="btn2")
				$s("spvalue").style.display	= "";
			 else
				$s("spvalue").style.display	= "none";
		  break;
		  case 49:
		 	 if($s(paramobj).className=="btn2")
				$s("epvalue").style.display	= "";
			 else
				$s("epvalue").style.display	= "none";
		  break;
		  case 50:
		 	 if($s(paramobj).className=="btn2")
				$s("liAutoAGCLevel").style.display	= "";
			 else
				$s("liAutoAGCLevel").style.display	= "none";
		  break;
		  default :
		  break;
		}
	}
	if(paramcmd==0) return true;
	if(paramcmd==6201||paramcmd==6202||paramcmd==6203){
		if(document.all.scantype[0].checked==true){
			tmpctrl	= 1;
		}else if(document.all.scantype[1].checked==true){
			tmpctrl	= 2;
		}
	}
	if(paramcmd<6000)
		btnsettinghsEx(5000,paramcmd,tmpctrl,presettitle);
	else
		btnsettinghsEx(6000,paramcmd,tmpctrl,presettitle);
	if(devicetype==8&&tmphs==0&&nownum==14){	//SC220，镜像开启时，默认模式
		$s("mirrormode").value	= 0; 	
	}
	if((devicetype==12||devicetype==19)&&tmphs==0&&nownum==14){	//索尼机芯，镜像开启时，默认模式
		$s("mirrormode").value	= 1;
	}
//	alert(paramcmd + ":" + tmpctrl + ":" + presettitle);
}

function chgautoae(paramobj,paramobjv,paramflag,nownum){
	var tmpvalue,tmpreturn;
	var devicetype 	= parseInt(getCookies("devicetype"));
	tmpreturn	= -1;
	if(paramflag==0){
			$s(paramobj).className	= "";
			$s(paramobj).className	= "btn1";
			if(paramobjv != "NULL"){$s(paramobjv).style.display="none";}
}else{
//		alert(paramobj+" : " + paramobjv+" : " + paramflag+" : " + nownum);
		tmpvalue = 0;
		if($s(paramobj).className=="btn1"){
			$s(paramobj).className	= "";
			$s(paramobj).className	= "btn2";
			if(paramobjv != "NULL") $s(paramobjv).style.display	= "";
			
			if(nownum==47){
				//tmpvalue	= $s("aevalue").value;
				//tmpreturn	= tmpvalue;		
				//20130107
				var tmpAEValue	= parseInt(getCookies("AEVALUE"));
				$s("aevalue").value	= tmpAEValue;
				tmpreturn	= tmpAEValue;		
			}else{
				openIRDSS(devicetype);
			}
		}else if(0==1){ //可编程自动曝光控制模式 多选一(必选一个)	
			$s(paramobj).className	= "";
			$s(paramobj).className	= "btn1";
			if(paramobjv != "NULL") $s(paramobjv).style.display	= "none";
			tmpreturn = 0;			
			openIRDSS(devicetype);
		}
		
		if(parseInt(tmpvalue)==1||parseInt(tmpvalue)==4){
			openIRDSS(devicetype);
		}else if(tmpvalue!=0){
			if(devicetype==82){
				//$s("TrIRcfCH6300Manual").style.display	= "none";
				$s("TrIRTitle").style.display		= "none"; 
				$s("TrIRCtrl").style.display		= "none"; 
			}else{
				$s("strircftitle").style.display	= "none";
				$s("strircfset").style.display		= "none";
			}
			if(devicetype==81){	//8(SC220-1080p高清高速球)
				$s("TrIRTitle").style.display		= "none"; 
				$s("TrIRCtrl").style.display		= "none"; 
				$s("TrIRcf").style.display			= ""; 
				$s("TrIRcfset").style.display		= ""; 
			}
		}
		if(51 == nownum){$s("liImagesBri").style.display	= "";}
	}
	return tmpreturn;
}
function openIRDSS(devicetype){
	if(devicetype==82){
		//$s("TrIRcfCH6300Manual").style.display	= "";
		$s("TrIRTitle").style.display		= "none"; 
		$s("TrIRCtrl").style.display		= "none"; 
	}else{
		$s("strircftitle").style.display	= "";
		$s("strircfset").style.display		= "";
		$s("TrIRTitle").style.display		= ""; 
		$s("TrIRCtrl").style.display		= ""; 
	}
	$s("TrIRcf").style.display			= "none"; 
	$s("TrIRcfset").style.display		= "none"; 
}
function chghsv(paramflag,paramcmd,paramctrl){
//	alert(paramflag+" : "+paramcmd+" : "+paramctrl)
	var presetnum	= paramctrl;
	var devicetype 	= parseInt(getCookies("devicetype"));
	if(paramcmd==6104){
		presetnum = $s("presetnum").value;
		if(presetnum==""||presetnum=="0"){
			return true;
		}
	}else if(paramcmd==5201){
		setCookies('AEVALUE', paramctrl, 7);
		if(parseInt(paramctrl)==1||parseInt(paramctrl)==4){
			openIRDSS(devicetype);
		}else if(paramctrl!=0){
			if(devicetype==82){
				//$s("TrIRcfCH6300Manual").style.display	= "none";
				$s("TrIRTitle").style.display	= "none"; 
				$s("TrIRCtrl").style.display	= "none"; 
			}else{
				$s("strircftitle").style.display	= "none";
				$s("strircfset").style.display		= "none";
			}
			if(devicetype==81){	//8(SC220-1080p高清高速球)
				$s("TrIRTitle").style.display	= "none"; 
				$s("TrIRCtrl").style.display	= "none"; 
				$s("TrIRcf").style.display			= ""; 
				$s("TrIRcfset").style.display		= ""; 
			}
		}
	}
	btnsettinghsEx(paramflag,paramcmd,presetnum,"");
}