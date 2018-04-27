<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
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
BODY {display:block!important;overflow-y:auto!important;overflow-x:hidden!important;}
.STYLE1 {color: #FF0000}
.STYLE2 {color: #FFFFFF;font-weight: bold;}
.input2{width:156px;}
.divcenter {top: 156px;left: 156px;VISIBILITY: hidden;POSITION: absolute;}
table.returncls{border-bottom:#999999 solid 0px;border-top:#999999 solid 1px;border-left:#999999 solid 1px;border-right:#999999 solid 0px;}
.clspagination{padding:0px;margin:0px;float:right;margin-right:8px;margin-top:4px;}
.clspagination2{padding:0px;margin:0px;float:right;margin-right:8px;}
.w160{width:160px; height:23px; margin:0px; padding:0px; overflow:hidden;}
.w320{width:320px; height:23px; margin:0px; padding:0px; overflow:hidden;}
-->
</style>
</head>
<script language="vbscript" type="text/vbscript">
	Function bytes2BSTR(vIn)
		dim  strReturn
		dim i,ThisCharCode,NextCharCode
		strReturn = ""
		For i = 1 To LenB(vIn)
			ThisCharCode = AscB(MidB(vIn,i,1))
			If CLng(ThisCharCode) < 128 Then
				strReturn = strReturn & Chr(ThisCharCode)
			Else
				NextCharCode = AscB(MidB(vIn,i+1,1))
				strReturn = strReturn & Chr(CLng(ThisCharCode) * 256 + CInt(NextCharCode))
				i = i + 1
			End If
		Next
		bytes2BSTR = strReturn
	End Function
</script>
<script language="javascript" type="text/javascript">
<!--
var flag, pageNum, photoNum, beginTime, enddate, seltype, ispic;
var paramurl , paramcmd , parameter = "";
photoNum	= 30;				//每页显示记录数,默认为30;
paramurl	= "/webs/btnSearchEx";
flag		= 1000;	
ispic		= 0;

function funSearch(paramflag){
	beginTime	= $("bdt0").value+"-"+$("bdt1").value+"-"+$("bdt2").value;
	enddate		= $("edt0").value+"-"+$("edt1").value+"-"+$("edt2").value;
	seltype		= $("seltype").value;
	photoNum	= $("pagenumsel").value;	//每页显示记录数	
	pageNum		= 0;	//开始页数,0表示新的搜索
	flag		= parseInt($("searchFlag").value);
	
	if(beginTime==""||beginTime==null){
		alert(ALERTLOGBEGINDATE);
		return false;
	}
	if(enddate==""||enddate==null){
		alert(ALERTLOGENDDATE);
		return false;
	}
	if(seltype==""||seltype==null){
		alert(ALERTLOGTYPE);
		return false;
	}
	//FunControl(pflag,pPageNo,pPageSize,pBeginTime,pEndTime,pSelType,pSearchType,purl)
	funSearchLog(flag,pageNum,photoNum,beginTime,enddate,seltype,ispic,paramurl);
}
function funStop(){
	try{
	beginTime	= $("bdt0").value+"-"+$("bdt1").value+"-"+$("bdt2").value;
	enddate		= $("edt0").value+"-"+$("edt1").value+"-"+$("edt2").value;
	seltype		= $("seltype").value;
	photoNum	= $("pagenumsel").value;	//每页显示记录数	
	pageNum		= 0;	//开始页数,0表示新的搜索
	flag		= parseInt($("searchFlag").value);
	if(flag<=1000){
		flag 					= 1001;
		$("searchFlag").value	= flag;
	}
	funSearchLog(flag,pageNum,photoNum,beginTime,enddate,seltype,ispic,paramurl);
	//alert(ALERTCONFIRM);
	}catch(e){}
}
function initdata(){
	ChangeLanguage('../xml/systemlog.xml', m_szLanguage);
	var b=new Date,c=b.getYear(),c=c<1900?c+1900:c;b.getDate()<2?b.getMonth()<1?($("bdt0").value=c-1,$("bdt1").value=12,$("bdt2").value=31):($("bdt0").value=c,$("bdt1").value=chk10(b.getMonth()),$("bdt2").value=getMonthDay("bdt")):($("bdt0").value=c,$("bdt1").value=chk10(b.getMonth()+1),$("bdt2").value=chk10(b.getDate()-1));
	attachDateInput("bdt","btm");
	//b.getDate()<2?b.getMonth()<1?($("edt0").value=c-1,$("edt1").value=12,$("edt2").value=31):($("edt0").value=c,$("edt1").value=chk10(b.getMonth()),$("edt2").value=getMonthDay("edt")):($("edt0").value=c,$("edt1").value=chk10(b.getMonth()+1),$("edt2").value=chk10(b.getDate()));
	$("edt0").value=c,$("edt1").value=chk10(b.getMonth()+1),$("edt2").value=chk10(b.getDate());
	attachDateInput("edt","etm");
	return true;
}
//-->
</script>
<body onLoad="initdata();" onUnload="funStop();">
<div style="width:100%; height:100%; overflow-y:scroll; overflow-x:hidden; margin:0px; padding:0px;">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/alarminfoCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle2">报警查询</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain" style="width:704px; min-width:704px; height:52px;display:inline-block;">
				  <fieldset id="Fieldsettitle" title="" style="width:100%;margin:0px; padding:0px;  padding-left:12px; padding-bottom:5px; text-align:left;"><legend id="Legendtable"><LABEL id="laSearchConditions">查询条件</LABEL></legend>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="76" align="right" id="Tdtime"><LABEL id="laSearchTime">查询时间</LABEL></td>
			<td width="110">
    		<span class="timeBox"> 
			<input type="text" id="bdt0" maxlength=4 name="textfield" class="intyear"/>- 
			<input type="text" id="bdt1" maxlength=2 name="textfield" class="intime"/>- 
			<input type="text" id="bdt2" maxlength=2 name="textfield" class="intime"/>
			</span>
			<span class="timeBox" style="display:none;">
				<input type="text" id="btm0" maxlength=2 name="textfield" class="intime"/>:
				<input type="text" id="btm1" maxlength=2 name="textfield" class="intime"/>:
				<input type="text" id="btm2" maxlength=2 name="textfield" class="intime"/>
			</span> 
			</td>
			<td width="32" align="center" id="Tdto"><LABEL id="laConditionsTo">至</LABEL></td>
			<td width="110">
    		<span class="timeBox"> 
			<input type="text" id="edt0" maxlength=4 name="textfield" class="intyear"/>- 
			<input type="text" id="edt1" maxlength=2 name="textfield" class="intime"/>- 
			<input type="text" id="edt2" maxlength=2 name="textfield" class="intime"/>
			</span>
			<span class="timeBox" style="display:none;">
				<input type="text" id="etm0" maxlength=2 name="textfield" class="intime"/>:
				<input type="text" id="etm1" maxlength=2 name="textfield" class="intime"/>:
				<input type="text" id="etm2" maxlength=2 name="textfield" class="intime"/>
			</span> 
			</td>
			<td width="86" align="right" style="display:none;" id="Tdtype"><LABEL id="laType">日志类型</LABEL></td>
			<td width="76" style="display:none;">
			  <select name="seltype" id="seltype">
				<option id="opType1" value="31" selected="selected">所有报警日志</option>
				<option id="opType2" value="1">探头报警</option>
				<option id="opType3" value="2">运动侦测</option>
				<option id="opType4" value="4">视频丢失</option>
				<option id="opType5" value="8">无线报警</option>
				<option id="opType6" value="16">网络故障</option>
			  </select></td>
			<td width="86" align="right" id="Tdpageitem"><LABEL id="laPageItem">每页显示</LABEL></td>
			<td width="56"><select name="pagenumsel" id="pagenumsel">
			  <option value="20">20</option>
			  <option value="25" selected>25</option>
			  <option value="30">30</option>
			  <option value="40">40</option>
			  <option value="50">50</option>
			  <option value="60">60</option>
			  <option value="100">100</option>
					</select></td>
			<td width="56">
<a hidefocus="true" class="btn69 act" href="javascript:;" onClick="funSearch(1000)"><LABEL id="btnSearchLog">查 询</LABEL></a>
			</td>
			<td><input name="searchFlag" type="hidden" id="searchFlag" value="1000"></td>
		  </tr>
		</table></fieldset>
				</li>
				<li class="vrig" id="laMain2" style="width:704px; min-width:704px; height:320px; min-height:320px; padding:8px 0 0 12px;">
					<table border="1" width="98%" cellspacing="0" cellpadding="0" id="strreturntable">
					   <tr>
						<td width="98" align="center" id="Tdhddate"><LABEL id="laInfoDate">日期 </LABEL></td>
						<td width="98" align="center" id="Tdhdtime"><LABEL id="laInfoTime">时间 </LABEL></td>
						<td width="256" align="center" id="Tdhdtext"><LABEL id="laInfoText">内容 </LABEL></td>
						<td align="center" id="Tdhdexplan"><LABEL id="laInfoExplain">说明 </LABEL></td>
					   </tr>
					</table>
				</li>
				<li class="vrig" id="strpagination" style="width:704px; min-width:704px; height:32px; min-height:32px; padding:3px 32px 0 0;">
				</li>
			</ul>
		</div>
	</div>
    <div class="foottab" style="height:32px;">
		<div class="set_btn" style="display:none;">
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
</div>
<DIV class=divcenter id=popupLoad>
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center 
bgColor=#ffffe7 border=1>
  <TBODY>
  <TR>
  <TD align=middle height=56 >
  <span style=" height:23px;" id="Spanwaiting">
  <LABEL id="laPopUpload">数据在处理中，请稍候……</LABEL>
  </span>
<marquee style="border:1px solid #000000" direction="right" width="320" scrollamount="5" scrolldelay="10" bgcolor="#ECF2FF">
  <table cellspacing="1" cellpadding="0">
  <tr height=8>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  <td bgcolor=#3399FF width=8></td>
  <td></td>
  </tr></table></marquee>
  </TD></TR>
  </TBODY></TABLE></DIV>
<%outSearchLogCfgEx();%>
</body>
</html>