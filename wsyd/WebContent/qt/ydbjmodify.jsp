<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类

ResultSet rs=null;
String   bt="",sj="",nr="",yh="",fbsj="",gk="",dz="";//初始化变量
String keyid=(String)request.getParameter("keyid");//主键
String sql="select * from ydbj where ydbjid="+keyid;//定义查询sql语句

db.open();//打开数据库链接
rs=db.query(sql);//执行查询结果

/*
阅读笔记信息修改页面
*/
if(rs.next()){//遍历结果集查询 相应的变量
 bt=rs.getString("bt");
sj=rs.getString("sj");
nr=rs.getString("nr");
yh=rs.getString("yh");
fbsj=rs.getString("fbsj");
gk=rs.getString("gk");
dz=rs.getString("dz");

}
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
<div class="title_left"><font color="#0000FF" size="3"><b>阅读笔记</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

	
	
<form name="lyform" method="post" action="ydbj_update.jsp">
 
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>


	<tr >
<td align=middle width=100 height=30>标题</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=bt value="<%=bt%>"></td>
</tr>
<input type="hidden"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=sj value="<%=sj%>">
<tr >
<td align=middle width=100 height=30>内容</td><td height="30" >

<textarea name="nr" cols="80" rows="5"><%=nr%></textarea>
</td>
</tr>
<tr >
<td align=middle width=100 height=30>用户</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=yh value="<%=yh%>" readonly=""></td>
</tr>
<tr >
<td align=middle width=100 height=30>发布时间</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=fbsj value="<%=fbsj%>" readonly=""></td>
</tr>
<tr >
<td align=middle width=100 height=30>公开</td><td height="30" >
<select name="gk">

<option value="是" <%if(gk.equals("是")) out.println("selected");%>>是</option>
<option value="否" <%if(gk.equals("否")) out.println("selected");%>>否</option>
</select>
</td>
</tr>
<input type="hidden"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=dz value="<%=dz%>">
<tr >
<td align=middle width=100 height=30></td>
<td height=30>
<input type="hidden" name="keyid" value="<%=keyid%>">
<input type="submit" value="提交">
</td>
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

