<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���
String   sjmc="",fl="",zz="",cbs="",js="",tp="",wj="",lll="",sj="";
String keyid=(String)request.getParameter("keyid");
String sql="select * from shuji where sjid="+keyid;
ResultSet rs=null;
db.open();
rs=db.query(sql);

/*
�鼮��Ϣ�鿴ҳ��
*/
if(rs.next()){
 sjmc=rs.getString("sjmc");//������ֵ���鼮����
fl=rs.getString("fl");//������ֵ������
zz=rs.getString("zz");//������ֵ������
cbs=rs.getString("cbs");//������ֵ��������
js=rs.getString("js");//������ֵ������
tp=rs.getString("tp");//������ֵ��ͼƬ
wj=rs.getString("wj");//������ֵ���ļ�
lll=rs.getString("lll");//������ֵ�������
sj=rs.getString("sj");//������ֵ���ϼ�

}

sql="update shuji set lll=lll+1 where sjid='"+keyid+"' ";
db.update(sql);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style/css.css" rel="stylesheet" type="text/css" />
<link href="style/menu-css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="js/jquery-1.8.2.min.js"></script> 
</head>

<body>
<div class="content">



<jsp:include page="top.jsp"/>

<div class="main">
<div class="main_1">


<jsp:include page="left.jsp"/>





<div class="ty">
<div class="ty_title">
<div class="title_left"><font color="#0000FF" size="3"><b>�鼮��Ϣ</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30>�鼮����</td><td height=30><%=sjmc%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height=30><%=fl%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height=30><%=zz%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>������</td><td height=30><%=cbs%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>����</td><td height=30><%=js%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>ͼƬ</td><td height=30><img src="../upload/<%=tp%>" width="200" height="200"></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>�ļ�</td><td height=30><%
if(session.getAttribute("yhm")!=null){
%><a href="down.jsp?filename=<%=wj%>">����</a><% }%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>�����</td><td height=30><%=lll%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30></td><td height=30>

<%
if(session.getAttribute("yhm")!=null){
%>
<input type="button" value="�ղ�" onclick="window.location='shoucangdo.jsp?shj=<%=keyid%>'">

&nbsp;<input type="button" value="��ӵ����" onclick="window.location='shujiado.jsp?shj=<%=keyid%>'">




&nbsp;<input type="button" value="����Ķ��ʼ�" onclick="window.location='ydbjadd.jsp?shj=<%=keyid%>'">

<% }%>
</td>
 
</tr>


</TBODY></TABLE>
</div>




</ul>
</div>

<div class="ty_title">
<div class="title_left"><font color="#0000FF" size="3"><b>�½���Ϣ</b></font></div>
<div class="ty_title_right"></div>
</div>


</div>

<div class="cp_tp"><ul>
  <table width="100%" ><tr><td width="16%"></td>
  <td width="84%">
  <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">
  <TBODY id="table2">
 
				 		<tr align="center" bgcolor="#ebf0f7">
 <td width="11%" height="25" >���</td>
 <td width="38%" height="25" >�½�</td>


 <td width="25%" height="25" >����ʱ��</td>
 <td width="26%">����</td>
