// Java Document
var isSetArea = true;
var SetAreaChannel	= parseInt(getCookies("intChannel"));
if(isNaN(SetAreaChannel)){SetAreaChannel = 1;}
SetAreaChannel	= SetAreaChannel - 1;
function initvideo(flag){
	if(flag==1){$s("MAnum").value = "0"; $s("ismask").value = "0";}
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

	var Strtitle	= pageURL + ":" +pagePort + ":" +pageUNAME + ":" +pagePASSWORD + " ChannelNum:" +ChannelNum
	//alert(Strtitle);
	//window.status	= Strtitle;
	$s("WebCMS").Login();
}

function DVSStartView(nResult,flag){
	if(nResult>=2){   
		$s("WebCMS").StartPreview();
	}else{
		window.status	= "login failure " + nResult;
	}
}

function Onbunloadclose(flag){
	if(flag==1){
		sumbitselclr();
		$s("WebCMS").ImageZoomIn(0);
	}
	$s("WebCMS").StopPreview();
	$s("WebCMS").Logout();
}


function sumbitselall(){			//全选屏蔽区域
  try{
	$s("WebCMS").SetArea(SetAreaChannel,1,0,0,704,576);
 }catch(e){}
	return false;
}
function sumbitselclr(){	//清除屏蔽区域
  try{
	$s("WebCMS").SetArea(SetAreaChannel,1,0,0,0,0);
  }catch(e){}
	var i;
	for(i=1;i<=4;i++){
		$s("nLeft"+i).value		= 0;
		$s("nTop"+i).value		= 0;
		$s("nWidth"+i).value	= 0;
		$s("nHeight"+i).value	= 0;
	}
	return false;
}
function closeinfo(){		//屏蔽开关
	$s("ismask").value	= "1";
	if ($s("MAnum").value == "0"){
		$s("btnMaskClear").disabled=false;$s("btnMaskClear").className="btn77 act";
		$s("btnMaskAll").disabled=false;$s("btnMaskAll").className="btn77 act";
		$s("btnMaskAreaSet").className="btn104 vis";$s("MAnum").value="1";
		
		if(isSetArea){		
//  nChannel  通道0 ~3 设置默认区域
//      nArea   区域编号, 1 ~ 4 
//      0   关闭设置 , 此时 nLeft＝nTop＝nWidth＝nHeight＝0
//      1~4 启动设置
//      nLeft ,nTop  某个区域的左上角坐标
//      nWidth,nHeight 某个区域的宽度，高度
			var i,nleft,nTop,nWidth,nHeight;
			for(i=1;i<=4;i++){
			  try{
				nLeft	= $s("nLeft"+i).value;
				nTop	= $s("nTop"+i).value;
				nWidth	= $s("nWidth"+i).value;
				nHeight	= $s("nHeight"+i).value;
				//alert(" nleft:"+nLeft+" nTop:"+nTop+" nWidth:"+nWidth+" nHeight:"+nHeight+" SetAreaChannel:"+SetAreaChannel+" i:"+i);
				$s("WebCMS").SetArea(SetAreaChannel,i,nLeft,nTop,nWidth,nHeight);
			  }catch(e){}
			}
			isSetArea = false;
		}
	}else{
		$s("btnMaskClear").disabled=true;$s("btnMaskClear").className="btn77 link";
		$s("btnMaskAll").disabled=true;$s("btnMaskAll").className="btn77 link";
		$s("btnMaskAreaSet").className="btn104 act";$s("MAnum").value="0";
	}
}

function sumbitok(){
  try{
	$s("WebCMS").GetArea(SetAreaChannel);
  }catch(e){}
}
//设置返回值;
//  nChannel  通道0 ~3
//      nAreaCount      有效区域总数
//      nArea   区域编号, 1 ~ 4 
//      0   关闭设置 , 此时 nLeft＝nTop＝nWidth＝nHeight＝0
//      1~4 启动设置
//      nLeft ,nTop  某个区域的左上角坐标
//      nWidth,nHeight 某个区域的宽度，高度
function SetGetArea(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight){
  try{
	if(nAreaCount==0||nArea<=0||nArea>4){
		var i;
		for(i=1;i<=4;i++){
			$s("nLeft"+i).value		= 0;
			$s("nTop"+i).value		= 0;
			$s("nWidth"+i).value		= 0;
			$s("nHeight"+i).value	= 0;
		}	
		window.status	= "OK!";
		$s("BtnSubmit").click();
	}else{
		$s("nLeft"+nArea).value		= nLeft;
		$s("nTop"+nArea).value		= nTop;
		$s("nWidth"+nArea).value		= nWidth;
		$s("nHeight"+nArea).value	= nHeight;
		if(nAreaCount == nArea){
			window.status	= ("succeed!");
			$s("BtnSubmit").click();
		}
	}
  }catch(e){
	window.status	= ("failure!");
	$s("BtnSubmit").click();
  }
//	for(i=1;i<=4;i++){
//		alert($s("nLeft"+i).value+":"+$s("nTop"+i).value+":"+$s("nWidth"+i).value+":"+$s("nHeight"+i).value);
//	}
}
