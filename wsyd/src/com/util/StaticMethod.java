package com.util;

import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class StaticMethod {
	 public static String getRandom(int i) {
		  Random jjj = new Random();
		  // int suiJiShu = jjj.nextInt(9);
		  if (i == 0)
		   return "";
		  String jj = "";
		  for (int k = 0; k < i; k++) {
		   jj = jj + jjj.nextInt(9);
		  }
		  return jj;
		 }
	 public static Date getNowDate() {
		 Date currentTime = new Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateString = formatter.format(currentTime);
		 ParsePosition pos = new ParsePosition(8);
		 Date currentTime_2 = formatter.parse(dateString, pos);
		 return currentTime_2;
		 }
	 public static String getStringDate() {
		 Date currentTime = new Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateString = formatter.format(currentTime);
		 return dateString;
		 }
	 public static String getStringDateShort() {
		 Date currentTime = new Date();
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 String dateString = formatter.format(currentTime);
		 return dateString;
		 }
	 public static String BtoStr(Object o) throws SQLException{
			String str = null;
			byte[] inbyte=null;
			if(o instanceof Blob){
				Blob blob = (Blob) o;
		        if (blob != null) {
		            inbyte = blob.getBytes(1, (int) blob.length());
		        }
				str =new String (inbyte);
			}
			return str;
		}
	 public static String encode(String code){
		 if(code!=null&&!code.equals("")){
			 try {
				 code=java.net.URLEncoder.encode(tr(code),"utf-8");	  
			 }catch(Exception e){
				 System.out.println(e.getMessage());
			 }
			
			 return code;
			
		 }else {
		 return ""; 
		 }
	 }
	 public static String uncode(String code){
		 if(code!=null&&!code.equals("")){
			 try {
				
				 code= new String(code.getBytes("ISO-8859-1"),"UTF-8");
			 }catch(Exception e){
				 System.out.println(e.getMessage());
			 }
			
			 return code;
			
		 }else {
		 return ""; 
		 }
		 
	 }
	 public static String tr(String tps){
			
			tps = tps.trim();


			tps = tps.replaceAll("\n","");

			tps = tps.replaceAll("\r","");
			return tps;
		}
	 public static void main(String[] args) {
		 System.out.println("radom+"+getRandom(4));
		 System.out.println("getNowDate=="+getStringDate());
		 System.out.println("getStringDateShort=="+getStringDateShort());
		
	 }
}
