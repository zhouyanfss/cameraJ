<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE8 >
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


function Delete(Row,Column){
	//alert("Delete:"+Row+","+Column);
	$s("Action").value = 2;
	$s("DRow").value = Row;
	$s("DColumn").value = Column;
	setTimeout(do_submit,0);
	return false;
}

function LastPage(){
	
	//alert("LastPage");
	$s("Action").value = 0;
	if($s("PageNo").value > 1)
	{
		$s("PageNo").value = parseInt($s("PageNo").value) - 1;
	}
	setTimeout(do_submit,0);
	return false;
}

function ThisPage(){
	
	//alert("ThisPage:");
	$s("Action").value = 0;
	if($s("nPageNo").value <= $s("PageNum").value)
	{
		$s("PageNo").value = $s("nPageNo").value;
	}
	setTimeout(do_submit,0);
	return false;
}

function NextPage(){
	
	//alert("NextPage:");
	$s("Action").value = 0;
	if($s("PageNo").value < $s("PageNum").value)
	{
		$s("PageNo").value = parseInt($s("PageNo").value) + 1;
	}
	setTimeout(do_submit,0);
	return false;
}

function Checkfrm1(){//黑名单
	$s("blackOrwhite").value = 1;
	$s("PageNo").value = 1;
	setTimeout(do_submit,0);
	return false;
}
function Checkfrm2(){//白名单
	$s("blackOrwhite").value = 2;
	$s("PageNo").value = 1;
	setTimeout(do_submit,0);
	return false;
}

function init(){
	ChangeLanguage('../xml/fabwlistshow.xml', m_szLanguage);
	initChannel();
	$("btnBlacklist").addEvent("click", Checkfrm1);
	$("btnWhitelist").addEvent("click", Checkfrm2);
	
	$s("nPageNo").value = $s("PageNo").value;
	$s("laThisPage").innerHTML = " / "+ $s("PageNum").value;
	
	if($s("blackOrwhite").value == 1)
	{
		$("btnBlacklist").style.backgroundPosition="bottom center"
	}
	else if($s("blackOrwhite").value == 2)
	{
		$("btnWhitelist").style.backgroundPosition="bottom center"
	}

		
	var i,j,imgid;
	var imgObj = new Image();
	for(i=1;i<=2;i++)
	{
		for(j=1;j<=5;j++)
		{
			imgid = "ThisImg"+i+"_"+j;
			//alert(imgid);
			imgObj.src = document.getElementById(imgid).src;//_test.src;
			//imgObj.onload = function(){
				//alert(imgObj.width);
				//alert(imgObj.height);
				if((imgObj.width*210) >= (imgObj.height*144))
				{
					if(imgObj.width > 144)
					{
						$s(imgid).style.width="144";
					}
				}
				else if(imgObj.width*210 < imgObj.height*144)
				{
					if(imgObj.height > 210)
					{
						$s(imgid).style.height="210";
					}
				}
			//}
		}
	}
	
	
}

</script>


<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(1)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
	DVSStartView(nResult,0);
</script>

<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/fabwListShowCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain" style="padding-left:50px;">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	
    <div class="foottab" style="margin-top:20px; min-height:38px;height:38px;">
		<div class="set_btn">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave" style="display:none;"><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
            
			<a hidefocus="true" href="javascript:;" id="btnBlacklist"><LABEL id="laBlacklist"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnWhitelist" style="margin-left:50px;"><LABEL id="laWhitelist"></LABEL></a>    
		</div>
    </div>
    
	<div class="maintab" align="center" style="margin:20px;">
        <div id="div_set" style="width:100%;">
        <ul>
            <li class="bw_image"><!--行-->
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage1_1" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg1_1" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName1_1"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo1_1"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage1_1.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(1,1);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage1_2" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg1_2" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName1_2"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo1_2"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage1_2.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(1,2);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage1_3" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg1_3" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName1_3"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo1_3"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage1_3.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(1,3);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage1_4" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg1_4" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName1_4"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo1_4"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage1_4.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(1,4);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage1_5" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg1_5" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName1_5"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo1_5"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage1_5.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(1,5);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
            </li>

            <li class="bw_image"><!--行-->
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage2_1" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg2_1" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName2_1"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo2_1"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage2_1.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(2,1);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage2_2" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg2_2" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName2_2"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo2_2"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage2_2.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(2,2);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage2_3" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg2_3" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName2_3"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo2_3"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage2_3.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(2,3);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage2_4" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg2_4" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName2_4"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo2_4"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage2_4.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(2,4);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
                <ul><!--列-->
                    <div>
                    <li>
                        <iframe id="LoadImage2_5" src="image/noimage.jpg"></iframe>
                        <img id="ThisImg2_5" src="" />
                     </li>
                     </div> 
                     <p><LABEL id="laImageName"></LABEL><br /><span id="sImageName2_5"></span></p>
                     <p><LABEL id="laImageNo"></LABEL><br /><span id="sImageNo2_5"></span></p>  
                     <p>
                     <a hidefocus="true" href="javascript:;" onClick="LoadImage2_5.document.execCommand('saveAs');">
                     <LABEL id="laDownload"></LABEL></a>&nbsp;&nbsp;&nbsp;&nbsp;
                     <a hidefocus="true" href="javascript:;" onClick="Delete(2,5);"><LABEL id="laDelete"></LABEL></a>
                     </p>      
                </ul>
            </li>
            
            <li class="bw_link">
            	<ul>
                    <li>
                     <a hidefocus="true" href="javascript:;" onClick="LastPage();"><LABEL id="laLastPage"></LABEL></a>
                    </li>
                </ul>
                <ul>
                    <li>
                    <input style=" margin-left:0px; width:20px;" value="1" id="nPageNo" name="nPageNo" ><span id="laThisPage">/n</span>&nbsp;
                    <a hidefocus="true" href="javascript:;" onClick="ThisPage();"><LABEL id="laThisPage"></LABEL></a>
                    </li>
                </ul>
                <ul>
                    <li>
                     <a hidefocus="true" href="javascript:;" onClick="NextPage();"><LABEL id="laNextPage"></LABEL></a>
                    </li>
                </ul>
            </li>
        </ul>
		</div>
	</div>

</div>
<input type="hidden" value="0" 	id="Action"  	name="Action" ><!--0: 显示 2：删除-->
<input type="hidden" value="1" 	id="blackOrwhite"  	name="blackOrwhite" >
<input type="hidden" value="1" 	id="PageNum"  	name="PageNum"><!--总页码-->
<input type="hidden" value="1" 	id="PageNo"  	name="PageNo" ><!--页码-->
<input type="hidden" value="1" 	id="DRow"  	name="DRow" ><!--行-->
<input type="hidden" value="1" 	id="DColumn"  	name="DColumn"><!--列-->
</form>
<%outFabwListShowCfgEx();%>
</body>
</html>
