document.charset = "utf-8";
var m_xmlDoc		= null;

/*************************************************
Function:		ChangeLanguage
Description:	改变页面语言
Input:			xmlFile：xml文件
				lan：语言
Output:			无
return:			无				
*************************************************/
function ChangeLanguage(xmlFile, lan)
{
	m_xmlDoc	= null;
	getXMLHandler(xmlFile, lan);	//加载语言xml
	
	//window.parent.TranslatePage();
	TranslatePage();	//翻译

	//window.parent.document.title = getNodeValue('title');
	window.document.title = getNodeValue('title');
}

/*************************************************
Function:		getXMLHandler
Description:	读取xml文件，返回xmlDoc对象
Input:			xmlFile：xml文件名(路径)
				language:语言
Output:			无
return:			xmlDoc对象
*************************************************/
function getXMLHandler(xmlFile, language)
{
	if(language == null) return;
	try
	{
		m_xmlDoc = parseXml(xmlFile);
		for(var i = 0; i < m_xmlDoc.getElementsByTagName("Resources").length; i++)
		{
			if(language == m_xmlDoc.getElementsByTagName("Resources")[i].getAttribute("lan"))
			{
				break;
			}
		}
		m_xmlDoc = m_xmlDoc.getElementsByTagName("Resources")[i];
	}
	catch(e)
	{
		alert("getXMLHandler: " + e.message)
	}
	return m_xmlDoc;
}

/*************************************************
Function:		parseXml
Description:	从xml文件中解析xml
Input:			无
Output:			无
return:			无				
*************************************************/
function parseXml(fileRoute)
{
	var xmlDoc = null;
	if(window.ActiveXObject)
	{
		xmlDom = new ActiveXObject("Microsoft.XMLDOM");
		xmlDom.async = false;
		xmlDom.load(fileRoute);
		xmlDoc = xmlDom;
	}
	else if(document.implementation && document.implementation.createDocument)
	{
		var xmlhttp = new window.XMLHttpRequest();
		xmlhttp.open("GET", fileRoute, false);
		xmlhttp.send(null);
		xmlDoc = xmlhttp.responseXML;
	}
	else
	{
		xmlDoc = null;
	}
	return xmlDoc;
}

/*************************************************
Function:		TranslatePage
Description:	转换界面中的语言
Input:
Output:			无
return:			无
*************************************************/
function TranslatePage()
{
	TranslateElements(document, 'input', 'value' ) ;
	//this.TranslateElements( targetDocument, 'SPAN', 'innerHTML' ) ;
	TranslateElements(document, 'LABEL', 'innerHTML');
	TranslateElements(document, 'img', 'title');
	TranslateElements(document, 'option', 'text');
	
	TranslateElements(document, 'button', 'innerHTML' ) ;
}

/*************************************************
Function:		TranslateElements
Description:	转变元素语言
Input:			targetDocument:文档
				tag:标签名
				propertyToSet:方式
Output:			无
return:			无
*************************************************/
function TranslateElements(targetDocument, tag, propertyToSet)
{
	var e = targetDocument.getElementsByTagName(tag);
	for(var i = 0; i < e.length; i++)
	{
		var sKey = e[i].getAttribute('id');
		if(sKey)
		{
			var s = getNodeValue(sKey);
			if(s == null) return;
			if(s && tag == 'LABEL' && s.indexOf ('&lt;') >= 0 )
			{
			   s = s.replace(/ /g, "&nbsp;");
			}
			if(s)
				eval('e[i].' + propertyToSet + ' = s');
		}
	}
}

/*************************************************
Function:		getNodeValue
Description:	得到节点值
Input:			tagName:元素名
Output:			无
return:			无
*************************************************/
function getNodeValue(tagName)
{
	if(m_xmlDoc == null)
	{
		return null;
	}
	if(m_xmlDoc.getElementsByTagName(tagName) != null)
	try
	{
		return m_xmlDoc.getElementsByTagName(tagName)[0].childNodes[0].nodeValue;
	}
	catch(e)
	{
		return "";
	}
}

/*************************************************
Function:		getJsAlertText
Description:	遍历Js提示语言
Input:			无
Output:			无
return:			无
*************************************************/
function getJsAlertText()
{
	var t_xmlDoc = m_xmlDoc.getElementsByTagName("Js")[0].childNodes;
//	alert(t_xmlDoc.length);
//	alert(t_xmlDoc[0].nodeName);
//	alert(t_xmlDoc[0].childNodes[0].nodeValue);
	for(var i = 0; i < t_xmlDoc.length; i++)
	{
		if(t_xmlDoc[i].nodeName != null)
		{
			try{
				eval(t_xmlDoc[i].nodeName + " = '" + t_xmlDoc[i].childNodes[0].nodeValue + "';");
			}catch(e){}
		}
	}
	t_xmlDoc	= null;
	t_xmlDoc = m_xmlDoc.getElementsByTagName("Array")[0].childNodes;
	for(var i = 0; i < t_xmlDoc.length; i++){
		if(t_xmlDoc[i].nodeName != null){
			try{
				eval(t_xmlDoc[i].nodeName + " = " + t_xmlDoc[i].childNodes[0].nodeValue + ";");
			}catch(e){}
		}
	}
	//alert(UpdatePluginTips);
}
