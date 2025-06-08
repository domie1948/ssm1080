package com.action;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.bean.*;
import com.dao.*;
import com.util.DBO;
@Controller
@RequestMapping(value="/yonghu")
public class yonghuAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource yonghuDao yonghudao;
	@RequestMapping(value="/addPage")
	public String addPage(yonghu yonghu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "yonghu/yonghuadd";
	}
	
	@RequestMapping(value="/add")
	public String add(yonghu yonghu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("yhid", yonghu.getYhid());//用户编号

		map.put("yhm", yonghu.getYhm());//用户名

		map.put("mm", yonghu.getMm());//密码

		map.put("xm", yonghu.getXm());//姓名

		map.put("qx", yonghu.getQx());//权限

		map.put("zcsj", yonghu.getZcsj());//注册时间

		map.put("lxdh", yonghu.getLxdh());//联系电话

		map.put("lxdz", yonghu.getLxdz());//联系地址

		map.put("xb", yonghu.getXb());//性别

		map.put("nl", yonghu.getNl());//年龄

		map.put("ah", yonghu.getAh());//爱好

		

		String sql="select count(1) as num from yonghu where yhm='"+yonghu.getYhm()+"'";
		DBO db=new DBO();
		ResultSet rs=null;
		int a=0;
		try{
		rs=db.query(sql);
		if(rs.next()){
			a=rs.getInt("num");
		}
		if(a==0){
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		yonghudao.save(map);
		}else{
			request.setAttribute("msg", "<script>alert('添加失败、用户名重复');</script>");	
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		

		System.out.println("addok");
		return "yonghu/yonghuadd";
	}
	
	/**删除 
	 * 
	 */
	@RequestMapping(value="/del")
	public String  del(Integer id,HttpServletRequest request,Map<String,Object> map){
	//	Map<String,Object> map= new HashMap<String,Object>();
		String a=(String)request.getParameter("keyid");
		id=Integer.parseInt(a);
		request.setAttribute("msg", "<script>alert('删除成功');</script>");
		yonghudao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改yonghu信息
	 */
	@RequestMapping(value="/update")
	public String update(yonghu yonghu,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("yhid", yonghu.getYhid());//用户编号

		map.put("yhm", yonghu.getYhm());//用户名

		map.put("mm", yonghu.getMm());//密码

		map.put("xm", yonghu.getXm());//姓名

		map.put("qx", yonghu.getQx());//权限

		map.put("zcsj", yonghu.getZcsj());//注册时间

		map.put("lxdh", yonghu.getLxdh());//联系电话

		map.put("lxdz", yonghu.getLxdz());//联系地址

		map.put("xb", yonghu.getXb());//性别

		map.put("nl", yonghu.getNl());//年龄

		map.put("ah", yonghu.getAh());//爱好

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		yonghudao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询yonghu信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.select(Integer.parseInt(keyid));
		request.setAttribute("yhid", list.get(0).get("yhid"));//用户编号

		request.setAttribute("yhm", list.get(0).get("yhm"));//用户名

		request.setAttribute("mm", list.get(0).get("mm"));//密码

		request.setAttribute("xm", list.get(0).get("xm"));//姓名

		request.setAttribute("qx", list.get(0).get("qx"));//权限

		request.setAttribute("zcsj", list.get(0).get("zcsj"));//注册时间

		request.setAttribute("lxdh", list.get(0).get("lxdh"));//联系电话

		request.setAttribute("lxdz", list.get(0).get("lxdz"));//联系地址

		request.setAttribute("xb", list.get(0).get("xb"));//性别

		request.setAttribute("nl", list.get(0).get("nl"));//年龄

		request.setAttribute("ah", list.get(0).get("ah"));//爱好

		
		return "yonghu/yonghumodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.select(Integer.parseInt(keyid));
		request.setAttribute("yhid", list.get(0).get("yhid"));//用户编号

		request.setAttribute("yhm", list.get(0).get("yhm"));//用户名

		request.setAttribute("mm", list.get(0).get("mm"));//密码

		request.setAttribute("xm", list.get(0).get("xm"));//姓名

		request.setAttribute("qx", list.get(0).get("qx"));//权限

		request.setAttribute("zcsj", list.get(0).get("zcsj"));//注册时间

		request.setAttribute("lxdh", list.get(0).get("lxdh"));//联系电话

		request.setAttribute("lxdz", list.get(0).get("lxdz"));//联系地址

		request.setAttribute("xb", list.get(0).get("xb"));//性别

		request.setAttribute("nl", list.get(0).get("nl"));//年龄

		request.setAttribute("ah", list.get(0).get("ah"));//爱好

		return "yonghu/yonghudetail";
	}
	
	/**
	 * 查询yonghu信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "yonghu/yonghulist";
	}
}
