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
@RequestMapping(value="/zhangjie")
public class zhangjieAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource zhangjieDao zhangjiedao;
	@RequestMapping(value="/addPage")
	public String addPage(zhangjie zhangjie,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "zhangjie/zhangjieadd";
	}
	
	@RequestMapping(value="/add")
	public String add(zhangjie zhangjie,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("zjid", zhangjie.getZjid());//章节编号

		map.put("zj", zhangjie.getZj());//章节

		map.put("sj", zhangjie.getSj());//书籍

		map.put("nr", zhangjie.getNr());//内容

		map.put("gxsj", zhangjie.getGxsj());//更新时间

		zhangjiedao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "zhangjie/zhangjieadd";
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
		zhangjiedao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改zhangjie信息
	 */
	@RequestMapping(value="/update")
	public String update(zhangjie zhangjie,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("zjid", zhangjie.getZjid());//章节编号

		map.put("zj", zhangjie.getZj());//章节

		map.put("sj", zhangjie.getSj());//书籍

		map.put("nr", zhangjie.getNr());//内容

		map.put("gxsj", zhangjie.getGxsj());//更新时间

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		zhangjiedao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询zhangjie信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zhangjiedao.select(Integer.parseInt(keyid));
		request.setAttribute("zjid", list.get(0).get("zjid"));//章节编号

		request.setAttribute("zj", list.get(0).get("zj"));//章节

		request.setAttribute("sj", list.get(0).get("sj"));//书籍

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("gxsj", list.get(0).get("gxsj"));//更新时间

		
		return "zhangjie/zhangjiemodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zhangjiedao.select(Integer.parseInt(keyid));
		request.setAttribute("zjid", list.get(0).get("zjid"));//章节编号

		request.setAttribute("zj", list.get(0).get("zj"));//章节

		request.setAttribute("sj", list.get(0).get("sj"));//书籍

		request.setAttribute("nr", list.get(0).get("nr"));//内容

		request.setAttribute("gxsj", list.get(0).get("gxsj"));//更新时间

		return "zhangjie/zhangjiedetail";
	}
	
	/**
	 * 查询zhangjie信息
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		String qx="",yhm="";
		Map<String,Object> map1= new HashMap<String,Object>();
		if(request.getSession().getAttribute("yhm")!=null){
			qx=request.getSession().getAttribute("qx").toString();
			yhm=request.getSession().getAttribute("yhm").toString();
			if(!qx.equals("管理员"))
			map1.put("zz", yhm);//标题
		}
		list=zhangjiedao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "zhangjie/zhangjielist";
	}
}
