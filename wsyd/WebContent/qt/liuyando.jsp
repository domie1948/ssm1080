<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
留言板添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String ly=(String)request.getParameter("ly");//变量:留言
String yh=(String)request.getParameter("yh");//变量:用户
String lysj=StaticMethod.getStringDate();//变量:留言时间

String sql="";//声明sql
 sql="insert into lyb(ly,yh,lysj,hf) values('"+ly+"','"+yh+"','"+lysj+"','未回复')";
;//留言板SQL 语句
int row=1;///定义执行结果
		
try{

	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='lyb.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='lyb.jsp'");
out.println("</script>");
}
db.close();
%>

