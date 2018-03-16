// JavaScript Document
var reSlider, rSV;
var bInitReplayOcx=0;
function initReplayPage(){
	loadReplayOcx();bInitReplayOcx=1;
	initRePage();
	if(typeof(reSlider)!="object")reSlider=new Slider($("psdm"), $("psdk"), {steps:100, wheel:!0, onChange:function(a){$("psdk").setProperty("title", a); rSV=a; setReSlider(rSV);} });
	reSlider.set(0);
	$("btnSearchRecord").addEvent("click", funSearch);
	$("btnPlay").addEvent("click", funReplayBtn);
	$("btnDown").addEvent("click", funDownloadFile);
	$("btnInfo").addEvent("click", funShowDonwloadInfo);
	setTimeout("initReplayOcx();", 1000);
}
function setReSlider(a){
	return false;
	try{
		if(a<=0||nTotalPlayTime<=0){return false;}
		var nWindow = parseInt($("nwindows").value);
		if(sEventName == "onmouseUp"){
			return false;
		}else if(sEventName == "onmouseDown"){
			$("ReVideoX").PLAY_Pause(nWindow);
			var movetime=parseInt(a/100*nTotalPlayTime);
			$("ReVideoX").PLAY_Seek(nWindow, movetime);
			$("ReVideoX").PLAY_Play(nWindow);
			return false;
		}
	}catch(e){}
}
var sEventName;
function onReBack(a){
	sEventName = a;	
}
function loadReplayOcx(){$("video2").innerHTML="<object name='ReVideoX' ID='ReVideoX' style='width:640px;height:480px;' CLASSID='CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6' codebase='/WebCMS.exe#Version=2,0,0,0'></object>"}
function initRePage(){
	try{
		var nRecord	= parseInt(getCookies("intSDRecord"));
		var nChan 	= parseInt(getCookies("intChannel"));
		var sellistsize = 21;
		if(nRecord){
			$("liStorage").style.display		= "";
			$("liShowDonwload").style.display	= "";
			
			$("storagetype").value = 0;
			sellistsize = sellistsize-4;
		}else{
			$("liStorage").style.display		= "none";
			$("liShowDonwload").style.display	= "none";
			
			$("storagetype").value		= 1;
		}
		if(nChan>1){
			var nnChan	= 8 - nChan;
			for(var i = 1; i <= nnChan; i++){
				$("selchannel").remove(nChan);
			}
			$("liChannel").style.display	= "";
			sellistsize = sellistsize-2;
		}else{
			$("liChannel").style.display	= "none";
		}
		//var b=new Date,c=b.getYear(),c=c<1900?c+1900:c;b.getDate()<2?b.getMonth()<1?($("bdt0").value=c-1,$("bdt1").value=12,$("bdt2").value=31):($("bdt0").value=c,$("bdt1").value=chk10(b.getMonth()),$("bdt2").value=getMonthDay("bdt")):($("bdt0").value=c,$("bdt1").value=chk10(b.getMonth()+1),$("bdt2").value=chk10(b.getDate()));
		var b=new Date,c=b.getYear(),c=c<1900?c+1900:c;$("bdt0").value=c,$("bdt1").value=chk10(b.getMonth()+1),$("bdt2").value=chk10(b.getDate());
		attachDateInput("bdt","btm");
		$("sellist").size = sellistsize;
	}catch(e){}
}
function initReplayOcx(){
	//$("ReVideoX").SetActive();
	$("ReVideoX").SetFullWindow(1);
	$("ReVideoX").ShowTips(0);
	$("ReVideoX").ShowAlarmDialog(0);
	$("ReVideoX").SetMouseEvent(0);
	$("ReVideoX").m_ProtocolType=0;
	$("ReVideoX").PLAY_InitPlayer();
	$("ReVideoX").PLAY_SetWindowNum(1);
}
function funChangeWindow(obj){
	var a, b, c_a, c_b;
	var tValue	= parseInt(obj.value);
	c_a	= parseInt($("video2").style.width);
	c_b	= parseInt($("video2").style.height);
	switch(tValue){
	case 0:
  		a = 4000; b = 3000;	break;
	case 1:
  		a = 16000; b = 9000; break;
	case 2:
  		a = 11000; b = 9000; break;
	case 10:
  		a = c_a; b = c_b; break;
	default:
  		a = c_a; b = c_b; break;
	}
	autoReplayWH(a, b, c_a, c_b);	
}
//适应宽高比
function autoReplayWH(V_W, V_H, C_W, C_H){
	var ImageWidth 		= parseInt(V_W);
	var ImageHeight 	= parseInt(V_H);
	var BodyWidth		= parseInt(C_W);
	var BodyHeight		= parseInt(C_H);
	var myos = appInfo(), osVersion = myos.version;
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
	 //alert("ImageWidth:" + ImageWidth + " ImageHeight:" + ImageHeight + " osVersion:" + osVersion + " ");
	if(ImageHeight <= BodyHeight){if(osVersion<9){$("ReVideoX").style.marginTop = ((BodyHeight-ImageHeight)/2) + "px";}else{$("ReVideoX").setStyle("paddingTop", ((BodyHeight-ImageHeight)/2) + "px");}}
	$("ReVideoX").style.width	= ImageWidth + "px";
	$("ReVideoX").style.height	= ImageHeight + "px";
}
function changeStorage(){
	if(parseInt($("nstorage").value)==1&&!parseInt($("storagetype").value)){
		$s("opType4").innerHTML	= REPLAYTYPE[2];
		$("liType").style.display	= "";
	}else{
		$s("opType4").innerHTML	= REPLAYTYPE[4];
		$("liType").style.display	= "";	//none 本地PC搜索也分类
	}
}
var ResultEx = 0;	//0：PC  >0：设备端(1-报警录像,2-计划录像,3-报警&计划录像,4-报警图片,5-计划图片,6-报警&计划图片)
function CBK_SearchResultProgress(szChannel, szFileName){
	$("sellist").options[$("sellist").length] = new Option(szFileName, szChannel);
	ResultEx = 0;
}
/*
//新的搜索回调 
nRecType//类型   1-报警录像,2-计划录像,3-报警&计划录像,4-报警图片,5-计划图片,6-报警&计划图片	
nChannel, //通道
nmark, //结束    1-最后一条，0-还有
szFileName, //开始结束时间   yyyymmddhhmmss-yyymmddhhmmss
nRecSize //数据大小
*/
function CBK_SearchResultProgressEx(nRecType, szChannel, nmark, szFileName, nRecSize){
	ResultEx = nRecType;
	if(szFileName == ""){return false;}
	var arrFileName = szFileName.split("-");
	var strstart 	= arrFileName[0];
	var strend	 	= arrFileName[1];
	var strstarth	= strstart.substr(8,2);
	var strstartm 	= strstart.substr(10,2);
	var strstarts 	= strstart.substr(12,2);
	var strendh 	= strend.substr(8,2);
	var strendm 	= strend.substr(10,2);
	var strends 	= strend.substr(12,2);
	var re = /-/g;
	var szdate	=dNowSearchDate.replace(re,"");
	var tmpFileName;
	
	if(nRecType>3){//图片
		tmpFileName = strstart;
		tmpFileName += ".jpg";
		$("sellist").options[$("sellist").length] = new Option(tmpFileName, szChannel);
	}else{//录像
		tmpFileName = strstarth + ":" + strstartm + ":" + strstarts + " ~ " + strendh + ":" + strendm + ":" + strends;
		$("sellist").options[$("sellist").length] = new Option(tmpFileName, szChannel);
	}
}
function CBK_OpenFileErr(CMDVALUE){
	var sAlert;
	switch(CMDVALUE){
	case 0:
  		sAlert = "";	//操作成功
		break;
	case 1:
  		sAlert = ALERTOPENFILEERROR1;
		break;
	case 2:
  		sAlert = ALERTOPENFILEERROR2;	
		break;
	case 3:
  		sAlert = ALERTOPENFILEERROR3;	
		break;
	case 4:	
  		sAlert = ALERTOPENFILEERROR4;	
		break;
	case 5:	
  		sAlert = ALERTOPENFILEERROR5;	
		break;
	case 6:	
  		sAlert = ALERTOPENFILEERROR6;	
		break;
	case 7:	
  		sAlert = ALERTOPENFILEERROR7;	
		break;
	case 102:case 103:case 104:case 105:	
  		sAlert = ALERTOPENFILEERROR10;	
		break;
	case 115:	
  		sAlert = ALERTOPENFILEERROR15;	
		break;
	case 117:	
  		sAlert = ALERTOPENFILEERROR17;	
		break;
	case 118:	
  		sAlert = ALERTOPENFILEERROR18;	
		break;
	default:
  		sAlert = ALERTOPENFILEERROR00;	
		break;
	}
  	sAlert = "Open File Error:" + CMDVALUE +  " - " + sAlert + " ," + ALERTOPENFILE;	
	window.status = sAlert;
}
//******************回放进度条*******************//
var nTotalPlayTime;
function CBK_PlayProgressEx(nChannel, nTotalTime, nUseTime){
	var nPlayTimes;
	var nWinstor	= parseInt($("winstor").value);
	var nWindow = parseInt($("nwindows").value);
	if( nWinstor != 2 && nWinstor != 4){return false;}
	try{
		nTotalPlayTime 	= parseInt(nTotalTime);
		nPlayTimes		= parseInt(nUseTime);
	}catch(e){return true;}
	if(nWindow != nChannel || nTotalPlayTime <= 0 || nPlayTimes < 0){return false;}
	if(nPlayTimes > nTotalPlayTime){return false;}
	reSlider.set(parseInt(nPlayTimes/nTotalPlayTime*100));
	if(nPlayTimes == 0 && nTotalPlayTime == 100){nTotalPlayTime = 0;}	//
	liPlayTime.innerHTML	= funStrToTime(nPlayTimes) + "/" + funStrToTime(nTotalPlayTime)
	if(nPlayTimes >= nTotalPlayTime){CBK_PlayProgressEx(nWindow, nTotalPlayTime, 0);}
}
var bPlayerStatus	= new Array(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);//打开、播放、暂停、停止、快退、快进、帧退、帧进、循环、抓拍、全屏、音频
function CBK_RefreshPlayStatus(nPLAY, nPAUSE, nSTOP, nBACK, nFORWARD, nSTEPBACK, nSTEPIN, nAUDIO, nLOOP, nCAPTURE){
	if(nPLAY==1){$("b_replay").className="repms replay";}else if(nPLAY==2){$("b_replay").className="repms replay1";}else{$("b_replay").className="repms replay2";}
	if(nPAUSE==1){$("b_repause").className="repms repause";}else if(nPAUSE==2){$("b_repause").className="repms repause1";}else{$("b_repause").className="repms repause2";}
	if(nSTOP==1){$("b_restop").className="repms restop";}else if(nSTOP==2){$("b_restop").className="repms restop1";}else{$("b_restop").className="repms restop2";}
	if(nBACK==1){$("b_refsbw").className="repms refsbw";}else if(nBACK==2){$("b_refsbw").className="repms refsbw1";}else{$("b_refsbw").className="repms refsbw2";}
	if(nFORWARD==1){$("b_refsfw").className="repms refsfw";}else if(nFORWARD==2){$("b_refsfw").className="repms refsfw1";}else{$("b_refsfw").className="repms refsfw2";}
	if(nSTEPBACK==1){$("b_refmbw").className="repms refmbw";}else if(nSTEPBACK==2){$("b_refmbw").className="repms refmbw1";}else{$("b_refmbw").className="repms refmbw2";}
	if(nSTEPIN==1){$("b_refmfw").className="repms refmfw";}else if(nSTEPIN==2){$("b_refmfw").className="repms refmfw1";}else{$("b_refmfw").className="repms refmfw2";}
	if(nLOOP==1){$("b_reloop").className="repms reloop";}else if(nLOOP==2){$("b_reloop").className="repms reloop1";}else{$("b_reloop").className="repms reloop2";}
	if(nCAPTURE==1){$("b_resnap").className="repms resnap";}else if(nCAPTURE==2){$("b_resnap").className="repms resnap1";}else{$("b_resnap").className="repms resnap2";}
	if(nAUDIO==1){$("b_revoice").className="repms revoice";}else if(nAUDIO==2){$("b_revoice").className="repms revoice1";}else{$("b_revoice").className="repms revoice2";}
	bPlayerStatus	= new Array(1, nPLAY, nPAUSE, nSTOP, nBACK, nFORWARD, nSTEPBACK, nSTEPIN, nLOOP, nCAPTURE, 1, nAUDIO);
	//alert("nPLAY"+nPLAY+" nPAUSE:"+nPAUSE+" nSTOP:"+nSTOP+" nBACK:"+nBACK+" nFORWARD:"+nFORWARD+" nSTEPBACK:"+nSTEPBACK+" nSTEPIN:"+nSTEPIN+" nAUDIO:"+nAUDIO+" nLOOP:"+nLOOP+" nCAPTURE:"+nCAPTURE);
}


