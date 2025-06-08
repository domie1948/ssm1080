<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="select * from shuji where 1=1 and sj='是' ";//查询 书籍sql语句

db.open();//打开数据库链接
ResultSet rs=null;//查询结果
//书籍信息查询
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





<div class="right">
<div class="right_top">
<div class="right_gs">
<div class="gs_title"><div class="title_left"><font color="#0033FF" size="3">网站介绍</font></div><div class="title_right"><a href="#"><img src="images/more.jpg" /></a></div></div>
<div class="gs_list">
<span>因为网络本身就是信息传播途径的交通渠道，它与普通的书店等书籍出售场所相比，具有速度快、容量大、费用少、使用方便等优势。比如，从网上图书阅读你可以快速分类浏览到各类书籍[2]。通过电脑或者电子产品利用网络进行读书浏览书籍，不仅弥补了实体书店需要购书的不足，并且网上阅读图书不受时间的限制你什么时候有时间就可以什么时候购买阅读或者免费，可以看到各种不同类型书籍，随意翻阅，而不会出现花费太多的钱而购买很多图书。节省了空间和金钱[3]。..................</span>


</div>
</div>
<div class="right_new">
<div class="new_title"><div class="title_left"><font color="#0033FF" size="3">最新更新</font></div><div class="title_right1"></div>
<div class="new_list">
<ul>


<%
sql="select * from zhangjie where  1=1 order by zjid desc limit 0,9";
rs=db.query(sql);
while(rs.next()){
%>
<li><a href="zhangjiedetail.jsp?keyid=<%=rs.getString("zjid")%>"><span class="time"><%=rs.getString("gxsj")%></span><%=rs.getString("zj")%></a></li>

<% }%>

</ul>
</div>
</div>
</div>
<div class="right_bottom">
<div class="bottom_title"><div class="title_left1"><font color="#0033FF" size="3">书籍展示</font></div><div class="title_right2"><a href="shuji.jsp"><img src="images/more.jpg" /></a></div></div>
<div class="bottom_list">
<div class="js">


  <div id="demo">
          <div id="indemo">
            <div id="demo1">
			
			<%
			sql="select * from shuji where sj='是' limit 0,6";
			rs=db.query(sql);
			while(rs.next()){
			%>
              <div id="demo1_1"><a href="shujidetail.jsp?keyid=<%=rs.getString("sjid")%>"><img src="../upload/<%=rs.getString("tp")%>" width="161" height="125" /><%=rs.getString("sjmc")%></a></div>
        <% }%>
            <div id="demo2"></div>
          </div>
        </div>
        <script>var speed=40;
var tab = document.getElementById("demo");
var tab1 = document.getElementById("demo1");
var tab2 = document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
    if(tab2.offsetWidth-tab.scrollLeft<=0) 
        tab.scrollLeft-=tab1.offsetWidth
    else{
        tab.scrollLeft++;
    }
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
</script> 

</div>
</div>
</div>
</div>
</div>







</div>
</div>


<jsp:include page="footer.jsp"/>
</div>
</body>
</html>

