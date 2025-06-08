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
<title>章节管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function checkDo(){
if(form.zj.value==""){
alert("章节不能为空");
return false;
form.zj.focus();
}

if(form.sj.value==""){
alert("书籍不能为空");
return false;
form.sj.focus();
}

if(form.nr.value==""){
alert("内容不能为空");
return false;
form.nr.focus();
}

if(form.gxsj.value==""){
alert("更新时间不能为空");
return false;
form.gxsj.focus();
}


form.action="<%=request.getContextPath()%>/zhangjie/update";
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
    <TD height=30>章节修改</TD>
    <TD align=right colSpan=2>&nbsp;</TD>
  </TR></TBODY></TABLE></DIV>
<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

         <tr>
     <td align=middle width=30% height=30>章节:</td>
     <td ><input type="text"   name="zj" placeholder="输入章节"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${zj}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	   <input type="hidden"   name="sj" placeholder="输入书籍"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${sj}"    />
  	         <tr>
     <td align=middle width=30% height=30>内容:</td>
     <td >
	 
	 	 <textarea name="nr" placeholder="输入内容" cols="80" rows="15">${nr}</textarea>
<i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	         <tr>
     <td align=middle width=30% height=30>更新时间:</td>
     <td ><input type="text"   name="gxsj" placeholder="输入更新时间"  class="input" style="FONT-SIZE: 12px; WIDTH: 300px"  value="${gxsj}"    /><i>	 <font color="red">*</font> </i></li></td>
	 
	 </tr>
  	     <input type="hidden" name="zjid" value="${zjid}">
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

