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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("zjid", zhangjie.getZjid());//�½ڱ��

		map.put("zj", zhangjie.getZj());//�½�

		map.put("sj", zhangjie.getSj());//�鼮

		map.put("nr", zhangjie.getNr());//����

		map.put("gxsj", zhangjie.getGxsj());//����ʱ��

		zhangjiedao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "zhangjie/zhangjieadd";
	}
	
	/**ɾ�� 
	 * 
	 */
	@RequestMapping(value="/del")
	public String  del(Integer id,HttpServletRequest request,Map<String,Object> map){
	//	Map<String,Object> map= new HashMap<String,Object>();
		String a=(String)request.getParameter("keyid");
		id=Integer.parseInt(a);
		request.setAttribute("msg", "<script>alert('ɾ���ɹ�');</script>");
		zhangjiedao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * �޸�zhangjie��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(zhangjie zhangjie,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("zjid", zhangjie.getZjid());//�½ڱ��

		map.put("zj", zhangjie.getZj());//�½�

		map.put("sj", zhangjie.getSj());//�鼮

		map.put("nr", zhangjie.getNr());//����

		map.put("gxsj", zhangjie.getGxsj());//����ʱ��

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		zhangjiedao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * ��ѯzhangjie��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zhangjiedao.select(Integer.parseInt(keyid));
		request.setAttribute("zjid", list.get(0).get("zjid"));//�½ڱ��

		request.setAttribute("zj", list.get(0).get("zj"));//�½�

		request.setAttribute("sj", list.get(0).get("sj"));//�鼮

		request.setAttribute("nr", list.get(0).get("nr"));//����

		request.setAttribute("gxsj", list.get(0).get("gxsj"));//����ʱ��

		
		return "zhangjie/zhangjiemodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=zhangjiedao.select(Integer.parseInt(keyid));
		request.setAttribute("zjid", list.get(0).get("zjid"));//�½ڱ��

		request.setAttribute("zj", list.get(0).get("zj"));//�½�

		request.setAttribute("sj", list.get(0).get("sj"));//�鼮

		request.setAttribute("nr", list.get(0).get("nr"));//����

		request.setAttribute("gxsj", list.get(0).get("gxsj"));//����ʱ��

		return "zhangjie/zhangjiedetail";
	}
	
	/**
	 * ��ѯzhangjie��Ϣ
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map,HttpServletRequest request){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		String qx="",yhm="";
		Map<String,Object> map1= new HashMap<String,Object>();
		if(request.getSession().getAttribute("yhm")!=null){
			qx=request.getSession().getAttribute("qx").toString();
			yhm=request.getSession().getAttribute("yhm").toString();
			if(!qx.equals("����Ա"))
			map1.put("zz", yhm);//����
		}
		list=zhangjiedao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "zhangjie/zhangjielist";
	}
}
