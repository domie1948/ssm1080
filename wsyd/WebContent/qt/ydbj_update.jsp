<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
DBO db=new DBO();
request.setCharacterEncoding("gb2312");
ResultSet rs=null;
String sql="";
int row=1;
//	String keyid=(String)request.getParameter("keyid"); 
		String keyid =(String)request.getParameter("keyid");
String bt=(String)request.getParameter("bt");//����
String sj=(String)request.getParameter("sj");//�鼮
String nr=(String)request.getParameter("nr");//����
String yh=(String)request.getParameter("yh");//�û�
String fbsj=(String)request.getParameter("fbsj");//����ʱ��
String gk=(String)request.getParameter("gk");//����
String dz=(String)request.getParameter("dz");//����

/*
.�Ķ��ʼ��޸ĺ�̨ҳ��


*/	
 
sql="update ydbj set bt='"+bt+"',sj='"+sj+"',nr='"+nr+"',yh='"+yh+"',fbsj='"+fbsj+"',gk='"+gk+"',dz='"+dz+"' where ydbjid='"+keyid+"'";

 //int row=0;

try{
		
			
		 row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");
out.println("window.location='myydbj.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='myydbj.jsp'");
out.println("</script>");
}
db.close();
%>

