<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
阅读笔记添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String bt=(String)request.getParameter("bt");//变量:标题
String sj=(String)request.getParameter("sj");//变量:书籍
String nr=(String)request.getParameter("nr");//变量:内容
String yh=(String)request.getParameter("yh");//变量:用户
String fbsj=(String)request.getParameter("fbsj");//变量:发布时间
String gk=(String)request.getParameter("gk");//变量:公开
String dz=(String)request.getParameter("dz");//变量:点赞

String sql="";//声明sql
 sql="insert into ydbj(bt,sj,nr,yh,fbsj,gk,dz) values('"+bt+"','"+sj+"','"+nr+"','"+yh+"','"+fbsj+"','"+gk+"','"+dz+"')";
;//阅读笔记SQL 语句
int row=1;///定义执行结果
		
try{

	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");

out.println("window.location='shujidetail.jsp?keyid="+sj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='shujidetail.jsp?keyid="+sj+"'");
out.println("</script>");
}
db.close();
%>

