<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="";
ResultSet rs=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style/css.css" rel="stylesheet" type="text/css" />
<link href="style/menu-css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="js/jquery-1.8.2.min.js"></script> 
</head>

<body>
<div class="content">



<jsp:include page="top.jsp"/>

<div class="main">
<div class="main_1">


<jsp:include page="left.jsp"/>





<div class="ty">
<div class="ty_title">
<div class="title_left"><font color="#0000FF" size="3"><b>留言板</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

	
	
<form name="lyform" method="post" action="liuyando.jsp">
 
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30>留言</td>
<td height=30>

<textarea name="ly" cols="80" rows="5" required  size="100"></textarea>

</td>
 </tr>
<tr >
<td align=middle width=100 height=30>用户</td>
<td height=30><input type="text" class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name="yh" value="<%=session.getAttribute("yhm")%>"></td>
 </tr>
<tr >
<td align=middle width=100 height=30></td>
<td height=30><input type="submit" value="提交"></td>
 </tr>

</TBODY></TABLE>

	</form>
	





</ul>
</div>
</div>







</div>
</div>


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>

