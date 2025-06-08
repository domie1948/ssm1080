package com.action;
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
@Controller
@RequestMapping(value="/lyb")
public class lybAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource lybDao lybdao;
	@RequestMapping(value="/addPage")
	public String addPage(lyb lyb,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "lyb/lybadd";
	}
	
	@RequestMapping(value="/add")
	public String add(lyb lyb,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("lybid", lyb.getLybid());//留言板编号

		map.put("ly", lyb.getLy());//留言

		map.put("yh", lyb.getYh());//用户

		map.put("lysj", lyb.getLysj());//留言时间

		lybdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "lyb/lybadd";
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
		lybdao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改lyb信息
	 */
	@RequestMapping(value="/update")
	public String update(lyb lyb,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("lybid", lyb.getLybid());//留言板编号

		map.put("ly", lyb.getLy());//留言

		map.put("yh", lyb.getYh());//用户

		map.put("lysj", lyb.getLysj());//留言时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		lybdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询lyb信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=lybdao.select(Integer.parseInt(keyid));
		request.setAttribute("lybid", list.get(0).get("lybid"));//留言板编号

		request.setAttribute("ly", list.get(0).get("ly"));//留言

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("lysj", list.get(0).get("lysj"));//留言时间

		
		return "lyb/lybmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=lybdao.select(Integer.parseInt(keyid));
		request.setAttribute("lybid", list.get(0).get("lybid"));//留言板编号

		request.setAttribute("ly", list.get(0).get("ly"));//留言

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("lysj", list.get(0).get("lysj"));//留言时间

		return "lyb/lybdetail";
	}
	
	/**
	 * 查询lyb信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=lybdao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "lyb/lyblist";
	}
}
