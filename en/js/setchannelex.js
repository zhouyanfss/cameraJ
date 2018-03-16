// Java Document
var ChannelCount, nchannel;
var setChannelTimeout;
var runSetChannelFun 	= 1;
function initChannel(){
/*  try{
	if(lanset==0){
		$s("divChannelTitle").innerHTML		= HTMLCHANNELNAME;
		$s("divChannelSyncTitle").innerHTML		= HTMLCHANNELSYNC;
	}
 }catch(e){}
*/ try{
	ChannelCount 	= parseInt(getCookies("intChannel"));
	nchannel 		= parseInt(getCookies("nChannel"));
	if(isNaN(ChannelCount) || ChannelCount < 1 ){ChannelCount = 1;}
	if(isNaN(nchannel) || nchannel < 1 ){nchannel = 1;}
	if(nchannel > ChannelCount){nchannel = ChannelCount;}
	if(ChannelCount > 8){ChannelCount = 8;}
	if(nchannel > 8){nchannel = 1;}
	if(ChannelCount <= 1){
		ChannelCount = 1;
		$s("TableChan").style.display	= "none";
	}else{
		$s("TableChan").style.display	= "";
		var Strchan = "channel1"
		for(i=1;i<=ChannelCount;i++){
			Strchan = "channel" + i;
			$s(Strchan).style.display	= "";
		}
		Strchan = "channel" + nchannel;
		$s(Strchan).src = "images/botton/off/" + nchannel + ".jpg";
	}
	setCookies("nchannel", nchannel, 7);
  }catch(e){}
}

function initSensorChannel(){
/*  try{
	if(lanset==0){
		$s("divChannelTitle").innerHTML		= HTMLCHANNELNAME;
		$s("divChannelSyncTitle").innerHTML		= HTMLCHANNELSYNC;
	}
 }catch(e){}
*/ try{
	ChannelCount = parseInt($s("channelnum").value);
	if(isNaN(ChannelCount) || ChannelCount < 1 ){ChannelCount = parseInt(getCookies("alarmrecordcount"))};
	nchannel = parseInt(getCookies("nChannel"));
	if(isNaN(ChannelCount) || ChannelCount < 1 ){ChannelCount = 1;}
	if(isNaN(nchannel) || nchannel < 1 ){nchannel = 1;}
	if(nchannel > ChannelCount){nchannel = ChannelCount;}
	if(ChannelCount > 8){ChannelCount = 8;}
	if(nchannel > 8){nchannel = 1;}
	if(ChannelCount <= 1){
		ChannelCount = 1;
		$s("TableChan").style.display	= "none";
	}else{
		$s("TableChan").style.display	= "";
		var Strchan = "channel1"
		for(i=1;i<=ChannelCount;i++){
			Strchan = "channel" + i;
			$s(Strchan).style.display	= "";
		}
		Strchan = "channel" + nchannel;
		$s(Strchan).src = "images/botton/off/" + nchannel + ".jpg";
	}
	setCookies("nchannel", nchannel, 7);
  }catch(e){}
}

function ChangeChannel(nchan, purl){
	//if(Timeouts < 2) return false;
	if(runSetChannelFun == 1)
		FunPercentEx("/webs/setChannelEx", 9999, nchan, purl);
	setChannelTimeout = setTimeout("RefreshChannel('"+purl+"');", 3000); //3秒都没有响应时,刷新页面.正常页面转跳时,在osend回调里完成.
	runSetChannelFun	= 0;
	return true;
}
function ThreadedChannel(nchan, purl){
	window.clearTimeout(setChannelTimeout);
	runSetChannelFun	= 0;
	var nchannels	= nchan;
	if(nchannels > 8){nchannels = 1;}
	var strurl;
	if(purl == null || purl == ""){
		var str = window.location.href; strurl = str.substring(str.lastIndexOf("/") + 1) 
	}else{strurl = purl;}
	setCookies("nChannel", nchannels, 7);
	location.href = strurl;
}
function RefreshChannel(purl){
	var strurl;
	if(purl==null||purl==""){
		var str = window.location.href; strurl = str.substring(str.lastIndexOf("/") + 1) 
	}else{strurl = purl;}
	location.href = strurl;
}
