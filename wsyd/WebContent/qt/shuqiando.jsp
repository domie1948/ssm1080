<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
��ǩ��Ӻ�̨
*/
DBO db=new DBO();//��ʼ���ݿ�����
request.setCharacterEncoding("gb2312");//�����ַ���
ResultSet rs=null;//���������
	String keyid =(String)request.getParameter("keyid");
String yh=(String)session.getAttribute("yhm");//����:�û�
String zj=(String)request.getParameter("zj");//����:�½�
String sj=StaticMethod.getStringDate();//����:ʱ��

String sql="";//����sql

int row=1;///����ִ�н��
		
try{

	sql="delete from shuqian where yh='"+yh+"' and zj='"+zj+"'";
	
	db.update(sql);
	 sql="insert into shuqian(yh,zj,sj) values('"+yh+"','"+zj+"','"+sj+"')";
;//��ǩSQL ���
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");
out.println("window.location='zhangjiedetail.jsp?keyid="+zj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='zhangjiedetail.jsp?keyid="+zj+"'");
out.println("</script>");
}
db.close();
%>

