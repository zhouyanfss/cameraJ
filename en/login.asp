<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html> 
<head>
<title>WEB SERVICE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<script type="text/javascript" src="script/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="script/m.js"></script>
<script type="text/javascript" src="script/more.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="script/functions.js"></script>
<script type="text/javascript" src="script/language.js"></script>
<script type="text/javascript" src="script/ajax.js"></script>
<script type="text/javascript" src="script/flush_string.js"></script>

<script type="text/javascript" src="jsmain/getcookie.js"></script>
<script type="text/javascript" src="jsmain/index.js"></script>
<script type="text/javascript" src="jsmain/liveview.js"></script>
<script type="text/javascript" src="jsmain/send.js"></script>
<script type="text/javascript" src="jsmain/replay.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="style/index.css" />
<link rel="stylesheet" type="text/css" media="screen" href="style/menus.css" />
<link rel="stylesheet" type="text/css" media="screen" href="style/replay.css" />
</head>
<script language="javascript" for="WebCMS" event="CBK_LoginResult(nRESULT)">
	onLoginNVS(nRESULT);
</script>
<script language="javascript" for="WebCMS" event="CBK_ChangeWindow(nWINDOW)">
	$("nwindows").value = nWINDOW;
	//btnStatus();	
</script>
<script language="javascript" for="WebCMS" event="CBK_SaveCaptureFile(szFILENAME)">
	window.status	= "Save:" + szFILENAME;
	setTimeout("window.status='';",5000);
</script>
<script language="javascript" for="WebCMS" event="CBK_ViewChannelNum(nCHTOTAL);)">
	if(nCHTOTAL==1){
		if(parseInt($("zoomin").value)==2){
			$("WebCMS").ImageZoomIn(0);
			$("zoomin").value	= 0;
			$("b_zoom").className	= "leftbtn zoom1";
		}
	}else{
		$("WebCMS").ImageZoomIn(0);
		$("zoomin").value	= 2;
		$("b_zoom").className	= "leftbtn zoom2";
	}
</script>
<script language="javascript" for="WebCMS" event="CBK_Alarms(nALARMS)">
	onAlarms(nALARMS);
</script>

<script language="javascript" for="ReVideoX" event="CBK_SearchFileResult(szChannel, szFileName)">
	CBK_SearchResultProgress(szChannel, szFileName);
	//result_Rt(szChannel, szFileName);	//搜索回调
</script>
<script language="javascript" for="ReVideoX" event="CBK_SearchFileResultEx(nRecType, szChannel, nmark, szFileName, nRecSize)">
	CBK_SearchResultProgressEx(nRecType, szChannel, nmark, szFileName, nRecSize);
</script>
<script language="javascript" for="ReVideoX" event="CBK_SearchFileFinish()">
	$("btnSearchRecord").innerHTML = ATTRTITLESEARCH;	//搜索完成时回调
	$("bSearch").value	= 0;
</script>
<script language="javascript" for="ReVideoX" event="CBK_ChangeWindow(nWindow)">
	$("nwindows").value = nWindow;	//选定的窗口回调
</script>
<script language="javascript" for="ReVideoX" event="CBK_ChangePlayStatus(nWindow,nFlag))">
	$("nwindows").value = nWindow;	//选定的窗口回放事件标志回调
	$("winstor").value 	= nFlag;	// 0＝无回放任务  1＝回放远程图片 2＝回放远程录像 3＝回放本地图片 4＝回放本地录像
</script>
<script language="javascript" for="ReVideoX" event="CBK_NetOpenFile(nResult)">
	CBK_OpenFileErr(nResult);	//当打开网络文件失败时返回错误码
</script>
<script language="javascript" for="ReVideoX" event="CBK_PlayProgressEx(nWindow,nTotalTime,nUseTime)">
	CBK_PlayProgressEx(nWindow,nTotalTime,nUseTime);	//回放进度回调
</script>
<script language="javascript" for="ReVideoX" event="CBK_RefreshPlayStatus(nPLAY,nPAUSE,nSTOP,nBACK,nFORWARD,nSTEPBACK,nSTEPIN,nAUDIO,nLOOP,nCAPTURE)">
	CBK_RefreshPlayStatus(nPLAY,nPAUSE,nSTOP,nBACK,nFORWARD,nSTEPBACK,nSTEPIN,nAUDIO,nLOOP,nCAPTURE);
