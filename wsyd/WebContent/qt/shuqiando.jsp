<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
书签添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String yh=(String)session.getAttribute("yhm");//变量:用户
String zj=(String)request.getParameter("zj");//变量:章节
String sj=StaticMethod.getStringDate();//变量:时间

String sql="";//声明sql

int row=1;///定义执行结果
		
try{

	sql="delete from shuqian where yh='"+yh+"' and zj='"+zj+"'";
	
	db.update(sql);
	 sql="insert into shuqian(yh,zj,sj) values('"+yh+"','"+zj+"','"+sj+"')";
;//书签SQL 语句
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='zhangjiedetail.jsp?keyid="+zj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='zhangjiedetail.jsp?keyid="+zj+"'");
out.println("</script>");
}
db.close();
%>

