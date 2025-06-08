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
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.yhm.value==""){
alert("用户名不能为空");
return false;
form.yhm.focus();
}

if(form.mm.value==""){
alert("密码不能为空");
return false;
form.mm.focus();
}

if(form.xm.value==""){
alert("姓名不能为空");
return false;
form.xm.focus();
}

if(form.qx.value==""){
alert("权限不能为空");
return false;
form.qx.focus();
}

if(form.zcsj.value==""){
alert("注册时间不能为空");
return false;
form.zcsj.focus();
}

if(form.lxdh.value==""){
alert("联系电话不能为空");
return false;
form.lxdh.focus();
}

if(form.lxdz.value==""){
alert("联系地址不能为空");
return false;
form.lxdz.focus();
}

if(form.xb.value==""){
alert("性别不能为空");
return false;
form.xb.focus();
}

if(form.nl.value==""){
alert("年龄不能为空");
return false;
form.nl.focus();
}

if(form.ah.value==""){
alert("爱好不能为空");
return false;
form.ah.focus();
}


form.action="<%=request.getContextPath()%>/yonghu/update";
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
    <TD height=30>用户修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>用户名:</td>
     <td ><input type="text"   name="yhm" placeholder="输入用户名"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${yhm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>密码:</td>
     <td ><input type="text"   name="mm" placeholder="输入密码"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${mm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>姓名:</td>
     <td ><input type="text"   name="xm" placeholder="输入姓名"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xm}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>权限:</td>
     <td ><input type="text"   name="qx" placeholder="输入权限"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${qx}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>注册时间:</td>
     <td ><input type="text"   name="zcsj" placeholder="输入注册时间"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${zcsj}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>联系电话:</td>
     <td ><input type="text"   name="lxdh" placeholder="输入联系电话"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${lxdh}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>联系地址:</td>
     <td ><input type="text"   name="lxdz" placeholder="输入联系地址"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${lxdz}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>性别:</td>
     <td ><input type="text"   name="xb" placeholder="输入性别"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${xb}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>年龄:</td>
     <td ><input type="text"   name="nl" placeholder="输入年龄"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${nl}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>爱好:</td>
     <td ><input type="text"   name="ah" placeholder="输入爱好"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${ah}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="yhid" value="${yhid}">
</TBODY></TABLE>
</div>
<DIV class=adminsubmit> <input type="button" value="保存" name="B1" class="button" style="width:60px" onclick="checkDo()"  />
                      &nbsp;&nbsp;
                      <input type="reset" value="取消" style="width:60px" name="chanel" class="button" />
</div>
</div>
</form>



${msg}







</body>
</html>