</script>
<body>
<div id="lg_out">
  <div id="login">
    <div id="lg">
		<div class="logo"><img src="" style="display:none;" /></div>
		<div class="logincon">
			<ul>
			  <li class="titlelog" id="liUserName" style="font-weight:bold; color:#000;">用户名</li>
			  <li class="tvalue"><input id="username" type="text" onFocus="this.select();" onMouseOver="this.focus();" /></li>
			</ul>
			<ul>
			  <li class="titlelog" id="liPassword" style="font-weight:bold; color:#000;">密码</li>
			  <li class="tvalue"><input id="password" type="password" onFocus="this.select();" onMouseOver="this.focus();" /></li>
			</ul>
			<div class="lg_con_in">
			  <div class="lg_con_in_1"><a id="b_login" href="javascript:;">登录</a><a id="b_cancel_l" href="javascript:;">取消</a></div>
			</div>					     
			<div id="liOCX"></div>					     
		</div> 
	</div>
  </div>
</div>
<!-----Login end-------->
<!-----辅助信息-------->
<div style="display:none; width:0px; height:0px;">
<form name="outcfg_frm" id="outcfg_frm" method="post" action="" style="height:0px;">
	<input type="hidden" value="1" 	id="nwindows"  	name="nwindows" >
	<input type="hidden" value="0" 	id="zoomin"  	name="zoomin" >
	<input type="hidden" value="0" 	id="bCenterWeb" name="bCenterWeb" >
	<input type="hidden" value="1" 	id="vlanguage" 	name="vlanguage" ><!--0EngLish	1Chinese//-->
	
	<input type="hidden" value="0" 	id="digest"  	name="digest" >
	<input type="hidden" value="1" 	id="ipc"  		name="ipc" >
	
	<input type="hidden" name="url" 	id="url" 	value="192.168.1.231" />
	<input type="hidden" name="port" 	id="port" 	value="5000"/>
	<input type="hidden" name="uname" 	id="uname" 	value="admin"/>
	<input type="hidden" name="passwd" 	id="passwd" value="admin"/>
	
	<input type="hidden" value="4" name="nlevel" 	id="nlevel" />
	
	<input type="hidden" value="80" 	id="devicetype" 	name="devicetype" />
	<input type="hidden" value="1" name="nchannel" 	id="nchannel" />
	<input type="hidden" value="1" name="nstorage" 		id="nstorage" />
		
	<input type="hidden" value="1920" 	id="mainwidth"  	name="mainwidth" >
	<input type="hidden" value="1280" 	id="mainheight"  	name="mainheight" >
	<input type="hidden" value="640"  	id="subwidth"  		name="subwidth" >
	<input type="hidden" value="480" 	id="subheight"  	name="subheight" >
	
	<input type="hidden" value="64" 	id="vbri" 		name="vbri">
	<input type="hidden" value="127" 	id="vhue" 		name="vhue">
	<input type="hidden" value="78" 	id="vcon" 		name="vcon">
	<input type="hidden" value="210" 	id="vsat" 		name="vsat">
	
	<input type="hidden" value="1" name="OutputCtrl1" id="OutputCtrl1">
	<input type="hidden" value="0" name="OutputCtrl2" id="OutputCtrl2">
	<input type="hidden" value="0" name="OutputCtrl3" id="OutputCtrl3">
	<input type="hidden" value="0" name="OutputCtrl4" id="OutputCtrl4">
	<input type="hidden" value="0" name="OutputCtrl5" id="OutputCtrl5">
	<input type="hidden" value="0" name="OutputCtrl6" id="OutputCtrl6">
	<input type="hidden" value="0" name="OutputCtrl7" id="OutputCtrl7">
	<input type="hidden" value="0" name="OutputCtrl8" id="OutputCtrl8">
	<input type="hidden" value="1" name="noutput" 	  id="noutput" />
	
	<input type="hidden" value="0" 	id="iswifi"  	name="iswifi" >
	<input type="hidden" value="1" 	id="wifi"  		name="wifi" >
	<input type="hidden" value="0" 	id="IsCDMA"  	name="IsCDMA" >
	<input type="hidden" value="0" 	id="mobilecfg" 	name="mobilecfg" >
	<input type="hidden" value="0" 	id="IsGPS"  	name="IsGPS" >
	<input type="hidden" value="0" 	id="netsnmp"  	name="netsnmp" >
	<input type="hidden" value="0" 	id="httpscfg"  	name="httpscfg" >

	<input type="hidden" value="0" 	id="zxlwcfg"  	name="zxlwcfg" >
	<input type="hidden" value="0" 	id="hxhtcfg"  	name="hxhtcfg" >
	<input type="hidden" value="0" 	id="xdtxcfg"  	name="xdtxcfg" >
	<input type="hidden" value="0" 	id="accesscfg"  name="accesscfg" >
	<input type="hidden" value="0" 	id="smcfg"  	name="smcfg" >
	<input type="hidden" value="0" 	id="gb28181"  	name="gb28181" >
