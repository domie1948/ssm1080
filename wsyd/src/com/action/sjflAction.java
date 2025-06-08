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
@RequestMapping(value="/sjfl")
public class sjflAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource sjflDao sjfldao;
	@RequestMapping(value="/addPage")
	public String addPage(sjfl sjfl,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "sjfl/sjfladd";
	}
	
	@RequestMapping(value="/add")
	public String add(sjfl sjfl,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("sjflid", sjfl.getSjflid());//书籍分类编号

		map.put("fl", sjfl.getFl());//分类

		sjfldao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "sjfl/sjfladd";
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
		sjfldao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改sjfl信息
	 */
	@RequestMapping(value="/update")
	public String update(sjfl sjfl,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sjflid", sjfl.getSjflid());//书籍分类编号

		map.put("fl", sjfl.getFl());//分类

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		sjfldao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询sjfl信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=sjfldao.select(Integer.parseInt(keyid));
		request.setAttribute("sjflid", list.get(0).get("sjflid"));//书籍分类编号

		request.setAttribute("fl", list.get(0).get("fl"));//分类

		
		return "sjfl/sjflmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=sjfldao.select(Integer.parseInt(keyid));
		request.setAttribute("sjflid", list.get(0).get("sjflid"));//书籍分类编号

		request.setAttribute("fl", list.get(0).get("fl"));//分类

		return "sjfl/sjfldetail";
	}
	
	/**
	 * 查询sjfl信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=sjfldao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "sjfl/sjfllist";
	}
}