</tr>

			
					<%
					
					int i=1;
					sql="select * from zhangjie where sj='"+keyid+"'";
					rs=db.query(sql);
					if(rs!=null){
					while(rs.next()){
					%>
                  	  <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
 <td height="24" ><%=i%></td>
 <td height="24" ><%=rs.getString("zj")%></td>

 <td height="24" ><%=rs.getString("gxsj")%></td>
<td ><a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zjid")%>">�鿴</a></td>
</tr>

                 <%
				 i++;
				 }
				 }
				 %>

    </TBODY></TABLE>
	 <span id="spanFirst">��һҳ</span> <span id="spanPre">��һҳ</span> <span id="spanNext">��һҳ</span> <span id="spanLast">���һҳ</span> ��<span id="spanPageNum"></span>ҳ/��<span id="spanTotalPage"></span>ҳ
	 <script>
      var theTable = document.getElementById("table2");
      var totalPage = document.getElementById("spanTotalPage");
      var pageNum = document.getElementById("spanPageNum");


      var spanPre = document.getElementById("spanPre");
      var spanNext = document.getElementById("spanNext");
      var spanFirst = document.getElementById("spanFirst");
      var spanLast = document.getElementById("spanLast");


      var numberRowsInTable = theTable.rows.length;
      var pageSize = 20;
      var page = 1;


      //��һҳ
     function next() {


          hideTable();


          currentRow = pageSize * page;
          maxRow = currentRow + pageSize;
          if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
          for (var i = currentRow; i < maxRow; i++) {
              theTable.rows[i].style.display = '';
          }
          page++;


          if (maxRow == numberRowsInTable) { nextText(); lastText(); }
          showPage();
          preLink();
          firstLink();
      }


      //��һҳ
     function pre() {


          hideTable();


          page--;


          currentRow = pageSize * page;
          maxRow = currentRow - pageSize;
          if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
          for (var i = maxRow; i < currentRow; i++) {
              theTable.rows[i].style.display = '';
          }




          if (maxRow == 0) { preText(); firstText(); }
          showPage();
          nextLink();
          lastLink();
      }


      //��һҳ
     function first() {
          hideTable();
          page = 1;
          for (var i = 0; i < pageSize; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preText();
          nextLink();
          lastLink();
      }


      //���һҳ
     function last() {
          hideTable();
          page = pageCount();
          currentRow = pageSize * (page - 1);
          for (var i = currentRow; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = '';
          }
          showPage();


          preLink();
          nextText();
          firstLink();
      }


      function hideTable() {
          for (var i = 0; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }
      }


      function showPage() {
          pageNum.innerHTML = page;
      }


      //�ܹ�ҳ��
     function pageCount() {
          var count = 0;
          if (numberRowsInTable % pageSize != 0) count = 1;
          return parseInt(numberRowsInTable / pageSize) + count;
      }


      //��ʾ����
     function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>��һҳ</a>"; }
      function preText() { spanPre.innerHTML = "��һҳ"; }


      function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>��һҳ</a>"; }
      function nextText() { spanNext.innerHTML = "��һҳ"; }


      function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>��һҳ</a>"; }
      function firstText() { spanFirst.innerHTML = "��һҳ"; }


      function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>���һҳ</a>"; }
      function lastText() { spanLast.innerHTML = "���һҳ"; }


      //���ر��
     function hide() {
          for (var i = pageSize; i < numberRowsInTable; i++) {
              theTable.rows[i].style.display = 'none';
          }


          totalPage.innerHTML = pageCount();
          pageNum.innerHTML = '1';


          nextLink();
          lastLink();
      }


      hide();
 </script>

 </td></tr> </td></table >
</ul>
</div>








  <table width="100%" ><tr><td width="22%"></td>
  <td width="78%">
  <div class="ty_title">
<div class="title_left"><font color="#0000FF" size="3"><b>�Ķ��ʼ�</b></font></div>
<div class="ty_title_right"></div>
</div>


</div>

<div class="cp_tp"><ul>
  <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" >
  <TBODY>
 
 
 <%
 sql="select * from ydbj where 1=1 and sj='"+keyid+"' and gk='��'";
rs=db.query(sql);
					if(rs!=null){
					while(rs.next()){
					%>
				 		<tr align="center" bgcolor="#ebf0f7">
 <td width="9%" height="25" ><div align="left">�û�[<%=rs.getString("yh")%>]ʱ��[<%=rs.getString("fbsj")%>]&nbsp;[������:<%=rs.getString("dz")%>]</div>
 
 <%
 if(session.getAttribute("yhm")!=null){
 %>
 
 <a href="dianzando.jsp?keyid=<%=rs.getString("ydbjid")%>&shj=<%=rs.getString("sj")%>">��������</a>
 <% }%>
 
 </td>
 </tr>

			
					
                  	  <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>
 <td height="24" ><div align="left"><%=rs.getString("nr")%></div></td>
 </tr>

                 <%
				 }
				 }
				 %>
    </TBODY></TABLE>
	
	
	</td></tr> </table >
</ul>
</div>







</div>
</div>


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>

