<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
request.setCharacterEncoding("gb2312");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body { margin: 0;padding: 0;font:12px ����;line-height:18px;text-align:left;color:#404040;background:url(images/bj.gif) no-repeat center top;}
a { COLOR: #404040; TEXT-DECORATION: none;}
a:hover { COLOR: #404040;}
.m_ctr { margin:0 auto;margin-top:120px;width:492px;height:auto;overflow:hidden;}
    .t_left { margin:0 auto;float:left;width:4px;height:34px;background:url(images/m_tleft.png);}
	.t_mid { margin:0 auto;float:left;width:474px;height:34px;background:url(images/m_tmid.gif) repeat-x;line-height:34px;font-weight:bold;padding-left:10px;}
	.t_right { margin:0 auto;float:left;width:4px;height:34px;background:url(images/m_tright.png);}
	.m_mid { margin:0 auto;float:left;width:470px;height:140px;border-left:1px #ddd solid;border-right:1px #ddd solid;padding:10px;background:#fff;}
	    .m_pic { margin:20px 30px 20px 50px;float:left;width:76px;height:100px;background:url(images/login.gif);display:inline;}
		.m_txt { margin:0 auto;float:left;width:280px;height:30px;line-height:30px;font-size:14px;display:inline;}
    .m_foot { margin:0 auto;float:left;width:492px;height:4px;background:url(images/m_foot.png);overflow:hidden;}
.m_cp { margin:0 auto;width:100%;height:30px;line-height:30px;text-align:center;}
.txt { VERTICAL-ALIGN: middle;MARGIN-TOP: 2px; WIDTH: 160px;height:20px;display:inline;}
.btn { PADDING-RIGHT: 5px; PADDING-LEFT: 5px; BORDER-LEFT-COLOR: #ddd; BACKGROUND: #ddd; BORDER-BOTTOM-COLOR: #666; PADDING-BOTTOM: 1px; MARGIN: 5px 0px; VERTICAL-ALIGN: middle; CURSOR: pointer; COLOR: #000; BORDER-TOP-COLOR: #ddd; PADDING-TOP: 4px; BORDER-RIGHT-COLOR: #666;display:inline;}
INPUT { BORDER-RIGHT: #ccc 1px solid; PADDING: 2px; BORDER-TOP: #666 1px solid; BACKGROUND: #f7f7f7; BORDER-LEFT: #666 1px solid; COLOR: #333; BORDER-BOTTOM: #ccc 1px solid;}
</style>
</head>
<script language="javascript">
function check(){
if(form.yhm.value==""){
alert("�������û���");
return;
}
if(form.mm.value==""){
alert("����������");
return;
}
form.action="logincheck.jsp";
form.submit();
}
</script>
<body>s
    <form name="form" action="" method="post">
<div class="m_ctr">
    <div class="t_left"></div>
    <div class="t_mid"> ��½��ҳ</div>
    <div class="t_right"></div>
    <div class="m_mid">
        <div class="m_pic"></div>
        <div class="m_txt" style="margin-top:10px;">�û�����
          <input type="text" name="yhm" />
        </div>
        <div class="m_txt">��&nbsp;&nbsp;�룺
          <input type="password" name="mm" />
        </div>
      
        <div class="m_txt" style="width:200px;padding-left:56px;">
           
            <input type="button" name="Submit" value="�ύ" onclick=check() />
            <input type="reset" name="Submit2" value="����" />            
        </div>
    </div>
    <div class="m_foot"></div>
</div>
<div class="m_cp">Powered by  &copy; 2018, <a href="qt/index.jsp" target="">ǰ̨</a></div>
</div>
    </form>

</html>

