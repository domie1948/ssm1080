<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
收藏添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
	String shj =(String)request.getParameter("shj");

String sql="";//声明sql

int row=1;///定义执行结果
		
try{


 sql="update ydbj set dz=dz+1 where ydbjid='"+keyid+"'";
;//收藏SQL 语句
	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='shujidetail.jsp?keyid="+shj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='shujidetail.jsp?keyid="+shj+"'");
out.println("</script>");
}
db.close();
%>

