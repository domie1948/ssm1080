<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���
String sql="select * from shuji where 1=1 and sj='��' ";//��ѯ �鼮sql���

db.open();//�����ݿ�����
ResultSet rs=null;//��ѯ���
//�鼮��Ϣ��ѯ
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
<div class="gs_title"><div class="title_left"><font color="#0033FF" size="3">��վ����</font></div><div class="title_right"><a href="#"><img src="images/more.jpg" /></a></div></div>
<div class="gs_list">
<span>��Ϊ���籾�������Ϣ����;���Ľ�ͨ������������ͨ�������鼮���۳�����ȣ������ٶȿ졢�����󡢷����١�ʹ�÷�������ơ����磬������ͼ���Ķ�����Կ��ٷ�������������鼮[2]��ͨ�����Ի��ߵ��Ӳ�Ʒ����������ж�������鼮�������ֲ���ʵ�������Ҫ����Ĳ��㣬���������Ķ�ͼ�鲻��ʱ���������ʲôʱ����ʱ��Ϳ���ʲôʱ�����Ķ�������ѣ����Կ������ֲ�ͬ�����鼮�����ⷭ�ģ���������ֻ���̫���Ǯ������ܶ�ͼ�顣��ʡ�˿ռ�ͽ�Ǯ[3]��..................</span>


</div>
</div>
<div class="right_new">
<div class="new_title"><div class="title_left"><font color="#0033FF" size="3">���¸���</font></div><div class="title_right1"></div>
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
<div class="bottom_title"><div class="title_left1"><font color="#0033FF" size="3">�鼮չʾ</font></div><div class="title_right2"><a href="shuji.jsp"><img src="images/more.jpg" /></a></div></div>
<div class="bottom_list">
<div class="js">


  <div id="demo">
          <div id="indemo">
            <div id="demo1">
			
			<%
			sql="select * from shuji where sj='��' limit 0,6";
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

