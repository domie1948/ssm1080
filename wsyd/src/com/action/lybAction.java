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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("lybid", lyb.getLybid());//���԰���

		map.put("ly", lyb.getLy());//����

		map.put("yh", lyb.getYh());//�û�

		map.put("lysj", lyb.getLysj());//����ʱ��

		lybdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "lyb/lybadd";
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
		lybdao.del(id);
		return selectall(null,map);
	}
	/**
	 * �޸�lyb��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(lyb lyb,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("lybid", lyb.getLybid());//���԰���

		map.put("ly", lyb.getLy());//����

		map.put("yh", lyb.getYh());//�û�

		map.put("lysj", lyb.getLysj());//����ʱ��

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		lybdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * ��ѯlyb��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=lybdao.select(Integer.parseInt(keyid));
		request.setAttribute("lybid", list.get(0).get("lybid"));//���԰���

		request.setAttribute("ly", list.get(0).get("ly"));//����

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("lysj", list.get(0).get("lysj"));//����ʱ��

		
		return "lyb/lybmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=lybdao.select(Integer.parseInt(keyid));
		request.setAttribute("lybid", list.get(0).get("lybid"));//���԰���

		request.setAttribute("ly", list.get(0).get("ly"));//����

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("lysj", list.get(0).get("lysj"));//����ʱ��

		return "lyb/lybdetail";
	}
	
	/**
	 * ��ѯlyb��Ϣ
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
