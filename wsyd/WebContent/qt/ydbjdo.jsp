<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>

<%
/*
�Ķ��ʼ���Ӻ�̨
*/
DBO db=new DBO();//��ʼ���ݿ�����
request.setCharacterEncoding("gb2312");//�����ַ���
ResultSet rs=null;//���������
	String keyid =(String)request.getParameter("keyid");
String bt=(String)request.getParameter("bt");//����:����
String sj=(String)request.getParameter("sj");//����:�鼮
String nr=(String)request.getParameter("nr");//����:����
String yh=(String)request.getParameter("yh");//����:�û�
String fbsj=(String)request.getParameter("fbsj");//����:����ʱ��
String gk=(String)request.getParameter("gk");//����:����
String dz=(String)request.getParameter("dz");//����:����

String sql="";//����sql
 sql="insert into ydbj(bt,sj,nr,yh,fbsj,gk,dz) values('"+bt+"','"+sj+"','"+nr+"','"+yh+"','"+fbsj+"','"+gk+"','"+dz+"')";
;//�Ķ��ʼ�SQL ���
int row=1;///����ִ�н��
		
try{

	
		//int row =0;
		row=db.update(sql);
}catch(Exception e){
System.out.println(e.toString());}
if(row==1){
out.println("<script>");
out.println("alert('�����ɹ�');");

out.println("window.location='shujidetail.jsp?keyid="+sj+"'");
out.println("</script>");
}else{
out.println("<script>");
out.println("alert('����ʧ��');");
out.println("window.location='shujidetail.jsp?keyid="+sj+"'");
out.println("</script>");
}
db.close();
%>