</form>
</div>
<div class="ie6-out">
  <div class="ie6-in">
	<div class="min-width">
	  <div id="main">
		<div class="header" id="nav_head">
		  <div id="logo"><a title=""><img  src="image/logo.png" /></a></div>
		  <div  class="nav" id="nav">
			<ul>
			  <li id="b_a"> <a id="b_preview" class="nav_btn1" hidefocus="true" href="javascript:;">   预览   </a></li>
			  <li id="b_ab"> <a id="b_playback" class="nav_btn" hidefocus="true" href="javascript:;">   录像回放   </a></li>
			  <li id="b_b" style="display:none;"> <a id="b_ptzctrl" class="nav_btn" hidefocus="true" href="javascript:;"> PTZ </a></li>
			  <li id="b_c"> <a id="b_config" class="nav_btn" hidefocus="true" href="javascript:;">   设置   </a></li>
			  <li id="b_d"> <a id="b_alarm" class="nav_btn" hidefocus="true" href="javascript:;">   报警   </a>
			  	<div class="alarmtip" id="d_alarmtip" style="display:none;"></div></li>
			</ul>
		  </div>
		  <div id="tuichu"> <a id="b_quit" class="nav_btn" hidefocus="true" href="javascript:;">注销</a></div>	
		</div>
		<!-----header end-------->
		<!-----mb 预览 & PTZ-------->
		<div id="mb" class="content">
			<div class="preview_ct">
				<div id="videoH" class="videoCon">
				  <div id="videoCon"  class="vedioNew">
					<div id="video1" class="video1"><!---实时视频区域--->
						<!--<object name="WebCMS" ID="WebCMS" style="width:100%;" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" codebase="/WebCMS.exe#Version=2,0,0,0"></object>-->
						<div style="z-index:-1; position:relative;">
						<object name="WebCMS" ID="WebCMS" style="width:100%;" CLASSID="CLSID:8DA9A0A7-AC21-4EA9-BB7E-43AEF89688A6" codebase="/WebCMS.exe#Version=2,0,0,0"></object>
						</div>
						<div id="mb_btn_bar" class="videotop"></div>
					</div>
					<!--此处开始是 图像调节 内容-->
					<div id="image_adjust" class="preview_rt"></div>
					<!--此处开始是聚焦缩放内容-->
					<div id="focus_adjust" class="preview_rt clearfix"></div>
					<!--到此处结束-->
					<div style="display:block;height:100%;width:7px; float:left; background-color:#999999;"><image id="imgspread" style="position:absolute; top:47%; cursor:pointer; " onclick="btnLiveCtrl(null, 51)" src="../image/spread.gif"></image></div>
					<div id="ptz_control" class="preview_rt"></div>
				  </div><!--videoCon-->
				</div>
			</div><!---preview_ct--->
		</div>
		
		<!-----mb0 设置-------->
		<div id="mb0" class="content" style="display:none;">
		  <div class="settingDiv" id="divSetting">
		  	<div id="mb0_setting_bar" class="settingleft"></div>
			<div style=" display:block;overflow:hidden;">
				<div id="mb0_setting_subbar" class="settingsubtitle"></div>
				<div id="mb0_setting" class="settingright">
					<iframe id="set_fm" src="" width="100%" height="100%" frameborder="0" style="min-width:760px;min-height:510px;_height:510px;y-overflow:auto;x-overflow:hidden;"></iframe>
				</div>
			</div>
		  </div>
		</div>
		
		<!-----mb1 回放-------->
		<div id="mb1" class="content" style="display:none;">
			<div id="revideoH" class="videoCon">
				<div id="review_ctrl">
				</div>
				<div id="review_video">
					<div  class="rebar" id="div_replay_menus"></div>	
					<div id="video2" class="video2">
					</div>
				</div>
			</div>
		</div>
		<!-----mb1 end-------->
				
		<!-----mb2 报警-------->
		<div id="mb2" class="content" style="display:none;">
			<div id="alarmH" class="videoCon">
				<div id="alarm_body" class="alarm_con"><iframe id="alarm_fm" src="" width="100%" height="100%" frameborder="0" style="min-width:760px;min-height:510px;_height:510px;y-overflow:auto;x-overflow:hidden;"></iframe></div>
			</div>
		</div>
		
		<div class="footer"></div>
	  </div>
	  <!----<div id="main"> --->
	</div>
  </div>
</div>
<div id="estopAll" style="display:none;" class="estopAll" ></div>
<iframe name="btnHit" id="btnHit" src="" align="btnHit" frameborder="0" scrolling="no" style="background-color:#000000;" height="0" width="0"></iframe>

<% 
outLoginCMS(); 
%>

</body>
</html>