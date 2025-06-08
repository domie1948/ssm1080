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
String yhm=(String)request.getParameter("yhm");//用户名
String mm=(String)request.getParameter("mm");//密码
String xm=(String)request.getParameter("xm");//姓名
String qx=(String)request.getParameter("qx");//权限
String zcsj=(String)request.getParameter("zcsj");//注册时间
String lxdh=(String)request.getParameter("lxdh");//联系电话
String lxdz=(String)request.getParameter("lxdz");//联系地址
String xb=(String)request.getParameter("xb");//性别
String nl=(String)request.getParameter("nl");//年龄
String ah=(String)request.getParameter("ah");//爱好

/*
.用户修改后台页面


*/	
 
sql="update yonghu set yhm='"+yhm+"',mm='"+mm+"',xm='"+xm+"',qx='"+qx+"',zcsj='"+zcsj+"',lxdh='"+lxdh+"',lxdz='"+lxdz+"',xb='"+xb+"',nl='"+nl+"',ah='"+ah+"' where yhid='"+keyid+"'";

 //int row=0;

try{
		
			
		 row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('操作成功');");
out.println("window.location='yonghu.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('操作失败');");
out.println("window.location='yonghu.jsp'");
out.println("</script>");
}
db.close();
%>

