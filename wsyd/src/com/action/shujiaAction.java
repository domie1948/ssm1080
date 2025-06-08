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
@RequestMapping(value="/shujia")
public class shujiaAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource shujiaDao shujiadao;
	@RequestMapping(value="/addPage")
	public String addPage(shujia shujia,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "shujia/shujiaadd";
	}
	
	@RequestMapping(value="/add")
	public String add(shujia shujia,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("sjid", shujia.getSjid());//书架编号

		map.put("shj", shujia.getShj());//书籍

		map.put("yh", shujia.getYh());//用户

		map.put("sj", shujia.getSj());//时间

		shujiadao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "shujia/shujiaadd";
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
		shujiadao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改shujia信息
	 */
	@RequestMapping(value="/update")
	public String update(shujia shujia,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sjid", shujia.getSjid());//书架编号

		map.put("shj", shujia.getShj());//书籍

		map.put("yh", shujia.getYh());//用户

		map.put("sj", shujia.getSj());//时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		shujiadao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询shujia信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujiadao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//书架编号

		request.setAttribute("shj", list.get(0).get("shj"));//书籍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		
		return "shujia/shujiamodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujiadao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//书架编号

		request.setAttribute("shj", list.get(0).get("shj"));//书籍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		return "shujia/shujiadetail";
	}
	
	/**
	 * 查询shujia信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujiadao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "shujia/shujialist";
	}
}
