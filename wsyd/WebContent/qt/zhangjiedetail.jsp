<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���

ResultSet rs=null;

String   zj="",sj="",nr="",gxsj="";
String keyid=(String)request.getParameter("keyid");
String sql="select * from zhangjie where zjid="+keyid;

db.open();
rs=db.query(sql);

/*
�½���Ϣ�鿴ҳ��
*/
if(rs.next()){
 zj=rs.getString("zj");//������ֵ���½�
sj=rs.getString("sj");//������ֵ���鼮
nr=rs.getString("nr");//������ֵ������
gxsj=rs.getString("gxsj");//������ֵ������ʱ��

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
<div class="title_left"><font color="#0000FF" size="3"><b>�½��Ķ�</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

	
	

 
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30></td><td height=30><%=zj%>&nbsp;����ʱ��<%=gxsj%>,

<%
if(session.getAttribute("yhm")!=null){
%>
<a href="shuqiando.jsp?zj=<%=keyid%>">������ǩ</a>

<% }%>
</td>
 
</tr>

<tr >
<td align=left valign="top" width=100 height=300 colspan="2"><%=nr%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30></td><td height=30>

<% 
sql="select * from zhangjie where sj="+sj+" and zjid<"+keyid+" ORDER BY zjid DESC  LIMIT 1";
rs=db.query(sql);
if(rs.next()){
%>
<a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zjid")%>">����������һ��</a>

<% }%>
&nbsp;
<% 
sql="select * from zhangjie where sj="+sj+" and zjid>"+keyid+" ORDER BY zjid ASC LIMIT 1";
rs=db.query(sql);
if(rs.next()){
%>
<a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zjid")%>">��һ�¡�������</a>

<% }%>

</td>
 
</tr>

</TBODY></TABLE>


	





</ul>
</div>
</div>







</div>
</div>


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>

