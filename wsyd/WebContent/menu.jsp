<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");
String qx="";
if(session.getAttribute("qx")!=null){
qx=(String)session.getAttribute("qx");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/css_menu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<title>�ޱ����ĵ�</title>

<script language="javascript">


function getObject(objectId) {
 if(document.getElementById && document.getElementById(objectId)) {
 // W3C DOM
 return document.getElementById(objectId);
 }
 else if (document.all && document.all(objectId)) {
 // MSIE 4 DOM
 return document.all(objectId);
 }
 else if (document.layers && document.layers[objectId]) {
 // NN 4 DOM.. note: this won't find nested layers
 return document.layers[objectId];
 }
 else {
 return false;
 }
}

function showHide(objname){
    var obj = getObject(objname);
    if(obj.style.display == "none"){
		obj.style.display = "block";
	}else{
		obj.style.display = "none";
	}
}
</script>
</head>
<base target="main" />
<body>
<div class="infobox">

	
</div>
<div class="menu">


<%
if(qx.equals("����Ա")){
%>
		<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items1');" target="_self">�û�����</a></dt>
    <dd id="items1" style="display:none;">
        <ul>

	<li><a href='yonghu/addPage' target='main'>����û�</a></li>
		<li><a href='yonghu/selectall' target='main'>�û��б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items2');" target="_self">�鼮�������</a></dt>
    <dd id="items2" style="display:none;">
        <ul>

	<li><a href='sjfl/addPage' target='main'>����鼮����</a></li>
		<li><a href='sjfl/selectall' target='main'>�鼮�����б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<% }%>
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items3');" target="_self">�鼮����</a></dt>
    <dd id="items3" style="display:none;">
        <ul>

	<li><a href='shuji/addPage' target='main'>����鼮</a></li>
		<li><a href='shuji/selectall' target='main'>�鼮�б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items4');" target="_self">�½ڹ���</a></dt>
    <dd id="items4" style="display:none;">
        <ul>

	<li><a href='zhangjie/addPage' target='main'>����½�</a></li>
		<li><a href='zhangjie/selectall' target='main'>�½��б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<%
if(qx.equals("����Ա")){
%>
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items5');" target="_self">���԰����</a></dt>
    <dd id="items5" style="display:none;">
        <ul>


		<li><a href='lyb/selectall' target='main'>���԰��б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items6');" target="_self">�ղع���</a></dt>
    <dd id="items6" style="display:none;">
        <ul>


		<li><a href='shouzang/selectall' target='main'>�ղ��б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items7');" target="_self">��ǩ����</a></dt>
    <dd id="items7" style="display:none;">
        <ul>


		<li><a href='shuqian/selectall' target='main'>��ǩ�б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items8');" target="_self">��ܹ���</a></dt>
    <dd id="items8" style="display:none;">
        <ul>


		<li><a href='shujia/selectall' target='main'>����б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items9');" target="_self">�Ķ��ʼǹ���</a></dt>
    <dd id="items9" style="display:none;">
        <ul>


		<li><a href='ydbj/selectall' target='main'>�Ķ��ʼ��б�</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<% }%>
</div>
</body>
</html>
