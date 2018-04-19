<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>bawl</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<meta  http-equiv="pragma"  content="no-cache">  
<meta  http-equiv="cache-control"  content="no-cache">  
<meta  http-equiv="expires"  content="wed,  26  feb  1997  08:21:57  gmt"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script language="javascript" type="text/javascript" src="./script/ajax.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/send.js"></script>
<script type="text/javascript" src="jsmain/base64.js"></script>
<script type="text/javascript" src="jsmain/md5.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
</head>
<script language="javascript">

var imagefliesrc,imagefiletype,Filetype,updateflag = true;;
function UploadImage(){
	imagefliesrc = trimEx($("xxx").value);
	if(imagefliesrc == ""){remarkDisplay("divAlertHTML", "* " + ALERTIMAGENULL, 3E3, 1);return false;}
	var imagefiletype 	= imagefliesrc.substr(imagefliesrc.lastIndexOf(".")+1)
	imagefiletype = imagefiletype.toLowerCase();

	//限制上传文件类型
	if(imagefiletype=="jpg"){
		
	}else{
			remarkDisplay("divAlertHTML", "* " + ALERTIMAGEERROR, 5E3, 1);
			return false;
	}
	
	//文件类型的值 
	Filetype = 43;
	
	/*
	if(updateflag){
		//$("WebCMS").m_szDeviceName	 = "NVS66163";
		$("WebCMS").m_szUrl			= pageURL;
		$("WebCMS").m_dwDataPort	= parseInt(pagePort);
		$("WebCMS").m_szUserName	= $p("username").value;
		$("WebCMS").m_szPassword	= $p("password").value;
		$("WebCMS").ShowTips(0);
		$("WebCMS").ShowAlarmDialog(0);
		$("WebCMS").SetFullWindow(1);
		$("WebCMS").m_ProtocolType	= 32;
		$("WebCMS").SetLoginMode(1);
		$("WebCMS").Login();
	}else
	*/
	{
		$("WebCMS").UpdateKernel(Filetype, imagefliesrc);
	}
	
	$s("blackOrwhite").value = 3;
	setTimeout(do_submit,0);
	return false;
}


function Checkfrm(){
	setTimeout(do_submit,0);
	return false;
}


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

function Checkfrm1(){//黑名单
	$s("blackOrwhite").value = 1;
	
	if($s("image_type").value == 2)
	{
		if($s("bUploadImage").value == 0)
		{
			remarkDisplay("divAlertHTML", "* " + ALERTIMAGENULL, 3E3, 1);
			return false;
		}
		var imgObj = new Image();
		imgObj.src = $s("ThisImg").src;
		if(imgObj.width > 960 || imgObj.height > 960)
		{
			remarkDisplay("divAlertHTML", "* " + ALERTIMAGETOOBIG, 3E3, 1);
			return false;
		}
	}
	
	if($s("imagename").value == "")
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENAMENULL, 3E3, 1);
		return false;
	}
	if($s("imageno").value == "")
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENONULL, 3E3, 1);
		return false;
	}
	if(checkNo($s("imageno").value) >=8 || checkNo($s("imagename").value) >=8)
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENOERROR, 3E3, 1);
		return false;
	}
	if($s("image_type").value == 2)
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBLADD2, 3E3, 1);
	}
	else
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBLADD, 3E3, 1);
	}
	setTimeout(do_submit,0);
	show();
	return false;
}
function Checkfrm2(){//白名单
	$s("blackOrwhite").value = 2;
	
	if($s("image_type").value == 2)
	{
		if($s("bUploadImage").value == 0)
		{
			remarkDisplay("divAlertHTML", "* " + ALERTIMAGENULL, 3E3, 1);
			return false;
		}
		var imgObj = new Image();
		imgObj.src = $s("ThisImg").src;
		if(imgObj.width > 960 || imgObj.height > 960)
		{
			remarkDisplay("divAlertHTML", "* " + ALERTIMAGETOOBIG, 3E3, 1);
			return false;
		}
	}
	
	if($s("imagename").value == "")
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENAMENULL, 3E3, 1);
		return false;
	}
	if($s("imageno").value == "")
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENONULL, 3E3, 1);
		return false;
	}
	if(checkNo($s("imageno").value) >=8 || checkNo($s("imagename").value) >=8 )
	{
		remarkDisplay("divAlertHTML", "* " + ALERTIMAGENOERROR, 3E3, 1);
		return false;
	}
	if($s("image_type").value == 2)
	{
		remarkDisplay("divAlertHTML", "* " + ALERTWLADD2, 3E3, 1);
	}
	else
	{
		remarkDisplay("divAlertHTML", "* " + ALERTWLADD, 3E3, 1);
	}
	setTimeout(do_submit,0);
	show();
	return false;
}
function init(){
	ChangeLanguage('../xml/bawl.xml', m_szLanguage);
	initChannel();
	setTimeout("initvideo(0);", 320);
	//$("btnSave").addEvent("click", Checkfrm);
	$("btnBlacklist").addEvent("click", Checkfrm1);
	$("btnWhitelist").addEvent("click", Checkfrm2);
	$("btnUploadImage").addEvent("click", UploadImage);
	
	changetype();
	
	if($("faceresult").value == -1)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR1, 3E3, 1);
	}
	else if($("faceresult").value == 1)//成功
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDOK, 3E3, 1);
	}
	else if($("faceresult").value == -2)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR2, 3E3, 1);
	}
	else if($("faceresult").value == -3)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR3, 3E3, 1);
	}
	else if($("faceresult").value == -4)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR4, 3E3, 1);
	}
	else if($("faceresult").value == -5)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR5, 3E3, 1);
	}
	else if($("faceresult").value == -6)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR6, 3E3, 1);
	}
	else if($("faceresult").value == -7)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR7, 3E3, 1);
	}
	else if($("faceresult").value == -8)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR8, 3E3, 1);
	}
	else if($("faceresult").value == -9)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR9, 3E3, 1);
	}
	else if($("faceresult").value == -10)//失败
	{
		remarkDisplay("divAlertHTML", "* " + ALERTBWADDERROR10, 3E3, 1);
	}
	
}

	function aaa(){
		$("WebCMS").GetFaceImagePath();
	}

