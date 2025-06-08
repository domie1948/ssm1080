<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
用户添加后台
*/
DBO db=new DBO();//初始数据库链接
request.setCharacterEncoding("gb2312");//设置字符集
ResultSet rs=null;//声明结果集
	String keyid =(String)request.getParameter("keyid");
String yhm=(String)request.getParameter("yhm");//变量:用户名
String mm=(String)request.getParameter("mm");//变量:密码
String xm=(String)request.getParameter("xm");//变量:姓名
String qx=(String)request.getParameter("qx");//变量:权限
String zcsj=(String)request.getParameter("zcsj");//变量:注册时间
String lxdh=(String)request.getParameter("lxdh");//变量:联系电话
String lxdz=(String)request.getParameter("lxdz");//变量:联系地址
String xb=(String)request.getParameter("xb");//变量:性别
String nl=(String)request.getParameter("nl");//变量:年龄
String ah=(String)request.getParameter("ah");//变量:爱好

String sql="";//声明sql

;//用户SQL 语句
int row=1;///定义执行结果
		
		int num=0;
		
try{

	sql="select count(1) as num from yonghu where yhm='"+yhm+"'";
	rs=db.query(sql);
	if(rs.next()){
	num=rs.getInt("num");
	}
	
	if(num>0){
	out.println("<script>");
out.println("alert('操作失败,用户名重复');");
out.println("window.location='zhuce.jsp'");
out.println("</script>");
	return;
	}
	



 sql="insert into yonghu(yhm,mm,xm,qx,zcsj,lxdh,lxdz,xb,nl,ah) values('"+yhm+"','"+mm+"','"+xm+"','"+qx+"','"+zcsj+"','"+lxdh+"','"+lxdz+"','"+xb+"','"+nl+"','"+ah+"')";
	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='index.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='index.jsp'");
out.println("</script>");
}
db.close();
%>

