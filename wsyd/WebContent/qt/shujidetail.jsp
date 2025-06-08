<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String   sjmc="",fl="",zz="",cbs="",js="",tp="",wj="",lll="",sj="";
String keyid=(String)request.getParameter("keyid");
String sql="select * from shuji where sjid="+keyid;
ResultSet rs=null;
db.open();
rs=db.query(sql);

/*
书籍信息查看页面
*/
if(rs.next()){
 sjmc=rs.getString("sjmc");//变量赋值：书籍名称
fl=rs.getString("fl");//变量赋值：分类
zz=rs.getString("zz");//变量赋值：作者
cbs=rs.getString("cbs");//变量赋值：出版社
js=rs.getString("js");//变量赋值：介绍
tp=rs.getString("tp");//变量赋值：图片
wj=rs.getString("wj");//变量赋值：文件
lll=rs.getString("lll");//变量赋值：浏览量
sj=rs.getString("sj");//变量赋值：上架

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
<div class="title_left"><font color="#0000FF" size="3"><b>书籍信息</b></font></div>
<div class="ty_title_right"></div>
</div>
<div class="cp_tp">
<ul>

<div class=tablezone>
<div class=noticediv id=notice></div>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>

		<tr >
<td align=middle width=100 height=30>书籍名称</td><td height=30><%=sjmc%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>分类</td><td height=30><%=fl%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>作者</td><td height=30><%=zz%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>出版社</td><td height=30><%=cbs%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>介绍</td><td height=30><%=js%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>图片</td><td height=30><img src="../upload/<%=tp%>" width="200" height="200"></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>文件</td><td height=30><%
if(session.getAttribute("yhm")!=null){
%><a href="down.jsp?filename=<%=wj%>">下载</a><% }%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30>浏览量</td><td height=30><%=lll%></td>
 
</tr>
<tr >
<td align=middle width=100 height=30></td><td height=30>

<%
if(session.getAttribute("yhm")!=null){
%>
<input type="button" value="收藏" onclick="window.location='shoucangdo.jsp?shj=<%=keyid%>'">

&nbsp;<input type="button" value="添加到书架" onclick="window.location='shujiado.jsp?shj=<%=keyid%>'">




&nbsp;<input type="button" value="添加阅读笔记" onclick="window.location='ydbjadd.jsp?shj=<%=keyid%>'">

<% }%>
</td>
 
</tr>


</TBODY></TABLE>
</div>




</ul>
</div>

<div class="ty_title">
<div class="title_left"><font color="#0000FF" size="3"><b>章节信息</b></font></div>
<div class="ty_title_right"></div>
</div>


</div>

<div class="cp_tp"><ul>
  <table width="100%" ><tr><td width="16%"></td>
  <td width="84%">
  <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">
  <TBODY id="table2">
 
				 		<tr align="center" bgcolor="#ebf0f7">
 <td width="11%" height="25" >序号</td>
 <td width="38%" height="25" >章节</td>


 <td width="25%" height="25" >更新时间</td>
 <td width="26%">操作</td>
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
<td ><a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zjid")%>">查看</a></td>
</tr>

                 <%
				 i++;
				 }
				 }
				 %>

    </TBODY></TABLE>
	 <span id="spanFirst">第一页</span> <span id="spanPre">上一页</span> <span id="spanNext">下一页</span> <span id="spanLast">最后一页</span> 第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
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


      //下一页
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


      //上一页
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


      //第一页
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


      //最后一页
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


      //总共页数
     function pageCount() {
          var count = 0;
          if (numberRowsInTable % pageSize != 0) count = 1;
          return parseInt(numberRowsInTable / pageSize) + count;
      }


      //显示链接
     function preLink() { spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>"; }
      function preText() { spanPre.innerHTML = "上一页"; }


      function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>"; }
      function nextText() { spanNext.innerHTML = "下一页"; }


      function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>第一页</a>"; }
      function firstText() { spanFirst.innerHTML = "第一页"; }


      function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>最后一页</a>"; }
      function lastText() { spanLast.innerHTML = "最后一页"; }


      //隐藏表格
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
<div class="title_left"><font color="#0000FF" size="3"><b>阅读笔记</b></font></div>
<div class="ty_title_right"></div>
</div>


</div>

<div class="cp_tp"><ul>
  <TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" >
  <TBODY>
 
 
 <%
 sql="select * from ydbj where 1=1 and sj='"+keyid+"' and gk='是'";
rs=db.query(sql);
					if(rs!=null){
					while(rs.next()){
					%>
				 		<tr align="center" bgcolor="#ebf0f7">
 <td width="9%" height="25" ><div align="left">用户[<%=rs.getString("yh")%>]时间[<%=rs.getString("fbsj")%>]&nbsp;[点赞量:<%=rs.getString("dz")%>]</div>
 
 <%
 if(session.getAttribute("yhm")!=null){
 %>
 
 <a href="dianzando.jsp?keyid=<%=rs.getString("ydbjid")%>&shj=<%=rs.getString("sj")%>">给他点赞</a>
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

