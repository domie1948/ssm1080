<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
�ղ���Ӻ�̨
*/
DBO db=new DBO();//��ʼ���ݿ�����
request.setCharacterEncoding("gb2312");//�����ַ���
ResultSet rs=null;//���������
	String keyid =(String)request.getParameter("keyid");
String shj=(String)request.getParameter("shj");//����:�鼮
String yh=(String)session.getAttribute("yhm");//����:�û�
String sj=StaticMethod.getStringDate();//����:ʱ��

String sql="";//����sql

int row=1;///����ִ�н��
		
try{

sql="delete from shouzang where shj='"+shj+"' and yh='"+yh+"'";
db.update(sql);

 sql="insert into shouzang(shj,yh,sj) values('"+shj+"','"+yh+"','"+sj+"')";
;//�ղ�SQL ���
	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");
out.println("window.location='shujidetail.jsp?keyid="+shj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='shujidetail.jsp?keyid="+shj+"'");
out.println("</script>");
}
db.close();
%>

