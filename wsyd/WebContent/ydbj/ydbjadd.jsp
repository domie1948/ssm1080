<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<LINK href="<%=request.getContextPath()%>/images/style.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/css/tinyTips.css" />
<title>�Ķ��ʼǹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.bt.value==""){
alert("���ⲻ��Ϊ��");
return false;
form.bt.focus();
}

if(form.sj.value==""){
alert("�鼮����Ϊ��");
return false;
form.sj.focus();
}

if(form.nr.value==""){
alert("���ݲ���Ϊ��");
return false;
form.nr.focus();
}

if(form.yh.value==""){
alert("�û�����Ϊ��");
return false;
form.yh.focus();
}

if(form.fbsj.value==""){
alert("����ʱ�䲻��Ϊ��");
return false;
form.fbsj.focus();
}

if(form.gk.value==""){
alert("��������Ϊ��");
return false;
form.gk.focus();
}

if(form.dz.value==""){
alert("���޲���Ϊ��");
return false;
form.dz.focus();
}


form.action="<%=request.getContextPath()%>/ydbj/add";
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
    <TD height=30>�Ķ��ʼ����</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td ><input type="text"   name="bt" placeholder="�������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>�鼮:</td>
     <td ><input type="text"   name="sj" placeholder="�����鼮"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td ><input type="text"   name="nr" placeholder="��������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>�û�:</td>
     <td ><input type="text"   name="yh" placeholder="�����û�"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>����ʱ��:</td>
     <td ><input type="text"   name="fbsj" placeholder="���뷢��ʱ��"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td ><input type="text"   name="gk" placeholder="���빫��"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
         <tr>
     <td align=middle width=30% height=30>����:</td>
     <td ><input type="text"   name="dz" placeholder="�������"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value=""  /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
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

