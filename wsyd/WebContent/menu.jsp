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
<title>无标题文档</title>

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
if(qx.equals("管理员")){
%>
		<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items1');" target="_self">用户管理</a></dt>
    <dd id="items1" style="display:none;">
        <ul>

	<li><a href='yonghu/addPage' target='main'>添加用户</a></li>
		<li><a href='yonghu/selectall' target='main'>用户列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items2');" target="_self">书籍分类管理</a></dt>
    <dd id="items2" style="display:none;">
        <ul>

	<li><a href='sjfl/addPage' target='main'>添加书籍分类</a></li>
		<li><a href='sjfl/selectall' target='main'>书籍分类列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<% }%>
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items3');" target="_self">书籍管理</a></dt>
    <dd id="items3" style="display:none;">
        <ul>

	<li><a href='shuji/addPage' target='main'>添加书籍</a></li>
		<li><a href='shuji/selectall' target='main'>书籍列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items4');" target="_self">章节管理</a></dt>
    <dd id="items4" style="display:none;">
        <ul>

	<li><a href='zhangjie/addPage' target='main'>添加章节</a></li>
		<li><a href='zhangjie/selectall' target='main'>章节列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->

<%
if(qx.equals("管理员")){
%>
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items5');" target="_self">留言板管理</a></dt>
    <dd id="items5" style="display:none;">
        <ul>


		<li><a href='lyb/selectall' target='main'>留言板列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items6');" target="_self">收藏管理</a></dt>
    <dd id="items6" style="display:none;">
        <ul>


		<li><a href='shouzang/selectall' target='main'>收藏列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items7');" target="_self">书签管理</a></dt>
    <dd id="items7" style="display:none;">
        <ul>


		<li><a href='shuqian/selectall' target='main'>书签列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items8');" target="_self">书架管理</a></dt>
    <dd id="items8" style="display:none;">
        <ul>


		<li><a href='shujia/selectall' target='main'>书架列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<!-- Item 1 Strat -->
<dl>

<dt><a href="###" onclick="showHide('items9');" target="_self">阅读笔记管理</a></dt>
    <dd id="items9" style="display:none;">
        <ul>


		<li><a href='ydbj/selectall' target='main'>阅读笔记列表</a></li>
        </ul>
    </dd>
</dl>
<!-- Item 1 End -->
<% }%>
</div>
</body>
</html>
