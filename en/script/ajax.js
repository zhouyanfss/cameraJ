// JavaScript Document
var oSend,xmlResult;
var UserId = 10000;	//随机数

//创建发送异步处理对象
function CreateAjax(){
	try{
		if(window.ActiveXObject){   		//IE
			 for( var i=7; i>0; i-- ){
				try{
					switch(i){
					  case 2:
					  	oSend = new ActiveXObject( "Microsoft.XMLHTTP" ); break;
					  case 3:case 4:case 5:
					  	oSend = new ActiveXObject( "Msxml2.XMLHTTP." + i + ".0" ); break;
					  default:
					  	oSend = new ActiveXObject( "Msxml2.XMLHTTP" ); break;
					}
//http_request.setRequestHeader("Content-Type","text/xml"); http_request.setRequestHeader("Content-Type","gb2312"); 
					i=-1;
				}catch(e){oSend = false;}
			 }
		}else if(window.XMLHttpRequest){ oSend = new XMLHttpRequest(); // Mozilla、Netscape、FireFox、Opera﹑Safari...
	　		//if (oSend.overrideMimeType) {oSend.overrideMimeType('text/xml');}
		}
	}catch(e){oSend = false;} 
}

//兼容其他浏览器,解析返回的XML数据
function LoadXMLDocument(Obj,ObjSend){
	try {
		if( window.ActiveXObject ){//ie内核的浏览器
			var aVersions =[ "MSXML2.DOMDocument.6.0","MSXML2.DOMDocument.5.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument","Microsoft.XmlDom"];
			for (var i = 0; i < aVersions.length; i++) {
				try {xmlResult = new ActiveXObject(aVersions[i]); i = aVersions.length;}catch (oError) {}
			}
			xmlResult.async = false;
			xmlResult.resolveExternals = false;
			try{//var tmpText = bytes2BSTR(ObjSend.responseBody);
				var tmpText = ObjSend.responseText;
				//tmpText = "<?xml version='1.0' encoding='GB2312'?>\n"+ tmpText;
				//$("strpagination").innerText = tmpText;
				//alert(tmpText);
				xmlResult.loadXML(tmpText);
			}catch(oError){xmlResult.loadXML(ObjSend.responseXML.xml);}
		}else if(window.DOMParser){//firefox内核的浏览器
			var oParser = new DOMParser();
			//var tmpText = bytes2BSTR(ObjSend.responseBody);
			var tmpText = ObjSend.responseText;
			xmlResult = oParser.parseFromString(tmpText, "text/xml" );
			XMLDocument.prototype.__proto__.__defineGetter__("text",function(){ return this.textContent; });
			Element.prototype.__proto__.__defineGetter__("text",function(){ return this.textContent; });
			XMLDocument.prototype.selectSingleNode = Element.prototype.selectSingleNode=function(XPath){
				var oEvaluator = new XPathEvaluator();
				var oResult = oEvaluator.evaluate(XPath,this,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null);
				if(null != oResult){return oResult.singleNodeValue;}
				return null;
			}
			XMLDocument.prototype.selectNodes = Element.prototype.selectNodes = function(sXPath){
				var oEvaluator = new XPathEvaluator();
				var oResult = oEvaluator.evaluate(sXPath,this,null,XPathResult.ORDERED_NODE_ITERATOR_TYPE,null);
				var aNodes = new Array();
				if(null != oResult){
					var oElement = oResult.iterateNext();
					while(oElement){aNodes.push(oElement);oElement = oResult.iterateNext();}
				}
				return aNodes;
			}
		}else{return false;}
	}
	catch (oError) {}
}

