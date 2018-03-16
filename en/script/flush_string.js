// JScript 文件
var g_langName = "";
var g_stringXmlDoc = createXMLDoc();
/*******************************************************************************************
*   功能：用XML格式存储的多语言字符串表填充HTML中的标签
*******************************************************************************************/
function FlushLabels(xmlElements){
    for (itemXml = 0; itemXml < xmlElements.length; itemXml++){
        if (xmlElements[itemXml].nodeName == "page_title"){
            document.title = xmlElements[itemXml].childNodes[0].nodeValue;
        }else{
            htmlElement = document.getElementById(xmlElements[itemXml].nodeName);
            if(htmlElement == null){
//				window.alert(xmlElements[itemXml].nodeName);
				continue;
            }
            if (htmlElement.type == "button"){
                htmlElement.value = xmlElements[itemXml].childNodes[0].nodeValue;
            }else if(htmlElement.tagName.toLowerCase() == "img" || htmlElement.title.toLowerCase() == "alert"){
                //zld 2010/8/28
                htmlElement.title = xmlElements[itemXml].childNodes[0].nodeValue;
                //htmlElement.alt = xmlElements[itemXml].childNodes[0].nodeValue;
            }else{
                htmlElement.innerHTML = xmlElements[itemXml].childNodes[0].nodeValue;
            }
        }
    }
}

function ApplyXmlLang(xmlFile, xmllan){
    g_xmlhttp.open("get", "xml/"+xmllan+"/"+xmlFile, false);
    
    SafeHttpSend(g_xmlhttp, null);
    if (g_stringXmlDoc!=null){
        delete g_stringXmlDoc;
        g_stringXmlDoc=null;
    }      
    g_stringXmlDoc = FormatToXmlDOM(g_xmlhttp.responseText); 
    g_stringXmlDoc.async = false;
    //<DEL BEGIN>
    FlushLabels(g_stringXmlDoc.documentElement.childNodes);
}