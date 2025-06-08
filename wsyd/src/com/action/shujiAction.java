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
@RequestMapping(value="/shuji")
public class shujiAction {
	/**
	 * 自动注入业务逻辑层，注入方式使用了注解自动注入
	 */

	@Resource shujiDao shujidao;
	@RequestMapping(value="/addPage")
	public String addPage(shuji shuji,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "shuji/shujiadd";
	}
	
	@RequestMapping(value="/add")
	public String add(shuji shuji,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("sjid", shuji.getSjid());//书籍编号

		map.put("sjmc", shuji.getSjmc());//书籍名称

		map.put("fl", shuji.getFl());//分类

		map.put("zz", shuji.getZz());//作者

		map.put("cbs", shuji.getCbs());//出版社

		map.put("js", shuji.getJs());//介绍

		map.put("tp", shuji.getTp());//图片

		map.put("wj", shuji.getWj());//文件

		map.put("lll", shuji.getLll());//浏览量

		map.put("sj", shuji.getSj());//上架

		shujidao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('添加成功');</script>");
		System.out.println("addok");
		return "shuji/shujiadd";
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
		shujidao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * 修改shuji信息
	 */
	@RequestMapping(value="/update")
	public String update(shuji shuji,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sjid", shuji.getSjid());//书籍编号

		map.put("sjmc", shuji.getSjmc());//书籍名称

		map.put("fl", shuji.getFl());//分类

		map.put("zz", shuji.getZz());//作者

		map.put("cbs", shuji.getCbs());//出版社

		map.put("js", shuji.getJs());//介绍

		map.put("tp", shuji.getTp());//图片

		map.put("wj", shuji.getWj());//文件

		map.put("lll", shuji.getLll());//浏览量

		map.put("sj", shuji.getSj());//上架

		request.setAttribute("msg", "<script>alert('修改成功');</script>");
		shujidao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * 查询shuji信息
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujidao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//书籍编号

		request.setAttribute("sjmc", list.get(0).get("sjmc"));//书籍名称

		request.setAttribute("fl", list.get(0).get("fl"));//分类

		request.setAttribute("zz", list.get(0).get("zz"));//作者

		request.setAttribute("cbs", list.get(0).get("cbs"));//出版社

		request.setAttribute("js", list.get(0).get("js"));//介绍

		request.setAttribute("tp", list.get(0).get("tp"));//图片

		request.setAttribute("wj", list.get(0).get("wj"));//文件

		request.setAttribute("lll", list.get(0).get("lll"));//浏览量

		request.setAttribute("sj", list.get(0).get("sj"));//上架

		
		return "shuji/shujimodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujidao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//书籍编号

		request.setAttribute("sjmc", list.get(0).get("sjmc"));//书籍名称

		request.setAttribute("fl", list.get(0).get("fl"));//分类

		request.setAttribute("zz", list.get(0).get("zz"));//作者

		request.setAttribute("cbs", list.get(0).get("cbs"));//出版社

		request.setAttribute("js", list.get(0).get("js"));//介绍

		request.setAttribute("tp", list.get(0).get("tp"));//图片

		request.setAttribute("wj", list.get(0).get("wj"));//文件

		request.setAttribute("lll", list.get(0).get("lll"));//浏览量

		request.setAttribute("sj", list.get(0).get("sj"));//上架

		return "shuji/shujidetail";
	}
	
	/**
	 * 查询shuji信息
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
		list=shujidao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "shuji/shujilist";
	}
}
