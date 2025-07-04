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
@RequestMapping(value="/ydbj")
public class ydbjAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource ydbjDao ydbjdao;
	@RequestMapping(value="/addPage")
	public String addPage(ydbj ydbj,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "ydbj/ydbjadd";
	}
	
	@RequestMapping(value="/add")
	public String add(ydbj ydbj,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("ydbjid", ydbj.getYdbjid());//阅读笔记编号

		map.put("bt", ydbj.getBt());//标题

		map.put("sj", ydbj.getSj());//书籍

		map.put("nr", ydbj.getNr());//内容

		map.put("yh", ydbj.getYh());//用户

		map.put("fbsj", ydbj.getFbsj());//发布时间

		map.put("gk", ydbj.getGk());//公开

		map.put("dz", ydbj.getDz());//点赞

		ydbjdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "ydbj/ydbjadd";
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
		ydbjdao.del(id);
		return selectall(null,map);
	}
	/**
	 * 修改ydbj信息
	 */
	@RequestMapping(value="/update")
	public String update(ydbj ydbj,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("ydbjid", ydbj.getYdbjid());//阅读笔记编号

		map.put("bt", ydbj.getBt());//标题

		map.put("sj", ydbj.getSj());//书籍

		map.put("nr", ydbj.getNr());//内容

		map.put("yh", ydbj.getYh());//用户

		map.put("fbsj", ydbj.getFbsj());//发布时间

		map.put("gk", ydbj.getGk());//公开

		map.put("dz", ydbj.getDz());//点赞

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		ydbjdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * 查询ydbj信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=ydbjdao.select(Integer.parseInt(keyid));
		request.setAttribute("ydbjid", list.get(0).get("ydbjid"));//阅读笔记编号

		request.setAttribute("bt", list.get(0).get("bt"));//标题

		request.setAttribute("sj", list.get(0).get("sj"));//书籍

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("fbsj", list.get(0).get("fbsj"));//发布时间

		request.setAttribute("gk", list.get(0).get("gk"));//公开

		request.setAttribute("dz", list.get(0).get("dz"));//点赞

		
		return "ydbj/ydbjmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=ydbjdao.select(Integer.parseInt(keyid));
		request.setAttribute("ydbjid", list.get(0).get("ydbjid"));//阅读笔记编号

		request.setAttribute("bt", list.get(0).get("bt"));//标题

		request.setAttribute("sj", list.get(0).get("sj"));//书籍

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("yh", list.get(0).get("yh"));//用户

		request.setAttribute("fbsj", list.get(0).get("fbsj"));//发布时间

		request.setAttribute("gk", list.get(0).get("gk"));//公开

		request.setAttribute("dz", list.get(0).get("dz"));//点赞

		return "ydbj/ydbjdetail";
	}
	
	/**
	 * 查询ydbj信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=ydbjdao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "ydbj/ydbjlist";
	}
}
