<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//设置页面字符集
DBO db=new DBO();//初始链接数据库类
String sql="select * from sjfl where 1=1 ";//查询 书籍sql语句
db.open();//打开数据库链接
ResultSet rs=db.query(sql);//查询结果
//书籍


%><div class="left">



<div class="left_2">
<div class="left_title"><img src="images/left_title_2.jpg" /></div>
<div class="left_list2">
<form name="dlform" method="post" action="check.jsp">
	<%
	if(session.getAttribute("yhm")==null){
	%>
                    <p>用户名：<input type="text" name="yhm" required></p>

                   <p>密&nbsp;&nbsp;码：<input type="password" name="mm" required></p>


                      <p><input type="submit" value="登录">&nbsp;<input type="button" value="注册" onclick="window.location='zhuce.jsp'">
					  
				
					  </p>

               
			   <%
			   }else {
			   
			   String qx=(String)session.getAttribute("qx");
			   
			   %>
			   <p><a href="yonghu.jsp">个人信息</a></p>
			        <p><a href="myshoucang.jsp">我的收藏</a></p>
			     <p><a href="shuqian.jsp">我的书签</a></p>
		
				  	  <p><a href="myshujia.jsp">我的书架</a></p>
	 	  <p><a href="myydbj.jsp">我的阅读笔记</a></p>
		  
		  <%
		  if(!qx.equals("用户")){
		  %>
		    <p><a href="../index.jsp">后台管理</a></p>
			<% }%>
				      <p><a href="out.jsp">退出</a></p>
			   <% }%>
			   </form>


</ul>
</div>
</div>

<div class="left_1">

<div class="left_list">

<script type="text/javascript" src="js/menu_min.js"></script>

<script type="text/javascript">
$(document).ready(function (){ 
  
  $(".menu ul li").menu();
  
}); 
</script> 

<div class="menu">
<ul>
	<li>
	
	<a href="javascript:">书籍分类</a>
		<ul style="display:block">
		<%
		while(rs.next()){
		%>
			<li><a href="shuji.jsp?fl=<%=rs.getString("sjflid")%>"><%=rs.getString("fl")%></a></li>
			
			<% }%>
		
			
		</ul>				
	</li>
	
	
		
			
		</ul>	
    </li>
</ul>
</div>


</div>


</div>


<div class="left_1">

<div class="left_list">

<script type="text/javascript" src="js/menu_min.js"></script>

<script type="text/javascript">
$(document).ready(function (){ 
  
  $(".menu ul li").menu();
  
}); 
</script> 

<div class="menu">
<ul>
	<li>
	
	<a href="javascript:">推荐书籍</a>
		<ul style="display:block">
		<%
		sql="select * from shuji where 1=1";
		
		
		if(session.getAttribute("yhm")!=null){
		sql+=" and fl in (select b.fl from shouzang a,shuji b where a.shj=b.sjid and a.yh='"+session.getAttribute("yhm")+"' )";
		}
		
		
		sql+=" order by lll limit 0,4";
		System.out.println(sql);
		rs=db.query(sql);
		while(rs.next()){
		%>
			<li><a href="shujidetail.jsp?fl=<%=rs.getString("sjid")%>"><%=rs.getString("sjmc")%></a></li>
			
			<% }%>
		
			
		</ul>				
	</li>
	
	
		
			
		</ul>	
    </li>
</ul>
</div>


</div>


</div>

</div>