<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���
String sql="select * from shuji where 1=1 and sj='��' ";//��ѯ �鼮sql���
String fl=(String)request.getParameter("fl");
if(session.getAttribute("yhm")!=null){

sql+=" and sjid in (select shj from shujia where yh='"+session.getAttribute("yhm")+"')";
}
db.open();//�����ݿ�����
ResultSet rs=db.query(sql);//��ѯ���
//�鼮��Ϣ��ѯ
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
<div class="title_left"><font color="#0000FF" size="3"><b>�ҵ����</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

<%
	if(rs!=null){
					while(rs.next()){
%>
<li><a href="shujidetail.jsp?keyid=<%=rs.getString("sjid")%>"><img src="../upload/<%=rs.getString("tp")%>" width="161" height="125" /><%=rs.getString("sjmc")%></a>|<a href="shujiadelete.jsp?sj=<%=rs.getString("sjid")%>"   onClick="javascript:if(confirm('�Ƿ�ɾ��')){return true;}else{return false;}">ɾ��</a>|</li>
<%
}


}
%>




</ul>
</div>
</div>







</div>
</div>


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>

