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
	String shj =(String)request.getParameter("shj");

String sql="";//����sql

int row=1;///����ִ�н��
		
try{


 sql="update ydbj set dz=dz+1 where ydbjid='"+keyid+"'";
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

