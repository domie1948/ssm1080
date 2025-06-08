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
String bt=(String)request.getParameter("bt");//标题
String sj=(String)request.getParameter("sj");//书籍
String nr=(String)request.getParameter("nr");//内容
String yh=(String)request.getParameter("yh");//用户
String fbsj=(String)request.getParameter("fbsj");//发布时间
String gk=(String)request.getParameter("gk");//公开
String dz=(String)request.getParameter("dz");//点赞

/*
.阅读笔记修改后台页面


*/	
 
sql="update ydbj set bt='"+bt+"',sj='"+sj+"',nr='"+nr+"',yh='"+yh+"',fbsj='"+fbsj+"',gk='"+gk+"',dz='"+dz+"' where ydbjid='"+keyid+"'";

 //int row=0;

try{
		
			
		 row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='myydbj.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='myydbj.jsp'");
out.println("</script>");
}
db.close();
%>

