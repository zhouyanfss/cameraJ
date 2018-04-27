<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>串口设置</title>
<link href="css/styleset.css" rel="stylesheet" type="text/css">
<META  HTTP-EQUIV="pragma"  CONTENT="no-cache">  
<META  HTTP-EQUIV="Cache-Control"  CONTENT="no-cache">  
<META  HTTP-EQUIV="expires"  CONTENT="Wed,  26  Feb  1997  08:21:57  GMT"> 
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/common.js"></script>

<script language="javascript" type="text/javascript" src="./jsmain/getcookie.js"></script>
<script language="javascript" type="text/javascript" src="./js/language.js"></script>

<style type="text/css">
<!--
.input2{
width:186px;
}
-->
</style>
</head>
<script language="javascript">
function Checkfrm(){
	//saveCookie("SaveYes","ok",7);
	setTimeout(do_submit,0);
	return false;
}
function init(){
	ChangeLanguage('../xml/terminal.xml', m_szLanguage);
	
	tmpdev	= parseInt(getCookies("DEVICEIPC"));
	if(tmpdev==0){
		$s("Tablers232").style.display = "";
	}else{
		$s("Tdrs485").style.display = "none";
	}
	$("btnSave").addEvent("click", Checkfrm);
}
</script>
<body onLoad="parentinit(0,0,0);init();">
<form id="outcfg_frm" name="outcfg_frm" method="post" action="/webs/terminalCfgEx"  style="margin:0px; padding:0px;">
<div id="divMain">
	<div class="subtab" style="display:none;">
		<ul>
			<li class="linow"><LABEL id="laHeadTitle">串口设置</LABEL></li>
			<li class="laHelp" style="display:none;"></li> 
		</ul>
	</div>
	<div class="maintab">
        <div id="div_set" class="div_set">
			<ul id="show_Main">
				<li class="vrig" id="laMain">
		  		<table id="Tablers485" border="0" width="520" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="right" id="Tdrs485" ><LABEL id="laCOMRS485Title">串口 RS485</LABEL></td><td></td>
                </tr>
                <tr>
                  <td id="Tdbaudrate" width="160" align="right"><LABEL id="laRS485BaudRate">波特率</LABEL></td>
                  <td align="left"><select name="baudrate1" id="baudrate1" class="input2">
                      <option value="300" selected="selected">300</option>
                      <option value="600">600</option>
                      <option value="1200">1200</option>
                      <option value="2400">2400</option>
                      <option value="4800">4800</option>
                      <option value="9600">9600</option>
                      <option value="14400">14400</option>
                      <option value="19200">19200</option>
                      <option value="38400">38400</option>
                      <option value="56000">56000</option>
                      <option value="57600">57600</option>
                      <option value="115200">115200</option>
                      <option value="128000">128000</option>
                      <option value="256000">256000</option>
                  </select>                  </td>
                </tr>
                <tr>
                  <td id="Tddatabits" align="right"><LABEL id="laRS485DataBits">数据位</LABEL></td>
                  <td align="left"><select name="databits1" size=""  class="input2" id="databits1">
                      <option value="5" selected="selected">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                  </select>                  </td>
                </tr>
                <tr>
                  <td id="Tdstopbits" align="right"><LABEL id="laRS485StopBits">停止位</LABEL></td>
                  <td align="left"><select name="stopbits1" size="" id="stopbits1"  class="input2">
                      <option value="1" selected="selected">1</option>
                      <option value="2">2</option>
                  </select></td>
                </tr>
                <tr>
                  <td id="Tdchecktype" align="right"><LABEL id="laRS485CheckType">检验位</LABEL></td>
                  <td align="left"><select name="checktype1" size=""  class="input2" id="checktype1" >
                      <option id="opRS485CheckType1" value="0" selected="selected">无</option>
                      <option id="opRS485CheckType2" value="1">奇校验</option>
                      <option id="opRS485CheckType3" value="2">偶校验</option>
                      <option id="opRS485CheckType4" value="3">标记</option>
                      <option id="opRS485CheckType5" value="4">空格</option>
                  </select></td>
                </tr>
                <tr>
                  <td id="Tdflowctrl" align="right"><LABEL id="laRS485FlowCtrl">流控制</LABEL></td>
                  <td align="left"><select name="flowctrl1" size=""  class="input2" id="flowctrl1">
                      <option id="opRS485FlowCtrl1" value="0" selected="selected">无</option>
                      <option id="opRS485FlowCtrl2" value="1">硬件</option>
                      <option id="opRS485FlowCtrl3" value="2">Xon/Xoff</option>
                    </select>
				  </td>
                </tr>
              </table>
		   
			<table id="Tablers232" border="0" width="520" cellspacing="0" cellpadding="0" style="margin-top:12px; display:none;">
                <tr>
                  <td align="right" id="Tdrs232" ><LABEL id="laCOMRS232Title">串口 RS232</LABEL></td><td></td>
                </tr>
				<tr>
				  <td id="Tdbaudrate2" width="160" align="right"><LABEL id="laRS232BaudRate">波特率</LABEL></td>
				  <td align="left"><select name="baudrate2" id="baudrate2" class="input2">
					  <option value="300" selected="selected">300</option>
					  <option value="600">600</option>
					  <option value="1200">1200</option>
					  <option value="2400">2400</option>
					  <option value="4800">4800</option>
					  <option value="9600">9600</option>
					  <option value="14400">14400</option>
					  <option value="19200">19200</option>
					  <option value="38400">38400</option>
					  <option value="56000">56000</option>
					  <option value="57600">57600</option>
					  <option value="115200">115200</option>
					  <option value="128000">128000</option>
					  <option value="256000">256000</option>
				  </select>                  </td>
				</tr>
				<tr>
				  <td id="Tddatabits2" align="right"><LABEL id="laRS232DataBits">数据位</LABEL></td>
				  <td align="left"><select name="databits2" size=""  class="input2" id="databits2">
					  <option value="5" selected="selected">5</option>
					  <option value="6">6</option>
					  <option value="7">7</option>
					  <option value="8">8</option>
				  </select>                  </td>
				</tr>
				<tr>
				  <td id="Tdstopbits2" align="right"><LABEL id="laRS232StopBits">停止位</LABEL></td>
				  <td align="left"><select name="stopbits2" size="" id="stopbits2"  class="input2">
					  <option value="1" selected="selected">1</option>
					  <option value="2">2</option>
				  </select></td>
				</tr>
				<tr>
				  <td id="Tdchecktype2" align="right"><LABEL id="laRS232CheckType">检验位</LABEL></td>
				  <td align="left"><select name="checktype2" size=""  class="input2" id="checktype2" >
					  <option id="opRS232CheckType1" value="0" selected="selected">无</option>
					  <option id="opRS232CheckType2" value="1">奇校验</option>
					  <option id="opRS232CheckType3" value="2">偶校验</option>
					  <option id="opRS232CheckType4" value="3">标记</option>
					  <option id="opRS232CheckType5" value="4">空格</option>
				  </select></td>
				</tr>
				<tr>
				  <td id="Tdflowctrl2" align="right"><LABEL id="laRS232FlowCtrl">流控制</LABEL></td>
				  <td align="left"><select name="flowctrl2" size=""  class="input2" id="flowctrl2">
					  <option id="opRS232FlowCtrl1" value="0" selected="selected">无</option>
					  <option id="opRS232FlowCtrl2" value="1">硬件</option>
					  <option id="opRS232FlowCtrl3" value="2">Xon/Xoff</option>
					</select>
				  </td>
				</tr>
			  </table>
				</li>
			</ul>
			
		</div>
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
<%outTerminalCfgEx();%>
</body>
</html>