// (暂不使用)  创建一个dom对象
function createDocument(){
	try {
		if( window.ActiveXObject ){//ie内核的浏览器
			var doc = createDocumentIE(); return doc;
		}else if(window.DOMParser){var doc = new DOMParser(); return false;	//firefox内核的浏览器
			//var doc = createDocumentMozilla();
		}else{return false;}
	}catch (oError) {}
}
// (暂不使用)  创建一个dom对象时如果是IE浏览调用 createDocument中调用
function createDocumentIE() {
	var oXmlDom;
	var aVersions =[ "MSXML2.DOMDocument.6.0","MSXML2.DOMDocument.5.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument","Microsoft.XmlDom"];
		for (var i = 0; i < aVersions.length; i++) {
			try {oXmlDom = new ActiveXObject(aVersions[i]); return oXmlDom;}catch (oError) {}
		}
	//throw new Error("MSXML is not installed.");
}
// (暂不使用)  创建一个dom对象时如果是Mozilla浏览调用
function createDocumentMozilla() {
	var _xmlDom;
  try{
	if(_xmlDom == null && document.implementation && document.implementation.createDocument){
		_xmlDom = document.implementation.createDocument("","",null);
		Document.prototype.loadXML = function(sXml){
			var oParser= new DOMParser();
			var _xmlDom = oParser.parseFromString(sXml, "text/xml");
			while(this.firstChild){ this.removeChild(this.firstChild);}
			for(var i=0;i<_xmlDom.childNodes.length;i++){var oNewNode = this.importNode(_xmlDo.childNodes[i],true); this.appendChild(oNewNode);}
		}
		Element.prototype.__defineGetter__("text",function(){ return this.textContent; });
		Element.prototype.selectSingleNode=function(sXPath){
			var oEvaluator = new XPathEvaluator();
			var oResult = oEvaluator.evaluate(sXPath,this,null, XPathResult.FIRST_ORDERED_NODE_TYPE,null);
			if(null != oResult){return oResult.singleNodeValue;}
			return null;
		}
		Element.prototype.selectNodes = function(sXPath){
			var oEvaluator = new XPathEvaluator();
			var oResult = oEvaluator.evaluate(sXPath,this,null, XPathResult.ORDERED_NODE_ITERATOR_TYPE,null);
			var aNodes = new Array();
			if(null != oResult){
				var oElement = oResult.iterateNext();
				while(oElement){aNodes.push(oElement); oElement = oResult.iterateNext();}
			}
			return aNodes;
		}
		return _xmlDom;
	}
	return false;
  }catch (ex){return false;}
}
function selectSingleNode(xmlDoc, elementPath){//获取SingleNode对象: xmlDoc:XmlDOM, elementPath:指定路径
	if(window.ActiveXObject){return xmlDoc.selectSingleNode(elementPath);}
	else{
        var xpe = new XPathEvaluator();
        var nsResolver = xpe.createNSResolver( xmlDoc.ownerDocument == null ? xmlDoc.documentElement : xmlDoc.ownerDocument.documentElement);
        var results = xpe.evaluate(elementPath,xmlDoc,nsResolver,XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        return results.singleNodeValue; 
	}
}
function getNodeVale(xmlElements){//获取SingleNode值: xmlElements:SingleNode对象
	if(xmlElements){
		if(window.ActiveXObject){return xmlElements.text;}
		else{return xmlElements.childNodes[0].nodeValue}
	}else{return false;}
}
function selectSingleNodeValue(xmlDoc, elementPath){//获取SingleNode值: xmlDoc:XmlDOM, elementPath:指定路径
	if(window.ActiveXObject){return xmlDoc.selectSingleNode(elementPath).text;}
	else{
        var xpe = new XPathEvaluator();
        var nsResolver = xpe.createNSResolver( xmlDoc.ownerDocument == null ? xmlDoc.documentElement : xmlDoc.ownerDocument.documentElement);
        var results = xpe.evaluate(elementPath,xmlDoc,nsResolver,XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        return results.singleNodeValue.childNodes[0].nodeValue; 
	}
}
function selectNodes(xmlDoc, elementPath){//获取Nodes数组: xmlDoc:XmlDOM, elementPath:指定路径
    if(window.ActiveXObject){return xmlDoc.selectNodes(elementPath);}
    else{
        var xpe = new XPathEvaluator();
        var nsResolver = xpe.createNSResolver( xmlDoc.ownerDocument == null ? xmlDoc.documentElement : xmlDoc.ownerDocument.documentElement);
        var result = xpe.evaluate(elementPath, xmlDoc, nsResolver, 0, null);
        var found = [], res;
        while(res = result.iterateNext()){found.push(res);}
        return found;
     }
} 
//演示实例
function domeExample(paramFlag, paramCmd, paramCtrl, paramReserved){
try{
	var strURL = "/webs/domeExampleSetting";
	var xmlText 	= "<Message><flag>"+paramFlag+"</flag>";
	xmlText 		= xmlText + "<cmd>"+ paramCmd +"</cmd>";
	xmlText 		= xmlText + "<ctrl>"+ paramCtrl +"</ctrl>";
	xmlText 		= xmlText + "<reserved>"+ paramReserved +"</reserved>";
	xmlText			= xmlText + "</Message>";
	strURL	= strURL + "?flag=" + paramFlag + "&cmd="+ paramCmd +"&ctrl="+ paramCtrl +"&reserved="+ paramReserved +"";
	//window.status = strurl;
	CreateAjax();
	if(!oSend){window.status = CREATEXMLHTTPERROR; return false;}
	oSend.onreadystatechange = function (){readyStateChange(paramFlag, paramCmd, paramCtrl, paramReserved);}
	oSend.open("POST",strURL,true);
	oSend.setRequestHeader("CONTENT-TYPE", "text/xml")
	oSend.send(xmlText);
 }catch(e){
	window.status = SENDXMLHTTPERROR;
	return false;
}

}

function readyStateChange(paramFlag, paramCmd, paramCtrl, paramReserved) {
   if (oSend.readyState == 4) {
        if (oSend.status == 200){
			var strReturn, returnTitle, returnCmd;
			var xmlNodeBody, arrayNodesName;
			try{
				LoadXMLDocument(xmlResult,oSend);	//兼容其他浏览器
			}catch(e){
				window.status = CREATEDOMDOCERROR; return false;
			}
			try{
				try{
					returnTitle = xmlResult.selectSingleNode("html/title").text.toLowerCase();
				}catch(e){
					strReturn = oSend.responseText; window.status = strReturn; return false;
				}
				switch(paramFlag){
				case 10:		//单参数处理
					returnCmd 	= parseInt(xmlResult.selectSingleNode("html/body/cmd").text);
					window.status = returnCmd;
				break;
				case 11:		//属性处理
					xmlNodeBody = xmlResult.selectSingleNode("html/body");
					var xmlNodeBodyId	=  parseInt(xmlNodeBody.getAttribute("id"));
					var xmlNodeBodyLang	=  parseInt(xmlNodeBody.getAttribute("lang"));
				break;
				case 12:		//数组参数处理
					arrayNodesName 	= xmlResult.selectNodes("/html/body/item/name");
					for(i=0;i<arrayNodesName.length;i++){
					  window.status = arrayNodesName[i].text;
					}
				break;
				default:
					window.status = Strreturn;
				break;
				}
			}catch(e){
				window.status = RETURNXMLERROR;
			}
			return false;
		}else if(oSend.status == 404){
			window.status = URLERROR; return false;
		}
   }
}