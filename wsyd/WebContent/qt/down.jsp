<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.util.*"%>
<%  //String pathone=request.getParameter("PATH");
  String flags="";
  OutputStream os=response.getOutputStream();
  DBO db=new DBO();//��ʼ���ݿ�����
request.setCharacterEncoding("gb2312");//�����ַ���
  try{ 
  


	


    String savePath="";
    savePath="upload\\";
    // System.out.println("savePath="+savePath);
    String filename=request.getParameter("filename");
       byte[] tempByte = filename.getBytes("ISO8859_1"); 
    filename = new String(tempByte,"GB2312");
		// �½�һ��SmartUpload����
	SmartUpload su = new SmartUpload(); 
		// ��ʼ��
	su.initialize(pageContext);
		// �趨contentDispositionΪnull�Խ�ֹ������Զ����ļ���
		//��֤������Ӻ��������ļ��������趨�������ص��ļ���չ��Ϊ
		//docʱ����������Զ���word��������չ��Ϊpdfʱ��
		//���������acrobat�򿪡�
	su.setContentDisposition(null);
	String aa=request.getRealPath("/")+savePath+filename;
System.out.println("aaaaaaaaa=="+aa);
		// �����ļ�
su.setAllowedFilesList("doc,txt,zip,xls");
	su.downloadFile(aa);
	//System.out.println("successs!!!!!!");
	flags="0";
	}catch(Exception ex){
		flags="1";
		out.println("û���ҵ�0�ļ������ܸ��ļ��Ѿ���ɾ�������ߣ��ϴ�֮����û�б���");
	}
	 os.flush();  
             os.close();  

%>