var dNowSearchDate;		//当前搜索日期
function funSearch(){
	var bStopSearch;
	if(parseInt($("bSearch").value)==1){
		bStopSearch = $("ReVideoX").PLAY_StopSearchFile();
		if(!bStopSearch){return false;}
		$("bSearch").value = 0;
		$("btnSearchRecord").innerHTML = ATTRTITLESEARCH;
		return false;
	}
	var d = $("bdt0").value+"-"+$("bdt1").value+"-"+$("bdt2").value;
	dNowSearchDate = d;
	var nFrom 		= $("storagetype").value;
	var szNVSName 	= "DVS";
	var szURL 		= pageURL;
	var nSvrPort 	= parseInt(pagePort);
	var szUserName 	= pageUNAME;
	var szUserPwd 	= pagePASSWORD;
	var nRecType  = parseInt($("seltype").value);
	var nChannel = parseInt($("selchannel").value);
	var dTimeStart 	= "00:00", dTimeEnd 	= "23:59";
	if(nChannel < 1 || nChannel > 4) nChannel = 1;
	window.status			= "";
	$("sellist").length 	= 0;
	$("storagelist").value	= nFrom;
	$("bSearch").value 		= 1;
	$("btnSearchRecord").innerHTML = ATTRTITLESTOP;
	//alert("nFrom=" + nFrom + " szNVSName=" + szNVSName + " szURL=" + szURL + " nSvrPort=" + nSvrPort + " szUserName=" + szUserName + " szUserPwd=" + szUserPwd + " nRecType=" + nRecType + " nChannel=" + nChannel + " d=" + d + " dTimeStart=" + dTimeStart + " dTimeEnd=" + dTimeEnd);
	var bSearchRecord = $("ReVideoX").PLAY_SearchFile(nFrom, szNVSName, szURL, nSvrPort, szUserName, szUserPwd, nRecType, nChannel, d, dTimeStart, dTimeEnd);
	if(bSearchRecord == false){
		$("bSearch").value = 0;
		$("btnSearchRecord").innerHTML = ATTRTITLESEARCH;
		window.status = ALERTSEARCHFail;
	}
    return true;
}
function funDownloadFile(){
	var szFileName;
	var nListIndex = $("sellist").selectedIndex;
	if(nListIndex<0) return false;
	var szFileNames = $("sellist").options[nListIndex].outerText;
	var nChannel = parseInt($("sellist").options[nListIndex].value);
	if(isNaN(nChannel)||nChannel<0||nChannel>4) return false;
	var szFileNameArr = new Array();
	var szFileName;
	if(ResultEx>0&&ResultEx<4){
		var re = /-/g;
		var szdate		= dNowSearchDate.replace(re,"");
		szFileNameArr	= szFileNames.split("~");
		szFileName		= szFileNameArr[0].split(":");
		szFileNames		= trimEx(szdate) + trimEx(szFileName[0]) + trimEx(szFileName[1]) + trimEx(szFileName[2]);
		szFileName		= szFileNameArr[1].split(":");
		szFileNames		= szFileNames + "-" + trimEx(szdate) + trimEx(szFileName[0]) + trimEx(szFileName[1]) + trimEx(szFileName[2]);
		nChannel		= nChannel + 1;
		$("ReVideoX").PLAY_DownloadFile(nChannel,szFileNames);
	}else if(ResultEx>3&&ResultEx<=6){
		szFileNames		= trimEx(szFileNames) + "-00000000000000";
		nChannel		= nChannel + 1;
		$("ReVideoX").PLAY_DownloadFile(nChannel,szFileNames);
	}else{
		szFileNameArr 	= new Array();
		szFileNameArr	= szFileNames.split(".");
		szFileName 		= szFileNameArr[0];
		if(szFileNameArr[1] == "bmp" || szFileNameArr[1] == "jpg"){$("winstor").value = 3;}
		if($("storagetype").value == "0"){
			$("ReVideoX").PLAY_DownloadFile(nChannel,szFileNames);
		}
	}
}
function funShowDonwloadInfo(){
	$("ReVideoX").PLAY_ShowDownloadInfo(1);
}
function funReplayBtn(){
	funReplayFile("");
}
function funReplayFile(CMDVALUE){
	window.status = "";
	$("liPlayTime").innerHTML	= "";
	var sFileName = CMDVALUE;
	if(CMDVALUE==null||CMDVALUE==""||typeof(CMDVALUE)=="object"){
		var nListIndex = parseInt($("sellist").selectedIndex) ;
		if(nListIndex<0){return false;}
		sFileName = $("sellist").options[nListIndex].value;
	}
	if(sFileName == ""){return false;}
  	var nChannel = parseInt(sFileName);
  	var nWindow = $("nwindows").value;
	switch(parseInt($("storagelist").value)){
	case 0:
		$("winstor").value = 4;
		break;
	case 1:
		$("winstor").value = 2;
		break;
	default:
		$("winstor").value = 2;
		break;
	}
  	var szFileNames = $("sellist").options[$("sellist").selectedIndex].outerText;
	var szFileNameArr = new Array();
	var szFileName;
//ResultEx	//0：PC  >0：设备端(1-报警录像,2-计划录像,3-报警&计划录像,4-报警图片,5-计划图片,6-报警&计划图片)
	if(ResultEx>0&&ResultEx<4){	//新存储录像回放
		var re = /-/g;
		var szdate		= dNowSearchDate.replace(re,"");
		szFileNameArr	= szFileNames.split("~");
		szFileName		= szFileNameArr[0].split(":");
		szFileNames		= trimEx(szdate) + trimEx(szFileName[0]) + trimEx(szFileName[1]) + trimEx(szFileName[2]);
		szFileName		= szFileNameArr[1].split(":");
		szFileNames		= szFileNames + "-" + trimEx(szdate) + trimEx(szFileName[0]) + trimEx(szFileName[1]) + trimEx(szFileName[2]);
		nChannel		= nChannel + 1;
		$("liPlaySeek").style.display		= "";
		$("liPlayTime").style.display		= "";
		$("winstor").value = 2;
	}else if(ResultEx>3&&ResultEx<=6){	//新存储图片回放
		var re;
		re = /.jpg/g;
		szFileNameArr = szFileNames;
		szFileNames = szFileNameArr.replace(re, "");
		szFileNames	= trimEx(szFileNames) + "-00000000000000";
		nChannel	= nChannel + 1;
		$("liPlaySeek").style.display		= "none";
		$("liPlayTime").style.display		= "none";
		$("winstor").value = 1;
	}else{	//老存储或PC本地回放
		szFileNameArr	=szFileNames.split(".");
		szFileName =	szFileNameArr[0];
		if(szFileNameArr[1]=="bmp"||szFileNameArr[1]=="jpg"){
			$("winstor").value = 3;
			$("liPlaySeek").style.display	= "none";
			$("liPlayTime").style.display	= "none";
		}else{
			$("winstor").value = 4;
			$("liPlaySeek").style.display	= "";
			$("liPlayTime").style.display	= "";
		}
	}
	//alert(nWindow+" nChannel:"+nChannel+" szFileNames:"+szFileNames+" ResultEx:"+ResultEx);
	try{
		RtStopPlay();
	}catch(e){}
 	$("ReVideoX").PLAY_OpenPlayFile(nWindow, nChannel, szFileNames);
	setTimeout("$('ReVideoX').PLAY_Play("+nWindow+");", 1000);
	return false;
}
function goRepaly(a, b){
	if(a.className.indexOf("2")>0)return false;
	switch(b){
	case 1:	//打开
		funOpenPlayFile();
	break;
	case 2:	//播放
		funReplay();
	break;
	case 3:	//暂停
		funPause();
	break;
	case 4:	//停止
		funStop();
	break;
	case 5:	//快退
		funFastBack();
	break;
	case 6:	//快进
		funFast();
	break;
	case 7:	//帧退
		funFrameBack();
	break;
	case 8:	//帧进
		funFrame();
	break;
	case 9:	//循环
		funLoop();
	break;
	case 10:	//抓拍
		funCapture();
	break;
	case 11:	//全屏
		funFullScreen();
	break;
	case 12:	//声音 
		funPlayAudio();
	break;
	default :
	break;
	}
}
function funOpenPlayFile(){	//打开文件
	var intPlayTime;
	var nWindow = $("nwindows").value;
	try{
		funStop();
	}catch(e){}
	intPlayTime	= $("ReVideoX").PLAY_OpenPlayFile(nWindow,"","");
	try{
		$("b_reloop").className="repms reloop";
		$("b_revoice").className="repms revoice";
		funPlayStatus(0);
	}catch(e){}
	if(intPlayTime > 0){
		$("ReVideoX").PLAY_Play(nWindow);
		$("storagetype").value = 1;
		$("winstor").value = 4;
		try{
			$("divPlaySeek").style.display	= "";
			$("liPlayTime").style.display	= "";	
		}catch(e){}
	}
}
function funReplay(){		//播放
  	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_Play(nWindow);
}
function funPause(){		//文件播放暂停
 	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_Pause(nWindow);
}
function funStop(){			//文件播放停止
  	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_Stop(nWindow);
}
function funFastBack(){ 	//文件播放倒退
	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_FastBack(nWindow);
}
function funFast(){			//文件播放快进
  	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_FastGo(nWindow);
}
function funFrameBack(){	//文件帧回播
  	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_FrameBack(nWindow);
}
function funFrame(){		//文件帧播放
  	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_FrameGo(nWindow);
}
function funPlayAudio(Obj){	//声音开关
	var nWindow = $("nwindows").value;
	var winstornum = parseInt($("winstor").value);
	if((winstornum != 4)&&(winstornum != 2)){return false;}
	if(bPlayerStatus[11]==2){
		$("ReVideoX").PLAY_PlayAudio(nWindow,0);
		$("b_revoice").className="repms revoice";
		bPlayerStatus[11]	= 1;
	}else if(bPlayerStatus[11]==1){
		$("ReVideoX").PLAY_PlayAudio(nWindow,1);
		$("b_revoice").className="repms revoice1";
		bPlayerStatus[11]	= 2;
	}else{
		$("ReVideoX").PLAY_PlayAudio(nWindow,0);
		$("b_revoice").className="repms revoice2";
		bPlayerStatus[11]	= 0;
	}
}
function funLoop(Obj){		//循环播放
	var nWindow = $("nwindows").value;
	var winstornum = parseInt($("winstor").value);
	if(winstornum != 4){return false;}
	if(bPlayerStatus[8]==2){
		$("ReVideoX").PLAY_Loop(nWindow,0);
		$("b_reloop").className="repms reloop";
		bPlayerStatus[8]	= 1;
	}else if(bPlayerStatus[8]==1){
		$("ReVideoX").PLAY_Loop(nWindow,1);
		$("b_reloop").className="repms reloop1";
		bPlayerStatus[8]	= 2;
	}else{
		$("ReVideoX").PLAY_Loop(nWindow,0);
		$("b_reloop").className="repms reloop2";
		bPlayerStatus[8]	= 0;
	}
}
function funCapture(){		//抓图
	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_Capture(nWindow,1);
}
function funFullScreen(){		//全屏
	var nWindow = $("nwindows").value;
	$("ReVideoX").PLAY_FullScreen();
}
function funPlayStatus(CMDVALUE){
	bPlayerStatus	= new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
	CBK_RefreshPlayStatus(bPlayerStatus[1], bPlayerStatus[2], bPlayerStatus[3], bPlayerStatus[4], bPlayerStatus[5], bPlayerStatus[6], bPlayerStatus[7], bPlayerStatus[11], bPlayerStatus[8], bPlayerStatus[9]);
}
function funStrToTime(tSecs){
	var strtime,FTime,temptime;
	FTime="";
	strtime=tSecs%60;
	if(strtime>=10){
		FTime=":" + strtime + FTime;
	}else{
		FTime=":0" + strtime + FTime;
	}
	strtime=parseInt(tSecs/60)%60;
	if(strtime>=10){
		FTime=":" + strtime + FTime;
	}else{
		FTime=":0" + strtime + FTime;
	}

	strtime=parseInt(parseInt(tSecs/60)/60)%60;
	FTime=strtime + FTime;
	return(FTime);
}
