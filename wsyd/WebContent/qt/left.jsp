<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.util.*"%>
<%
request.setCharacterEncoding("gb2312");//����ҳ���ַ���
DBO db=new DBO();//��ʼ�������ݿ���
String sql="select * from sjfl where 1=1 ";//��ѯ �鼮sql���
db.open();//�����ݿ�����
ResultSet rs=db.query(sql);//��ѯ���
//�鼮


%><div class="left">



<div class="left_2">
<div class="left_title"><img src="images/left_title_2.jpg" /></div>
<div class="left_list2">
<form name="dlform" method="post" action="check.jsp">
	<%
	if(session.getAttribute("yhm")==null){
	%>
                    <p>�û�����<input type="text" name="yhm" required></p>

                   <p>��&nbsp;&nbsp;�룺<input type="password" name="mm" required></p>


                      <p><input type="submit" value="��¼">&nbsp;<input type="button" value="ע��" onclick="window.location='zhuce.jsp'">
					  
				
					  </p>

               
			   <%
			   }else {
			   
			   String qx=(String)session.getAttribute("qx");
			   
			   %>
			   <p><a href="yonghu.jsp">������Ϣ</a></p>
			        <p><a href="myshoucang.jsp">�ҵ��ղ�</a></p>
			     <p><a href="shuqian.jsp">�ҵ���ǩ</a></p>
		
				  	  <p><a href="myshujia.jsp">�ҵ����</a></p>
	 	  <p><a href="myydbj.jsp">�ҵ��Ķ��ʼ�</a></p>
		  
		  <%
		  if(!qx.equals("�û�")){
		  %>
		    <p><a href="../index.jsp">��̨����</a></p>
			<% }%>
				      <p><a href="out.jsp">�˳�</a></p>
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
	
	<a href="javascript:">�鼮����</a>
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
	
	<a href="javascript:">�Ƽ��鼮</a>
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