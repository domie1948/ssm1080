<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�����ݿ�����
String   bt="",nr="",fbsj="";//����ҳ����ʾ�ı���
String keyid=(String)request.getParameter("keyid");//��request��ʽ��ȡ ������Ϣ�� ����ֵ
String sql="select a.*,b.zj as zjm from shuqian a ,zhangjie b where 1=1 and a.zj=b.zjid";//ƴ��sql


if(session.getAttribute("yhm")!=null){
sql+=" and a.yh='"+session.getAttribute("yhm")+"'";
}
ResultSet rs=db.query(sql);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.1.4.2.min.js"></script>
<script type="text/javascript" src="js/lib.js"></script>
<script type="text/javascript">
$(function() {

	//����
	$(".nav").lavaLamp({
		fx: "backinout", 
		speed: 700,
		click: function(event, menuItem) {
			return true;
		}
	});
	
});
</script>
</head>

<body >

<jsp:include page="top.jsp"/>
	
	<div class="container content">
		
		<jsp:include page="banner.jsp"/>
		
		
		<jsp:include page="left.jsp"/>
		
		
		
		
		
		
		
		<div class="right">
			<div class="breadcrumbs"><img src="images/home-icon.gif" width="16" height="17" alt="��ҳ" />��ǰλ�ã�<a href="#">��ҳ</a><span>></span><span>��ǩ</span></div>
			<div class="contact">
				
				<div class="p-con">
				
				<TABLE cellSpacing=0 cellPadding=3 width="100%" align=center border=1 bordercolor="#33CCCC" id="table1">

 
				 		<tr align="center" bgcolor="#ebf0f7">


 <td width="9%" height="25" >�½�</td>
 <td width="9%" height="25" >ʱ��</td>
 <td width="10%">����</td>
</tr>

			  <TBODY id="table2">
					<%
					if(rs!=null){
					while(rs.next()){
					%>
                  	  <tr align='center' bgcolor='#FFFFFF' onmouseover='this.style.background="#F2FDFF"' onmouseout='this.style.background="#FFFFFF"'>


 <td height="24" ><%=rs.getString("zjm")%></td>
 <td height="24" ><%=rs.getString("sj")%></td>
<td ><a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zj")%>">�鿴</a> <a href="shuqiandelete.jsp?keyid=<%=rs.getString("sqid")%>"   onClick="javascript:if(confirm('�Ƿ�ɾ��')){return true;}else{return false;}">ɾ��</a>|</td>
</tr>

                 <%
				 }
				 }
				 %>

    </TBODY></TABLE>
	
	<div class="paging">  <span id="spanFirst">��һҳ</span> <span id="spanPre">��һҳ</span> <span id="spanNext">��һҳ</span> <span id="spanLast">���һҳ</span> ��<span id="spanPageNum"></span>ҳ/��<span id="spanTotalPage"></span>ҳ</div>
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
				</div>
				
				<div class="clear"></div>
			</div>
			
			
		</div><!--right end-->
		
		<div class="clear"></div>
		
	</div><!--content end-->
	
	
			<jsp:include page="footer.jsp"/>
</body>
</html>
