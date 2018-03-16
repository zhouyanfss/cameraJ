//20130523
var g_xmlhttp = createXMLHttp();
var g_xmlDoc = createXMLDoc();

//创建发送异步处理对象
function createXMLHttp(){
	var xmlDocHTTP = false;
	try{
		var myos = appInfo();
		if(myos.msie && myos.version==7){	//IE7
			xmlDocHTTP = new XMLHttpRequest();
		}else if(window.ActiveXObject){		//IE
			 for( var i=7; i>0; i-- ){
				try{
					switch(i){
					  case 2:
					  	xmlDocHTTP = new ActiveXObject( "Microsoft.XMLHTTP" );//IE5
						break;
					  case 3:case 4:case 5:case 6:
					  	xmlDocHTTP = new ActiveXObject( "Msxml2.XMLHTTP." + i + ".0" );
						break;
					  default:
					  	xmlDocHTTP = new ActiveXObject( "Msxml2.XMLHTTP" );
						break;
					  }
			　　　// http_request.setRequestHeader("Content-Type","text/xml");
			　　　// http_request.setRequestHeader("Content-Type","gb2312"); 
					i=-1;
				}catch(e){}
			 }
		}else if(window.XMLHttpRequest){		// Mozilla、Netscape、FireFox、Opera﹑Safari...
			xmlDocHTTP = new XMLHttpRequest();
	　		//if (oSend.overrideMimeType) {
	　　		//oSend.overrideMimeType('text/xml');
			//}
		}
	}catch(e){} 
	return xmlDocHTTP;
}
//创建一个dom对象
function createXMLDoc(){
    xmlDoc = null;
    try{ //Firefox, Mozilla, Opera, etc.
        xmlDoc = document.implementation.createDocument("", "", null);
    }catch (e){
        try{ //Internet Explorer
            xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        }catch (e){alert(e.message);}
    }
    return (xmlDoc);
}
//发出HTTP请求
function SafeHttpSend(httpRequest, sendData){
    try{
        httpRequest.send(sendData);
    }catch(e){
        if(e instanceof Error){
 //         window.alert("向服务器发出HTTP请求失败");
            return false;
        }
    }
    
    return true;
}

//非IE浏览器读取XML oNode.xml
function serializeXml(oNode){
	var g_oSerializer = new XMLSerializer();
	return g_oSerializer.serializeToString(oNode);
}   
//格式化XML数据 如字符串格式转成XML格式
function FormatToXmlDOM(strXml){ 
   var isIE = function(){   
       var IE = /msie/i.test(navigator.userAgent);   
       return IE;   
   }   
   
   var Exc = function(){   
       var XmlDoc = null;   
       if (isIE()){   
           XmlDoc = new ActiveXObject("Microsoft.XMLDOM");    
           XmlDoc.loadXML(strXml);   
       }else{   
           //FireFox2.0銆丼afari2.0   
           XmlDoc = (new DOMParser()).parseFromString(strXml, "text/xml");   
       }   
       return XmlDoc;   
    }   
    return Exc();   
} 

function DealXmlStr(strXml){
    strXml=strXml.replace(/\r/ig,"");
    strXml=strXml.replace(/\n/ig,"");
    strXml=strXml.replace(/>\s*</g,"><"); 
    return  strXml;
}


function LoadMultiJS(jsArray, OnEndLoad){
    if(jsArray.length == 0){
        OnEndLoad();
        return;
    }
    
    var jsid = jsArray[0].replace(/\./, "_");
    
    if(document.getElementById(jsid) != null){
        jsArray.shift();
        LoadMultiJS(jsArray, OnEndLoad);
        return; 
    }
    
    //zld 2010/10/15
    var isIE = /msie/i.test(navigator.userAgent); 
    if (!isIE){
        g_xmlhttp.open("get", "script/"+jsArray[0], false);
        SafeHttpSend(g_xmlhttp, null);
        DynAppendJS(jsid, g_xmlhttp.responseText);
        jsArray.shift();
        LoadMultiJS(jsArray, OnEndLoad);          
    }else{
        g_xmlhttp.open("get", "script/"+jsArray[0], false);
        g_xmlhttp.onreadystatechange = function()
        {
            if(g_xmlhttp.readyState == 4){
                DynAppendJS(jsid, g_xmlhttp.responseText);
                jsArray.shift();
                LoadMultiJS(jsArray, OnEndLoad);          
            }
        }
        SafeHttpSend(g_xmlhttp, null);
    }
      
}

function LoadMultiJSSync(jsArray){
    for(var i = 0; i < jsArray.length; i++){
        var jsid = jsArray[i].replace(/\./, "_");
        if(document.getElementById(jsid) != null){continue;}
        
        g_xmlhttp.open("get", "script/"+jsArray[i], false);
        SafeHttpSend(g_xmlhttp, null);
        DynAppendJS(jsid, g_xmlhttp.responseText);
    }
}

function DynAppendJS(sId, source){
    if ( ( source != null ) && ( !document.getElementById( sId ) ) ){ 
        var oHead = document.getElementsByTagName('HEAD').item(0);
        var oScript = document.createElement("script");
        oScript.language = "javascript";
        oScript.type = "text/javascript";
        oScript.id = sId;
        oScript.defer = true;
        oScript.text = source;
        oHead.appendChild(oScript);
    }
}

function LoadMultiString(path, OnLoadEnd){
    var jsid = path.replace(/\./, "_");
    jsObj = document.getElementById(jsid);
    if(jsObj != null){
        document.getElementsByTagName("HEAD")[0].removeChild(jsObj);
    }

    g_xmlhttp.open("get", "language/"+g_langName+"/"+path, false);
    SafeHttpSend(g_xmlhttp, null);
//    g_xmlhttp.onreadystatechange = function()
    {
        if(g_xmlhttp.readyState == 4){
            DynAppendJS(jsid, g_xmlhttp.responseText);
            if(OnLoadEnd != null){OnLoadEnd();}
        }
    }
}

function ReLoadMultiJS(jsArray){
    for(var i = 0; i < jsArray.length; i++){
        var jsid = jsArray[i].replace(/\./, "_");
        jsObj = document.getElementById(jsid);
        if(document.getElementById(jsid) != null){
            document.getElementsByTagName("HEAD")[0].removeChild(jsObj);
        }
        
        g_xmlhttp.open("get", "script/"+jsArray[i], false);
        SafeHttpSend(g_xmlhttp, null);
        DynAppendJS(jsid, g_xmlhttp.responseText);
    }
}
//loadBodyInnerTHML("div_main_menu", "body_html/body_mainmenu.html")
function loadBodyInnerTHML(objDestination, sourcePath){
	document.getElementById(objDestination).style.display=""; 
    g_xmlhttp.open("get", sourcePath, false);
    SafeHttpSend(g_xmlhttp, null);
//     g_xmlhttp.onreadystatechange = function()
    {
        if (g_xmlhttp.readyState != 4){return;}
        document.getElementById(objDestination).innerHTML = g_xmlhttp.responseText;
                
        ApplyXmlLang("main_menu.xml");
    } 
}