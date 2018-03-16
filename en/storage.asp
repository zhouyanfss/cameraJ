<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设备管理</title>
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

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<style type="text/css">
<!--
.Trimtd{padding:0px;margin:0px;border-left:1px solid #999999; border-top:1px solid #999999;}
.input_list {
	 background-color: #FFFFFF;
	 border-bottom: 0px solid; 
	 border-left:   0px solid; 
	 border-right:  1px #CCCCCC solid; 
	 border-top:    0px solid;
	 margin:0px;
	 padding:0px;
	 padding-left:3px;
	 overflow:auto;
	 line-height:21px;
	 height:104px;
	 background-image:url(./images/listbg.gif);
}
.divcenter {LEFT: 100px; VISIBILITY: hidden; POSITION: absolute; ; TOP:80px; width:350px; height:107px;}
#tableimtd td{padding-right:0px;}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}

function btnHitEx(numi){
  try{
	if(0==numi){location.href="storage.asp"; return false;}
	var obj = document.getElementsByName('selectstorage');//得到对象
	var chkselectstorage = true;
	var paramctrl, paramflag, paramcmd, paramctrl;
	paramflag	= 3000;
	paramcmd	= numi;
	for(var i=0;i< obj.length;i++){
		if(obj[i].checked){
		  chkselectstorage = false;
		  paramctrl = obj[i].value;
		}
	}
	if(chkselectstorage){
		remarkDisplay("divAlertHTML", "* " + ALERTSELECTSTORAGE, 3E3, 1);
		return false;
	}
	var stralert;
	if(3001==paramcmd){
		stralert	= ALERTFORMATSTORAGE;	
	}else{
		stralert	= ALERTCHECKSTORAGE;
	}
	//3001 格式化存储设备	//3002 检查存储设备
	if(confirm(stralert)){
		FunControlHitEx(paramflag, paramcmd, paramctrl, 0);
	}
  }catch(e){}
}

function init(){
  try{
	ChangeLanguage('../xml/storage.xml', m_szLanguage);
    var DEVICEIPC	= getCookies("DEVICEIPC");
	if($("format").value=="1"&&DEVICEIPC=="0"){
		$("strrebfm").style.display = "";
	}
	var storageinfo;
	storageinfo = $("storageinfo").value;
	var arrinfo = storageinfo.split("\n");
	if(arrinfo.length>0&&arrinfo[0]!=""){
		var row=document.getElementById("tr0");
		var index=row.rowIndex;
		tb.deleteRow(index);
		var TdHtml;
		for(i=0;i<arrinfo.length;i++){
			if(0==i){
			TdHtml		= "<input name=\"selectstorage\" type=\"radio\" checked value=\""+arrinfo[i]+"\">"
			}else{
			TdHtml		= "<input name=\"selectstorage\" type=\"radio\" value=\""+arrinfo[i]+"\">"
			}
			row1		= tb.insertRow(index+i);
			row1.height	= 20;
			row1.id		= "tr" + arrinfo[i];
			row1.align	= "left";
			cell1 			= row1.insertCell();
			cell1.align		= "center";
			cell1.innerHTML = TdHtml;
		}
	}
  }catch(e){}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<div style="z-index: 12; position:absolute; margin:0px; padding:0px; top:0px; left: 0px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%; left:expression((document.body.offsetWidth-400)/2);" id="DivUpdatePer">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center bgColor=#ffffe7 border=1>
  <TR>
  <TD align=middle height=56 >
<form name="loading" id="loading" style="margin:0px; padding:0px;">
 <p align=center> <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:8px;" id="Divtext" size="2" face="Arial">Loading, please wait ...</div>
 <input type="text" name="chart" id="chart" size=46 style="font-family:Arial; font-weight:bolder; color:#0066ff; background-color:#fef4d9; padding:0px; border-style:none;">
 <input type="text" name="percent" id="percent" size=38 style="color:#0066ff; text-align:center; border-width:medium; border-style:none; background-color:#ffffe7;">
 </p>
</form>
  </TD></TR>
  </TABLE>
<script type="text/javascript" language="javascript"> 
<!--
var bar=1, line="||", amount="||", CloseTimeout;
var myos = appInfo(), osVersion = myos.version;
function UpdatePer(nPer, nNun, paramtitle){
	var i;
	bar=nPer;
	if(bar>100){bar = 100;}
	var Objtext=eval(document.all("Divtext"));
	Objtext.innerHTML=paramtitle;
	window.status = paramtitle + bar + "%"; amount="";
	for(i=1;i<=bar;i++){amount=amount + "|";}
	$s("chart").value = amount; $s("percent").value = bar+"%" ;
	var ObjD;
	ObjD=eval(document.all("DivUpdatePer"));
 
	if (bar<100){
		ObjD.style.top = "120px";
		if(osVersion==10){ObjD.style.left = "210px";}
		ObjD.style.display="block";
	}else{
		window.clearTimeout(CloseTimeout);
		if (bar<100){
			CloseTimeout = setTimeout("CloseUpdatePer("+nNun+")",90000);
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
	ObjD.style.display="none";
	window.status = "";
	self.location.href="storage.asp";
}
-->
</script>
</div>

<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/storageCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">存储设备</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set" style="width:660px;">
			<ul id="show_Main">
				<li class="vrig" id="laMain" style="width:660px;">
				<table border="0" align="center" cellpadding="0" cellspacing="0" id="tableimtd">
                       <tr>
                        <td align="center" class="Trimtd"><LABEL id="laSelect">选择</LABEL></td>
                        <td align="left" class="Trimtd"><LABEL id="laNo">NO.</LABEL></td>
                        <td align="left" class="Trimtd"><LABEL id="laTotalSize">总容量(M)</LABEL></td>
                        <td align="left" class="Trimtd"><LABEL id="laFreeSize">剩余容量(M)</LABEL></td>
                        <td align="left" class="Trimtd" style="border-right:1px solid #999999;"><LABEL id="laStatus">状态</LABEL></td>
                      </tr>
                     <tr>
                       <td height="100%" valign="top" class="Trimtd" style="width:52px;">
					   <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
                         <tr>
                           <td valign="top" style="background-image:url(./images/listbg.gif); margin:0px; padding:0px;">
						   <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb">
							 <tr id="tr0">
							   <td>&nbsp;</td>
							 </tr>
						   </table>
				   		   </td>
                         </tr>
                       </table>
					   </td>
                       <td valign="top" class="Trimtd">
                          <textarea name="storageinfo" rows="5" class="input_list" id="storageinfo" style="width:86px;" readonly="readonly"></textarea>					   </td>
                        <td valign="top" class="Trimtd"><textarea  name="storageinfo2" rows="5" class="input_list" id="storageinfo2" style="width:136px;" readonly="readonly"></textarea></td>
                        <td valign="top" class="Trimtd"><textarea  name="storageinfo3" rows="5" class="input_list" id="storageinfo3" style="width:136px;" readonly="readonly"></textarea></td>
                        <td valign="top" class="Trimtd" style="border-right:1px solid #999999; width:200px; padding-right:0px;"><textarea  name="storageinfo4" rows="5" class="input_list" id="storageinfo4" style="width:200px;" readonly="readonly"></textarea></td>
                     </tr>
                     <tr>
                       <td height="52" colspan="5" align="center" valign="middle" class="Trimtd" style="border-right:1px solid #999999; border-bottom:1px solid #999999;">
					<table border="0" cellspacing="1" cellpadding="3">
                      <tr>
                        <td align="center" valign="top">
<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="btnHitEx(3001)"><LABEL id="btnFormatSD">格式化</LABEL></a>
<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="btnHitEx(0)"><LABEL id="btnRefresh">刷新</LABEL></a>
<div id="strrebfm" style="float:left; display:none;">
<a hidefocus="true" class="btn200 act" href="javascript:;" onClick="location.href='/webs/btnHitEx?flag=1121'" id="btnRefresh">重启设备并只启动硬盘管理模块</a>
<div id="Divformatalert"><span style="color:#FF0000;">*</span><LABEL id="laFormatAlert">当硬盘不能正常格式化时使用(内存不足)</LABEL></div></div>
<a hidefocus="true" class="btn77 act" href="javascript:;" onClick="btnHitEx(3002)" id="btnCheck" style="display:none;">检查</a>
						</td>
                      </tr>
                    </table>
					   </td>
                  </tr>
                  </table>
				</li>
			</ul>
			<ul id="show_Bitrate" style="margin-top:21px;">
				<li class="tb1" ><LABEL id="laBitrate">码流选择</LABEL></li>
				<li class="lef">
                  <select name="bitrate" id="bitrate" class="input2" >
                     <option id="opBitrate1" value="0" selected>Main Stream</option>
                     <option id="opBitrate2" value="1">Sub Stream</option>
                  </select>
				</li>
			</ul>
			<ul id="show_PacketTime">
				<li class="tb1" ><LABEL id="laPacketTime">录像文件打包时间</LABEL></li>
				<li class="lef">
                    <select name="rectime" id="rectime"  class="input2">
					  <option value="5">5</option>
					  <option value="10">10</option>
					  <option value="15">15</option>
					  <option value="20">20</option>
					  <option value="25">25</option>
					  <option value="30">30</option>
					  <option value="60">60</option>
					</select>
				</li>
				<li class="rig"><LABEL id="laPacketTimeUnit">分</LABEL></li>
			</ul>
		</div>
<input name="storagenum" type="hidden" id="storagenum" value="1">
<input name="format" type="hidden" id="format" value="0">
	</div>
    <div class="foottab">
		<div class="set_btn set_btn_pl166">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave"><LABEL id="btnSaveSumbit">确定</LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
</form>
<%outStorageCfgEx();%>
</body>
</html>
