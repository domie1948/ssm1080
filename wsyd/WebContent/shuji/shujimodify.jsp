<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");
String sj=(String)request.getAttribute("sj");
String fl=(String)request.getAttribute("fl");
String qx="";
if(session.getAttribute("qx")!=null){
qx=(String)session.getAttribute("qx");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />
<title>�鼮����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.sjmc.value==""){
alert("�鼮���Ʋ���Ϊ��");
return false;
form.sjmc.focus();
}

if(form.fl.value==""){
alert("���಻��Ϊ��");
return false;
form.fl.focus();
}

if(form.zz.value==""){
alert("���߲���Ϊ��");
return false;
form.zz.focus();
}

if(form.cbs.value==""){
alert("�����粻��Ϊ��");
return false;
form.cbs.focus();
}

if(form.js.value==""){
alert("���ܲ���Ϊ��");
return false;
form.js.focus();
}

if(form.tp.value==""){
alert("ͼƬ����Ϊ��");
return false;
form.tp.focus();
}

if(form.wj.value==""){
alert("�ļ�����Ϊ��");
return false;
form.wj.focus();
}

if(form.lll.value==""){
alert("���������Ϊ��");
return false;
form.lll.focus();
}

if(form.sj.value==""){
alert("�ϼܲ���Ϊ��");
return false;
form.sj.focus();
}


form.action="<%=request.getContextPath()%>/shuji/update";
form.submit();
}
</script>

<body >


<form name="form" action="" method="post" >
<div class=formzone>
<DIV class=searchzone>

<TABLE height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD height=30>�鼮�޸�</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>�鼮����:</td>
     <td ><input type="text"   name="sjmc" placeholder="�����鼮����"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${sjmc}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td >
	 
	 	 <select name="fl">
<%
String sql="select * from sjfl ";
DBO db=new DBO();
ResultSet rs=null;
rs=db.query(sql);
while(rs.next()){
%>
<option value="<%=rs.getString("fl")%>" <%if(rs.getString("fl").equals(fl)) out.println("selected");%>><%=rs.getString("fl")%></option>

<%
}
%>
</select>
	 <i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td ><input type="text"   name="zz" placeholder="��������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${zz}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>������:</td>
     <td ><input type="text"   name="cbs" placeholder="���������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${cbs}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td >
	 
	  <textarea name="js" cols="80" rows="5" placeholder="�������">${js}</textarea>
	 <i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>ͼƬ:</td>
     <td ><input type="text"   name="tp" placeholder="����ͼƬ"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${tp}"    /><iframe id="ifr" name="ifr" width="400" height="40" frameborder="no" scrolling="no" src="<%=request.getContextPath()%>/shuji/fileupload.jsp?kname=tp"></iframe><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>�ļ�:</td>
     <td ><input type="text"   name="wj" placeholder="�����ļ�"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${wj}"    /><iframe id="ifr" name="ifr" width="400" height="40" frameborder="no" scrolling="no" src="<%=request.getContextPath()%>/shuji/fileupload.jsp?kname=wj"></iframe><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>�����:</td>
     <td ><input type="text"   name="lll" placeholder="���������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${lll}" readonly=""   /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>�ϼ�:</td>
     <td >
	 <%
	 if(qx.equals("����Ա")){
	 %>
	  <select name="sj">
	 
	 <option value="��" <%
	 if(sj.equals("��")) out.println("selected");
	 %>>��</option>
	 	 <option value="��"  <%
	 if(sj.equals("��")) out.println("selected");
	 %>>��</option>
	 
	 </select>
	 
	 <% }else {%>
	 
	 <input type="text" name="sj" value="<%=sj%>" readonly="">
	 
	 <% }%>
<i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="sjid" value="${sjid}">
</TBODY></TABLE>
</div>
<DIV class=adminsubmit> <input type="button" value="����" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="ȡ��" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>



${msg}







</body>
</html>

