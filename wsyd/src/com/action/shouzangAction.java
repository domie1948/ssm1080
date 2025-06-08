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
@RequestMapping(value="/shouzang")
public class shouzangAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource shouzangDao shouzangdao;
	@RequestMapping(value="/addPage")
	public String addPage(shouzang shouzang,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "shouzang/shouzangadd";
	}
	
	@RequestMapping(value="/add")
	public String add(shouzang shouzang,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("szid", shouzang.getSzid());//收藏编号

		map.put("shj", shouzang.getShj());//书籍

		map.put("yh", shouzang.getYh());//用户

		map.put("sj", shouzang.getSj());//时间

		shouzangdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "shouzang/shouzangadd";
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
		shouzangdao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改shouzang信息
	 */
	@RequestMapping(value="/update")
	public String update(shouzang shouzang,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("szid", shouzang.getSzid());//收藏编号

		map.put("shj", shouzang.getShj());//书籍

		map.put("yh", shouzang.getYh());//用户

		map.put("sj", shouzang.getSj());//时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		shouzangdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询shouzang信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shouzangdao.select(Integer.parseInt(keyid));
		request.setAttribute("szid", list.get(0).get("szid"));//收藏编号

		request.setAttribute("shj", list.get(0).get("shj"));//书籍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		
		return "shouzang/shouzangmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shouzangdao.select(Integer.parseInt(keyid));
		request.setAttribute("szid", list.get(0).get("szid"));//收藏编号

		request.setAttribute("shj", list.get(0).get("shj"));//书籍

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		return "shouzang/shouzangdetail";
	}
	
	/**
	 * 查询shouzang信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shouzangdao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "shouzang/shouzanglist";
	}
}
