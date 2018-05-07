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
	//alert("清除");
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
		$s("btnMaskAll").disabled=false;
		$s("btnMaskAll").className="btn77 act";
		$s("btnMaskAreaSet").className="btn104 vis";$s("MAnum").value="1";
		
		if(isSetArea){		
//  nChannel  通道0 ~3 设置默认区域
//      nArea   区域编号, 1 ~ 4 
//      0   关闭设置 , 此时 nLeft＝nTop＝nWidth＝nHeight＝0
//      1~4 启动设置
//      nLeft ,nTop  某个区域的左上角坐标
//      nWidth,nHeight 某个区域的宽度，高度
			var i,nleft,nTop,nWidth,nHeight,jingxiang,fanzhuan,a=0,wch,hcw;
			jingxiang  = parseInt($s("jingxiang").value);
			fanzhuan   = parseInt($s("fanzhuan").value);
			xuanzhuan  = parseInt($s("xuanzhuan").value);
			nEncWidth  = parseInt($s("nEncWidth").value);
			nEncHeight  = parseInt($s("nEncHeight").value);
 
			for(i=1;i<=4;i++){
			  try{
			    nWidth	= parseInt($s("nWidth"+i).value);
				nHeight	= parseInt($s("nHeight"+i).value);
				if(jingxiang) 
					nLeft	= 704-(parseInt($s("nLeft"+i).value) + nWidth);
				else
					nLeft	= $s("nLeft"+i).value;
					
				if(fanzhuan) 
					nTop	= 576-(parseInt($s("nTop"+i).value) + nHeight);
				else
					nTop	= $s("nTop"+i).value;
				
				if(xuanzhuan == 1&&nLeft!=576)
				{
					hcw = nEncHeight/nEncWidth;
					wch = nEncWidth/nEncHeight;
					
					a = parseInt(nTop);
					nTop= nLeft*wch*wch;
					nLeft = parseInt(704 -(a+nHeight)*hcw*hcw);	
					
					nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
					nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;

				}
				else if(xuanzhuan == 2&&nLeft!=576)
				{
					
					hcw = nEncHeight/nEncWidth;
					wch = nEncWidth/nEncHeight;
					
					a = parseInt(nLeft);
					nLeft = nTop*hcw*hcw;
					nTop = parseInt(576 - (a+nWidth)*wch*wch);	
					
					nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
					nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;
					
				}
				
				//alert(" nleft:"+nLeft+" nTop:"+nTop+" nWidth:"+nWidth+" nHeight:"+nHeight);
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

function sumbitselallex(drawtype){			//全选屏蔽区域
  try{
	//$s("WebCMS").SetArea(SetAreaChannel,1,0,0,704,576);
	$s("WebCMS").SetDrawCoordinate(SetAreaChannel,1,1,drawtype,0,0, 0, 704, 0, 0, 576, 704, 576);
 }catch(e){}
	return false;
}
function sumbitselclrex(drawtype){	//清除屏蔽区域
  try{
	//$s("WebCMS").SetArea(SetAreaChannel,1,0,0,0,0);
	$s("WebCMS").SetDrawCoordinate(SetAreaChannel,1,0,drawtype,0,0, 0, 0, 0, 0, 0, 0, 0);
  }catch(e){}
	var i;
	for(i=1;i<=4;i++){
		$s("nX1_"+i).value		= 0;
		$s("nY1_"+i).value		= 0;
		$s("nX2_"+i).value	= 0;
		$s("nY2_"+i).value	= 0;
		$s("nX3_"+i).value		= 0;
		$s("nY3_"+i).value		= 0;
		$s("nX4_"+i).value	= 0;
		$s("nY4_"+i).value	= 0;
	}
	return false;
}
function closeinfoex(drawtype){		//屏蔽开关 ldDrawType:画图的类型（1、直线，2、矩形；3、三角形；4、不规则四边形）
	$s("ismask").value	= "1";
	if ($s("MAnum").value == "0"){
		$s("btnMaskClear").disabled=false;$s("btnMaskClear").className="btn77 act";
		$s("btnMaskAll").disabled=false;$s("btnMaskAll").className="btn77 act";
		$s("btnMaskAreaSet").className="btn104 vis";$s("MAnum").value="1";
		
		if(isSetArea){		
 			OninitDrawEx(drawtype);
			isSetArea = false;
		}
	}else{
		$s("btnMaskClear").disabled=true;$s("btnMaskClear").className="btn77 link";
		$s("btnMaskAll").disabled=true;$s("btnMaskAll").className="btn77 link";
		$s("btnMaskAreaSet").className="btn104 act";$s("MAnum").value="0";
	}
	$s("WebCMS").SetDrawCoordinate(SetAreaChannel,1,2,drawtype,0,0, 0, 0, 0, 0, 0, 0, 0);	//2为开始画线
}

function OninitDrawEx(drawtype)	//ldDrawType:画图的类型（1、直线，2、矩形；3、三角形；4、不规则四边形）
{
		//当前画线初始化
		/*
		*函数名：SetDrawCoordinateData
		*作用：设置图形的坐标点
		*参数：
		nChannel:通道号
		nAreaIndex:区域索引（除直线外，其他图像最多可以画4个）
		nDrawFlag:画图标志 0--清除 1--初始化 2--开始画图  3--关闭
		ldDrawType:画图的类型（1、直线，2、矩形；3、三角形；4、不规则四边形）
		ldDirection:直线时，箭头的方向
		x1, y1, x2, y2, x3, y3, x4, y4：分别表示图形的坐标（直线和矩形时x1, y1, x2, y2有效，
		三角形时x1, y1, x2, y2, x3, y3有效，不规则四边形时x1, y1, x2, y2, x3, y3, x4, y4有效）
		*/
		//SetDrawCoordinate(short nChannel, short nAreaIndex, short nDrawFlag, short nDrawType, short nDirection, long x1, long y1, long x2, long y2, long x3, long y3, long x4, long y4) 
		
			var i,nleft,nTop,nWidth,nHeight,jingxiang,fanzhuan,a=0,wch,hcw;
			jingxiang  = parseInt($s("jingxiang").value);
			fanzhuan   = parseInt($s("fanzhuan").value);
			xuanzhuan  = parseInt($s("xuanzhuan").value);
			nEncWidth  = parseInt($s("nEncWidth").value);
			nEncHeight  = parseInt($s("nEncHeight").value);
			
			var x1,y1,x2,y2,x3,y3,x4,y4,direction;
 
			for(i=1;i<=4;i++){
			  try{
				if(jingxiang)
				{
					x1 = 704 - parseInt($s("nX1_"+i).value);
					x2 = 704 - parseInt($s("nX2_"+i).value);
					x3 = 704 - parseInt($s("nX3_"+i).value);
					x4 = 704 - parseInt($s("nX4_"+i).value);			
				}
				else
				{
					x1	= $s("nX1_"+i).value;
					x2	= $s("nX2_"+i).value;
					x3	= $s("nX3_"+i).value;
					x4	= $s("nX4_"+i).value;
				}
					
				if(fanzhuan)
				{
					y1	= 576 - parseInt($s("nY1_"+i).value);
					y2	= 576 - parseInt($s("nY2_"+i).value);
					y3	= 576 - parseInt($s("nY3_"+i).value);
					y4	= 576 - parseInt($s("nY4_"+i).value);
				}
				else
				{
					y1	= $s("nY1_"+i).value;
					y2	= $s("nY2_"+i).value;
					y3	= $s("nY3_"+i).value;
					y4	= $s("nY4_"+i).value;
				}
				/*
				if(xuanzhuan == 1&&x1!=576&&x2!=576&&x3!=576&&x4!=576)
				{
					hcw = nEncHeight/nEncWidth;
					wch = nEncWidth/nEncHeight;
					
					a = parseInt(nTop);
					nTop= nLeft*wch*wch;
					nLeft = parseInt(704 -(a+nHeight)*hcw*hcw);	
					
					nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
					nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;

				}
				else if(xuanzhuan == 2&&nLeft!=576)
				{
					
					hcw = nEncHeight/nEncWidth;
					wch = nEncWidth/nEncHeight;
					
					a = parseInt(nLeft);
					nLeft = nTop*hcw*hcw;
					nTop = parseInt(576 - (a+nWidth)*wch*wch);	
					
					nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
					nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;
					
				}
				*/
				direction = $s("nlinedirection"+i).value;
				//alert(" nleft:"+nLeft+" nTop:"+nTop+" nWidth:"+nWidth+" nHeight:"+nHeight);
				//$s("WebCMS").SetArea(SetAreaChannel,i,nLeft,nTop,nWidth,nHeight);
				//alert("("+x1+","+y1+")"+"("+x2+","+y2+")"+"("+x3+","+y3+")"+"("+x4+","+y4+")");
				$s("WebCMS").SetDrawCoordinate(SetAreaChannel,i,1,drawtype,direction,x1, y1, x2, y2, x3, y3, x4, y4);

			  }catch(e){}
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

function sumbitokex(){
  try{
	$s("WebCMS").GetDrawCoordinate(SetAreaChannel);
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
function SetGetAreaEx(nChannel,nAreaCount,nArea,nDrawType,nDirection,x1,y1,x2,y2,x3,y3,x4,y4){
  try{
	//alert("nAreaCount:"+nAreaCount+"nArea:"+nArea);
	if(nAreaCount==0||nArea<=0||nArea>4){
		var i;
		for(i=1;i<=4;i++){
			$s("nX1_"+i).value		= 0;
			$s("nY1_"+i).value		= 0;
			$s("nX2_"+i).value	= 0;
			$s("nY2_"+i).value	= 0;
			$s("nX3_"+i).value		= 0;
			$s("nY3_"+i).value		= 0;
			$s("nX4_"+i).value	= 0;
			$s("nY4_"+i).value	= 0;
		}	
		window.status	= "OK!";
		$s("BtnSubmit").click();
	}else{
		//alert("("+x1+","+y1+")"+"("+x2+","+y2+")"+"("+x3+","+y3+")"+"("+x4+","+y4+")");
		$s("nX1_"+nArea).value		= x1;
		$s("nY1_"+nArea).value		= y1;
		$s("nX2_"+nArea).value	= x2;
		$s("nY2_"+nArea).value	= y2;
		$s("nX3_"+nArea).value		= x3;
		$s("nY3_"+nArea).value		= y3;
		$s("nX4_"+nArea).value	= x4;
		$s("nY4_"+nArea).value	= y4;
		
		//if(nDrawType == 1)//直线 方向
		{
			$s("nlinedirection"+nArea).value = nDirection;
		}
		
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


function SetAreaToPreview(nDrawType){
	
	var nArea = 0;
	for(nArea=1;nArea<=4;nArea++)
	{
		$p("nX1_"+nArea).value		= $s("nX1_"+nArea).value;
		$p("nY1_"+nArea).value		= $s("nY1_"+nArea).value;
		$p("nX2_"+nArea).value	= $s("nX2_"+nArea).value;
		$p("nY2_"+nArea).value	= $s("nY2_"+nArea).value;
		$p("nX3_"+nArea).value		= $s("nX3_"+nArea).value;
		$p("nY3_"+nArea).value		= $s("nY3_"+nArea).value;
		$p("nX4_"+nArea).value	= $s("nX4_"+nArea).value;
		$p("nY4_"+nArea).value	= $s("nY4_"+nArea).value;
		
		$p("nlinedirection"+nArea).value = $s("nlinedirection"+nArea).value;
		
		if(nDrawType == 1)//直线 
		{	
			$p("baLineorRegional").value = 1;
		}
		else
		{
			$p("baLineorRegional").value = 2;
		}
		
	}

}

function sumbitselallex(drawtype){			//全选屏蔽区域
	try{
		//$s("WebCMS").SetArea(SetAreaChannel,1,0,0,704,576);
		$s("WebCMS").SetDrawCoordinate(SetAreaChannel,1,1,drawtype,0,0, 0, 704, 0, 0, 576, 704, 576);
	}catch(e){}
	return false;
}
function sumbitselclrex(drawtype){	//清除屏蔽区域
	try{
		//$s("WebCMS").SetArea(SetAreaChannel,1,0,0,0,0);
		$s("WebCMS").SetDrawCoordinate(SetAreaChannel,1,0,drawtype,0,0, 0, 0, 0, 0, 0, 0, 0);
	}catch(e){}
	var i;
	for(i=1;i<=4;i++){
		$s("nX1_"+i).value		= 0;
		$s("nY1_"+i).value		= 0;
		$s("nX2_"+i).value	= 0;
		$s("nY2_"+i).value	= 0;
		$s("nX3_"+i).value		= 0;
		$s("nY3_"+i).value		= 0;
		$s("nX4_"+i).value	= 0;
		$s("nY4_"+i).value	= 0;
	}
	return false;
}


function closeinfoOneRegion(){		//屏蔽开关 只设置一个区域（人脸识别）
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
			var i,nleft,nTop,nWidth,nHeight,jingxiang,fanzhuan,a=0,wch,hcw;
			jingxiang  = parseInt($s("jingxiang").value);
			fanzhuan   = parseInt($s("fanzhuan").value);
			xuanzhuan  = parseInt($s("xuanzhuan").value);
			nEncWidth  = parseInt($s("nEncWidth").value);
			nEncHeight  = parseInt($s("nEncHeight").value);

			for(i=1;i<=1;i++){
				try{
					nWidth	= parseInt($s("nWidth"+i).value);
					nHeight	= parseInt($s("nHeight"+i).value);
					if(jingxiang)
						nLeft	= 704-(parseInt($s("nLeft"+i).value) + nWidth);
					else
						nLeft	= $s("nLeft"+i).value;

					if(fanzhuan)
						nTop	= 576-(parseInt($s("nTop"+i).value) + nHeight);
					else
						nTop	= $s("nTop"+i).value;

					if(xuanzhuan == 1&&nLeft!=576)
					{
						hcw = nEncHeight/nEncWidth;
						wch = nEncWidth/nEncHeight;

						a = parseInt(nTop);
						nTop= nLeft*wch*wch;
						nLeft = parseInt(704 -(a+nHeight)*hcw*hcw);

						nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
						nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;

					}
					else if(xuanzhuan == 2&&nLeft!=576)
					{

						hcw = nEncHeight/nEncWidth;
						wch = nEncWidth/nEncHeight;

						a = parseInt(nLeft);
						nLeft = nTop*hcw*hcw;
						nTop = parseInt(576 - (a+nWidth)*wch*wch);

						nWidth	= parseInt($s("nHeight"+i).value)*hcw*hcw;
						nHeight	= parseInt($s("nWidth"+i).value)*wch*wch;

					}
					//alert(" nleft:"+nLeft+" nTop:"+nTop+" nWidth:"+nWidth+" nHeight:"+nHeight);
					$s("WebCMS").SetDrawOnlyOneRectangleArea(SetAreaChannel,i,nLeft,nTop,nWidth,nHeight);
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
function sumbitselallOneRegion(){			//全选屏蔽区域(一个区域)
	try{
		$s("WebCMS").SetDrawOnlyOneRectangleArea(SetAreaChannel,1,0,0,704,576);
	}catch(e){}
	return false;
}

function sumbitselclrOneRegion(){	//清除屏蔽区域（一个区域）
	try{
		$s("WebCMS").SetDrawOnlyOneRectangleArea(SetAreaChannel,1,0,0,0,0);
	}catch(e){}
	var i;
	for(i=1;i<=1;i++){
		$s("nLeft"+i).value		= 0;
		$s("nTop"+i).value		= 0;
		$s("nWidth"+i).value	= 0;
		$s("nHeight"+i).value	= 0;
	}
	return false;
}
function sumbitokOneRegion(){
	try{
		$s("WebCMS").GetDrawOnlyOneRectangleArea(SetAreaChannel);
	}catch(e){}
}

function SetGetAreaOneRegion(nChannelGet, nAreaCount, nArea, nLeft, nTop, nWidth, nHeight){
	try{
		if(nAreaCount==0||nArea<=0||nArea>1){
			var i;
			for(i=1;i<=1;i++){
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


