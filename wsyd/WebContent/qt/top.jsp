<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
request.setCharacterEncoding("gb2312");
%><div class="head">
<div class="head_1">
<div class="logo"><img src="images/logo.png" /></div>
<div class="top_hm">


</div>
<div class="nav">
<div class="nav_n">
<ul>
<li><a href="index.jsp">ÍøÕ¾Ê×Ò³</a></li>
<li><img src="images/nav_li.jpg" /></li>

<li><a href="shuji.jsp">Êé¼®</a></li>
<li><img src="images/nav_li.jpg" /></li>
<li><a href="lyb.jsp">ÁôÑÔ°å</a></li>

</ul>

</div>
</div>
<div class="banner"> 
     
        <script type="text/javascript" language="javascript" src="js/jquery.easing.1.3.js"></script> 
        <script type="text/javascript" language="javascript" src="js/jquery.skitter.min.js"></script> 
        
        <!-- Init Skitter --> 
        <script type="text/javascript" language="javascript">
		$(document).ready(function(){
			$('.box_skitter_large').skitter({label: false, numbers: false, theme: 'square'});
			$('.box_skitter_small').skitter({label: false, numbers: false, interval: 1000, theme: 'clean'});
			$('.box_skitter_medium').css({width: 500, height: 200}).skitter({show_randomly: true, dots: true, interval: 4000, numbers_align: 'center', theme: 'round'});
			$('.box_skitter_normal').css({width: 400, height: 300}).skitter({animation: 'blind', interval: 2000, hideTools: true, theme: 'minimalist'});
		});
	</script>
        <div style="width:1053px;margin:0 auto;">
          <div class="box_skitter box_skitter_large">
            <ul>
              <li><a href="#cubeRandom"><img src="images/banner1.jpg" class="cubeRandom" /></a></li>
              <li><a href="#block"><img src="images/banner2.jpg" class="block" /></a></li>
              <li><a href="#cubeStop"><img src="images/banner3.jpg" class="cubeStop" /></a></li>
            </ul>
          </div>
        </div>
      </div>
</div>