function changetype(){
	
	if($s("image_type").value == 1)
	{
		$s("show_Main2").style.display ="none";
		$s("SelectFile").style.display ="none";
		$s("show_Main").style.display ="";
	}
	else
	{
		$s("show_Main").style.display ="none";
		$s("show_Main2").style.display ="";
		$s("SelectFile").style.display ="";
	}
}


</script>


<script> 
function show()  //显示隐藏层和弹出层 
{ 
   var hideobj=document.getElementById("bwaddbg"); 
   bwaddbg.style.display="block";  //显示隐藏层 
   bwaddbg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度   px是后缀
   document.getElementById("bwadding").style.display="block";  //显示弹出层 
} 
function hide()  //去除隐藏层和弹出层 onmousedown=MDown(massage)
{ 
   document.getElementById("bwaddbg").style.display="none";
   document.getElementById("bwadding").style.display="none"; 
} 
</script> 

<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(1)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>
<script language="javascript" for="WebCMS" event="CBK_UpdateSendPercent(nPer)">
    UpdatePer(nPer, "0"); 
    reupdateflag = false;
</script>

<script language="javascript" for="WebCMS" event="CBK_GetFaceImagePath(fname)">
  var src =document.getElementById("xxx").value;
		src=fname;
	document.getElementById("xxx").value=src;
</script>

<div id="bwaddbg" style=" display:;"></div>
<div id="bwadding" style=" display:;">

</div>
</div> 

<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; left:expression((document.body.offsetWidth-400)/2); " id="DivUpdatePer">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center bgColor=#ffffe7 border=1>
  <TR>
  <TD align=middle height=56 >
<form name="loading" id="loading" style="margin:0px; padding:0px;">
 <p align=center> <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:8px;" id="Divtext" size="2" face="Arial">Loading, please wait ...</div>
 <input type=text name="chart" id="chart" size=46 style="font-family:Arial; font-weight:bolder; color:#0066ff; background-color:#fef4d9; padding:0px; border-style:none;">
 <input type=text name="percent" id="percent" size=38 style="color:#0066ff; text-align:center; border-width:medium; border-style:none; background-color:#ffffe7;">
 </p>
</form>
  </TD></TR>
  </TABLE>
 <script> 
 <!--
var bar=1, outtime, line="||", amount="||", CloseTimeout;
var myos = appInfo(), osVersion = myos.version;
function UpdatePer(nPer,nNun){
	var ObjD;
 	var Objtext=eval(document.all("Divtext"));
	bar=nPer; if(bar>100){bar = 100;}
	if(nNun == "0"){Objtext.innerHTML=ALERTIMAGEUPLOAD; window.status = ALERTIMAGEUPLOAD + bar + "%";
	}else{window.clearTimeout(CloseTimeout); Objtext.innerHTML=ALERTINSTALL; window.status = ALERTINSTALL + bar + "%";}
	amount=""; for(i=1;i<=bar;i++){amount =amount + "|" ;}
	$("chart").value = amount; $("percent").value = bar+"%" ;
	ObjD=eval(document.all("DivUpdatePer"));
	if (bar<100){
		ObjD.style.top = "120px"; if(osVersion==10){ObjD.style.left = "210px";}
		ObjD.style.display="block";
	}else{
		window.clearTimeout(CloseTimeout);
		if (bar<100){CloseTimeout = setTimeout("CloseUpdatePer("+nNun+")",90000);
		}else{
			var outtimenum = 30000;
			try{
				var temp = document.URL.split('//')[1].split('/')[0].split(':')[0];
				if(temp.indexOf("10.")==0||temp.indexOf("192.")==0||temp.indexOf("172.")==0){outtimenum = 5000;}
			}catch(e){}
			CloseTimeout = setTimeout("CloseUpdatePer(" + nNun + ")",outtimenum);
		}
	}
}
function CloseUpdatePer(){
    var ObjD=eval(document.all("DivUpdatePer"));
	ObjD.style.display="none"; window.status = "";
	//self.location.href="sysupgrade.asp";
}
-->
</script>
</div>


