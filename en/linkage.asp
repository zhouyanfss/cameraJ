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
<script type="text/javascript" src="jsmain/base64.js"></script>
<script type="text/javascript" src="jsmain/md5.js"></script>
<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<script type="text/javascript" language="javascript" src="./js/setchannelex.js"></script>
<script type="text/javascript" language="javascript" src="./js/maskarea.js"></script>
</head>
<script language="javascript">
var lType;
       function lType1(){
            lType=1;
        }
        function lType2(){
            lType=2;
        }
	function closeinfoex2(){
		$("WebCMS").SetLicensePlateIdentificaArea2(0,1,2,lType,0,0, 0, 0, 0, 0, 0, 0);
	}
	function closeinfoex1(){
		$s("WebCMS").SetLicensePlateIdentificaArea2(0, 1, 0, lType, 0, 0, 0, 0, 0, 0, 0, 0);
	}
function Checkfrm(){



	 $s("WebCMS").GetLicensePlateIdentificaArea(0);


    setTimeout(do_submit,0);
	return false;
}
function do_click(){$("BtnSubmit").click();}
function init(){
	ChangeLanguage('../xml/linkage.xml', m_szLanguage);
	setTimeout("initvideo(0);", 320);
	line1();
	$("btnSave").addEvent("click", Checkfrm);
	return true;
}
function  line1(){
var ldDrawType,ldDrawType1,ldDrawType2;
	   ldDrawType =$s("ldDrawType").value;
	   ldDrawType1 =$s("ldDrawType1").value;
	   ldDrawType2 =$s("ldDrawType2").value;
	if(ldDrawType==1){
		$("WebCMS").SetLicensePlateIdentificaArea2(0,1,1,1,$s("nLeft1").value,$s("nTop1").value, $s("nWidth1").value, $s("nHeight1").value, 0, 0, 0, 0);
	}

	if(ldDrawType1==2){
		$("WebCMS").SetLicensePlateIdentificaArea2(0,2,1,1,$s("nLeft2").value,$s("nTop2").value, $s("nWidth2").value, $s("nHeight2").value, 0, 0, 0, 0);
	}

	if(ldDrawType2==3){
		$("WebCMS").SetLicensePlateIdentificaArea2(0,1,1,2,$s("nLeft3").value,$s("nTop3").value,$s("nWidth3").value, $s("nHeight3").value, $s("nLeft4").value, $s("nTop4").value, $s("nWidth4").value, $s("nHeight4").value);
	}

}
</script>
<body onLoad="parentinit(0,0,0);init();" onUnload="Onbunloadclose(1)">
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nResult)">
         	DVSStartView(nResult,0);
</script>
<script language="javascript" for="WebCMS" event="CBK_GetLicensePlateIdentificaArea(nChannel,nAreaCount,nAreaIndex,nDrawType,x1,y1,x2,y2,x3,y3,x4,y4)">


	if(nDrawType==1){
		if(nAreaIndex==1){
			$s("nLeft1").value=x1;
			$s("nTop1").value=y1;
			$s("nWidth1").value=x2;
			$s("nHeight1").value=y2;
		}
		if(nAreaIndex==2){
			$s("nLeft2").value=x1;
			$s("nTop2").value=y1;
			$s("nWidth2").value=x2;
			$s("nHeight2").value=y2;
		}
		}
		if(nDrawType==2){
			$s("nLeft3").value=x1;
			$s("nTop3").value=y1;
			$s("nWidth3").value=x2;
			$s("nHeight3").value=y2;
			$s("nLeft4").value=x3;
			$s("nTop4").value=y3;
			$s("nWidth4").value=x4;
			$s("nHeight4").value=y4;
		}
</script>
<div style="z-index: 0; position:absolute; margin:0px; padding:0px; top:460px; left: 210px;width:340px; height: 50px; display:none; background-color:#CCCCCC; text-align:center; list-style:130%;" id="DivUpdateAlert">
  <TABLE borderColor=#669900 cellSpacing=3 cellPadding=5 width=350 align=center 
bgColor=#ffffe7 border=1>
  <TBODY>
  <TR>
  <TD align=middle height=56 >
<form name=loading id="loading" style="margin:0px; padding:0px;">
 <p align=center> 
 <div style="text-align:center; height:38px; padding-top:18px;" id="Divloading" ><img src="images/loading.gif" width="32" height="32"></div>
 <div style="font-size:14px; color:#0066ff; margin:0px; padding:0px; font-weight:500; text-align:center; height:25px; padding-top:12px;" id="Divtext" size="2" face="Arial"><LABEL id="laDateSubmitWaittin">数据提交中，请稍等......</LABEL></div>
 </p>
</form>
  </TD></TR>
  </TBODY></TABLE></div>
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/setCarDetectAreaEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle"></LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">

        <div id="div_set" class="div_set">
        <ul style="padding-left:20px;">
            			  <li ><LABEL id="laSensitivity"></LABEL></li>
            			  <li >
            			  <select  name="sens" id="sens" style="width:100px; min-width:100px;">
            				<option value="0">1920 * 1080</option>
            				<option value="1">1280 * 960</option>
            				<option value="2">1280 * 720</option>
            				</select><span style="color:#FF0000;"></span></li>
            			</ul>
			<ul id="show_Main">
				<li class="vrig" id="laMain">
		  <table border="0" width="420" cellspacing="0" cellpadding="0">
			<tr>
