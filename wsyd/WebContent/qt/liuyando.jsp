<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
���԰���Ӻ�̨
*/
DBO db=new DBO();//��ʼ���ݿ�����
request.setCharacterEncoding("gb2312");//�����ַ���
ResultSet rs=null;//���������
	String keyid =(String)request.getParameter("keyid");
String ly=(String)request.getParameter("ly");//����:����
String yh=(String)request.getParameter("yh");//����:�û�
String lysj=StaticMethod.getStringDate();//����:����ʱ��

String sql="";//����sql
 sql="insert into lyb(ly,yh,lysj,hf) values('"+ly+"','"+yh+"','"+lysj+"','δ�ظ�')";
;//���԰�SQL ���
int row=1;///����ִ�н��
		
try{

	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");
out.println("window.location='lyb.jsp'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='lyb.jsp'");
out.println("</script>");
}
db.close();
%>

