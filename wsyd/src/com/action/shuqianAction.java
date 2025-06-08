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
@RequestMapping(value="/shuqian")
public class shuqianAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource shuqianDao shuqiandao;
	@RequestMapping(value="/addPage")
	public String addPage(shuqian shuqian,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "shuqian/shuqianadd";
	}
	
	@RequestMapping(value="/add")
	public String add(shuqian shuqian,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("sqid", shuqian.getSqid());//书签编号

		map.put("zj", shuqian.getZj());//章节

		map.put("yh", shuqian.getYh());//用户

		map.put("sj", shuqian.getSj());//时间

		shuqiandao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "shuqian/shuqianadd";
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
		shuqiandao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改shuqian信息
	 */
	@RequestMapping(value="/update")
	public String update(shuqian shuqian,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sqid", shuqian.getSqid());//书签编号

		map.put("zj", shuqian.getZj());//章节

		map.put("yh", shuqian.getYh());//用户

		map.put("sj", shuqian.getSj());//时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		shuqiandao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询shuqian信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shuqiandao.select(Integer.parseInt(keyid));
		request.setAttribute("sqid", list.get(0).get("sqid"));//书签编号

		request.setAttribute("zj", list.get(0).get("zj"));//章节

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		
		return "shuqian/shuqianmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shuqiandao.select(Integer.parseInt(keyid));
		request.setAttribute("sqid", list.get(0).get("sqid"));//书签编号

		request.setAttribute("zj", list.get(0).get("zj"));//章节

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("sj", list.get(0).get("sj"));//时间

		return "shuqian/shuqiandetail";
	}
	
	/**
	 * 查询shuqian信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shuqiandao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "shuqian/shuqianlist";
	}
}
