<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%

DBO db=new DBO();//链接数据库
request.setCharacterEncoding("gb2312"); //设置页面字符集
ResultSet rs=null;//定义结果集
String sql="";//定义sql
int row=1;
String sj=(String)request.getParameter("sj"); //主键id
String yh=(String)session.getAttribute("yhm");
/*
.书架删除页面


*/	
  sql="delete from shujia where shj='"+sj+"' and yh='"+yh+"'";//删除sql语句
// int row=0;

try{
		
			
		 row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='myshujia.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='myshujia.jsp'");
out.println("</script>");
}
db.close();//关闭数据库链接
%>

