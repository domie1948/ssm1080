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
String yhm=(String)request.getParameter("yhm");//�û���
String mm=(String)request.getParameter("mm");//����
String xm=(String)request.getParameter("xm");//����
String qx=(String)request.getParameter("qx");//Ȩ��
String zcsj=(String)request.getParameter("zcsj");//ע��ʱ��
String lxdh=(String)request.getParameter("lxdh");//��ϵ�绰
String lxdz=(String)request.getParameter("lxdz");//��ϵ��ַ
String xb=(String)request.getParameter("xb");//�Ա�
String nl=(String)request.getParameter("nl");//����
String ah=(String)request.getParameter("ah");//����

/*
.�û��޸ĺ�̨ҳ��


*/	
 
sql="update yonghu set yhm='"+yhm+"',mm='"+mm+"',xm='"+xm+"',qx='"+qx+"',zcsj='"+zcsj+"',lxdh='"+lxdh+"',lxdz='"+lxdz+"',xb='"+xb+"',nl='"+nl+"',ah='"+ah+"' where yhid='"+keyid+"'";

 //int row=0;

try{
		
			
		 row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");
out.println("window.location='yonghu.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='yonghu.jsp'");
out.println("</script>");
}
db.close();
%>

