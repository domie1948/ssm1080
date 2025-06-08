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
String shj=(String)request.getParameter("shj");//变量:书籍
String yh=(String)session.getAttribute("yhm");//变量:用户
String sj=StaticMethod.getStringDate();//变量:时间

String sql="";//声明sql

int row=1;///定义执行结果
		
try{

sql="delete from shouzang where shj='"+shj+"' and yh='"+yh+"'";
db.update(sql);

 sql="insert into shouzang(shj,yh,sj) values('"+shj+"','"+yh+"','"+sj+"')";
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