<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/bawlCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab" align="center" style=" padding-left:30px;">
        <div id="div_set" class="div_set">
        	<ul id="SelectType">
				<li>
					<table width="680" cellpadding="5" cellspacing="1">
						<tr>
							 <td height="25" width="50" align="right" id="Tdtype" ><LABEL id="laImageType"></LABEL></td>
							 <td height="25" width="300">
								  <select name="image_type" class="select1" id="image_type" style="width:100px;" onChange="changetype();">
											<option id="image_type1" value="1"></option>
											<option id="image_type2" value="2"></option>
								 </select>
							 </td>
                             <td>
                             </td>
						</tr>
					</table>
				</li>
            </ul>
        	<ul id="SelectFile">
				<li>
					<table width="680" cellpadding="5" cellspacing="1">
						<tr>
						  <td height="25" width="50" align="right"><LABEL id="laImageFile"></LABEL></td>
						  <td height="30" width="300" >
							  <!--<input name="imageflie" type="file" id="imagefile" style="width:200px;" lang="en" size="15" xml:lang="en" />-->
							  <input id="xxx" disabled="disabled" value="" style="float: left;width: 135px;height: 17px" type="text"><button style="float: left;width: 64px;height: 17px;line-height: 17px;text-align: center" id="laReview" onclick="aaa();" type="button">浏览</button>
						  </td>
                          <td>
                          <a hidefocus="true" href="javascript:;" id="btnUploadImage"><LABEL id="laUploadImage"></LABEL></a>
                          </td>
						</tr>
					</table>
				</li>
            </ul>
			<ul id="show_Main" style=" margin-top:20px; margin-bottom:20px; ">
            			<object name="WebCMS" ID="WebCMS" width="420" height="288" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" CODEBASE="/WebCMS.exe#Version=2,0,0,0"></object>
			</ul>
			<ul id="show_Main2" style=" margin-top:20px; margin-bottom:20px; ">
            	<li id="liThisImg">
            	<img id="ThisImg" src="" /> 
                </li>
			</ul> 
            <ul>
				<li>
					<table width="520" cellpadding="5" cellspacing="1">
						<tr>
						  <td height="25" align="right"><LABEL id="laImageName"></LABEL></td>
						  <td height="25" align="left">
							  <input name="imagename" type="text" id="imagename" maxlength="10"/>
						  </td>
						  <td height="25" align="right"><LABEL id="laImageNo"></LABEL></td>
						  <td height="25" align="left">
							  <input name="imageno" type="text" id="imageno" maxlength="16"/>
						  </td>
                          <td align="left">
                          <LABEL id="laImageNoTip"></LABEL>
                          </td>
						</tr>
					</table>
				</li>    
            </ul>
            <br />     
		</div>
	</div>
	
    <div class="foottab">
		<div class="set_btn">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave" style="display:none;"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
            
			<a hidefocus="true" href="javascript:;" id="btnBlacklist" style=" margin-left:20px; margin-right:50px;"><LABEL id="laBlacklist"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnWhitelist"><LABEL id="laWhitelist"></LABEL></a>    
		</div>
		<div id="StrNotice" class="divnotice">
        <br />
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice1"></LABEL><br />
		<span style="color:#FF0000; padding-right:12px;">*</span><LABEL id="laNotice2"></LABEL>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input type="hidden" value="0" 	id="blackOrwhite"  	name="blackOrwhite" >
<input type="hidden" value="0" 	id="faceresult"  	name="faceresult" >
<input type="hidden" value="1" 	id="bUploadImage"  	name="bUploadImage" >
</form>
<%outBawlCfgEx();%>
<script>

	var _test = document.getElementById("ThisImg");
	var imgObj = new Image();
	imgObj.src = _test.src;
	imgObj.onload = function(){
		if((imgObj.width*288) >= (imgObj.height*420))
		{
			if(imgObj.width > 420)
			{
				$s("ThisImg").style.width="420";
			}
		}
		else if(imgObj.width*288 < imgObj.height*420)
		{
			if(imgObj.height > 288)
			{
				$s("ThisImg").style.height="288";
			}
		}
	}

</script>
</body>
</html>