</tr>

               <tr>
                <td valign="top">
				<object name="WebCMS" ID="WebCMS" width="420" height="288" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" CODEBASE="/WebCMS.exe#Version=2,0,0,0"></object>				</td>
              </tr>
                <tr>
                 <td height="28" valign="middle"><div id="Divckmask" class="divvalue" style="margin-left:15px;"></div>
				 <input name="nLeft1" type="hidden" id="nLeft1" value="0" />
				<input name="nTop1" type="hidden" id="nTop1" value="0" />
				<input name="nWidth1" type="hidden" id="nWidth1" value="0" />
				<input name="nHeight1" type="hidden" id="nHeight1" value="0" />

				<input name="nLeft2" type="hidden" id="nLeft2" value="0" />
				<input name="nTop2" type="hidden" id="nTop2" value="0" />
				<input name="nWidth2" type="hidden" id="nWidth2" value="0" />
				<input name="nHeight2" type="hidden" id="nHeight2" value="0" />

				<input name="nLeft3" type="hidden" id="nLeft3" value="0" />
				<input name="nTop3" type="hidden" id="nTop3" value="0" />
				<input name="nWidth3" type="hidden" id="nWidth3" value="0" />
				<input name="nHeight3" type="hidden" id="nHeight3" value="0" />

				<input name="nLeft4" type="hidden" id="nLeft4" value="0" />
				<input name="nTop4" type="hidden" id="nTop4" value="0" />
				<input name="nWidth4" type="hidden" id="nWidth4" value="0" />
				<input name="nHeight4" type="hidden" id="nHeight4" value="0" />

				<input name="fanzhuan" type="hidden" id="fanzhuan" value="0" />	
				<input name="jingxiang" type="hidden" id="jingxiang" value="0" />	
				<input name="xuanzhuan" type="hidden" id="xuanzhuan" value="0" />	
				<input name="nEncWidth" type="hidden" id="nEncWidth" value="0" />	
				<input name="nEncHeight" type="hidden" id="nEncHeight" value="0" />

				<input name="ldDrawType" type="hidden" id="ldDrawType" value="1" />
				<input name="ldDrawType1" type="hidden" id="ldDrawType1" value="2" />
				<input name="ldDrawType2" type="hidden" id="ldDrawType2" value="3" />




					</td>
                </tr>
          <tr>
			  <td height="32" align="center" valign="middle">
			   	  <input type="radio" name="radiobutton" value="radiobutton" onclick="lType1()"> <LABEL id="zhix"></LABEL>
                  <input type="radio" name="radiobutton" value="radiobutton" onclick="lType2()">  <LABEL id="sibx"></LABEL>
				</td>

                          <td height="32" align="center" valign="middle">
     			 <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex2()" id="btnMaskAreaSet"><LABEL id="laZhix1"></LABEL></a>
				 <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex1()" id="btnMaskAreaSet"><LABEL id="laCls"></LABEL></a>

             <!--    <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex1()" id="btnMaskAreaSet"><LABEL id="laFaceRegionSet"></LABEL></a>
 <a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselallOneRegion()" id="btnMaskAll" disabled="disabled"><LABEL id="laAll"></LABEL></a>-->
       <!--<a hidefocus="true" class="btn77 link" href="javascript:;" onClick="sumbitselclrOneRegion()" id="btnMaskClear" disabled="disabled"><LABEL id="laCls"></LABEL></a>-->

     	<!--     <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex2()" id="btnMaskAreaSet"><LABEL id="laZhix1"></LABEL></a>
      	<!--      <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="sumbitselclrOneRegion()" id="btnMaskAreaSet"><LABEL id="laCls"></LABEL></a>

	 <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex1('2')" id="btnMaskAreaSet"><LABEL id="laCls"></LABEL></a>
		  <a hidefocus="true" class="btn104 act" href="javascript:;" onClick="closeinfoex3()" id="btnMaskAreaSet"><LABEL id="laZhix2"></LABEL></a>-->
         				<input name="MAnum" type="hidden" id="MAnum" value="0">
         				<input name="ismask" type="hidden" id="ismask" value="0">
         				<input name="islens" type="hidden" id="islens" value="1"></td>
                       </tr>

           </table> 
				</li>
			</ul>
			
		</div>
	</div>

    <div class="foottab">
		<div class="set_btn">
			<a hidefocus="true" href="javascript:;" id="btnDelete" style="display:none;">恢复默认</a>
			<a hidefocus="true" href="javascript:;" id="btnRefresh" style="display:none;">刷新</a>
			<a hidefocus="true" href="javascript:;" id="btnSave" ><LABEL id="btnSaveSumbit"></LABEL></a>
			<a hidefocus="true" href="javascript:;" id="btnCancel" style="display:none;">取消</a>
		</div>
		<div class="boxtap">
			<div class="Box" style="display:none;" id="divAlertHTML"></div>
		</div>
	</div>
</div>
<input name="BtnSubmit" type="submit" class="button" id="BtnSubmit"  style="width:86px; display:none;" value="Submit"/>
</form>
<%outCarDetectAreaEx();%>
</body>
</html>
