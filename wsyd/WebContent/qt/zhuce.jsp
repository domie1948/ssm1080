<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���

ResultSet rs=null;
String   yhm="",mm="",xm="",qx="",zcsj="",lxdh="",lxdz="",xb="",nl="",ah="";//��ʼ������

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
<div class="title_left"><font color="#0000FF" size="3"><b>ע��</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

	
	
<form name="lyform" method="post" action="do.jsp">
 
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		
		<tr >
<td align=middle width=100 height=30>�û���</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=yhm value="<%=yhm%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=mm value="<%=mm%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=xm value="<%=xm%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>Ȩ��</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=qx value="�û�" readonly=""></td>
</tr>
<tr >
<td align=middle width=100 height=30>ע��ʱ��</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=zcsj value="
<%=StaticMethod.getStringDate()%>" readonly=""></td>
</tr>
<tr >
<td align=middle width=100 height=30>��ϵ�绰</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=lxdh value="<%=lxdh%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>��ϵ��ַ</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=lxdz value="<%=lxdz%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>�Ա�</td><td height="30" >
<select name="xb">

<option value="��" <% if(xb.equals("��")) out.println("selected");%>>��</option>
<option value="Ů"  <% if(xb.equals("Ů")) out.println("selected");%>>Ů</option>
</select>
</td>
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=nl value="<%=nl%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height="30" ><input type="text"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px" name=ah value="<%=ah%>"></td>
</tr>
<tr >
<td align=middle width=100 height=30></td><td height="30" ><input type="submit" value="ע��"></td>
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

