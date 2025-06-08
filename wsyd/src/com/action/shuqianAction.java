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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("sqid", shuqian.getSqid());//��ǩ���

		map.put("zj", shuqian.getZj());//�½�

		map.put("yh", shuqian.getYh());//�û�

		map.put("sj", shuqian.getSj());//ʱ��

		shuqiandao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "shuqian/shuqianadd";
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
		shuqiandao.del(id);
		return selectall(null,map);
	}
	/**
	 * �޸�shuqian��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(shuqian shuqian,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sqid", shuqian.getSqid());//��ǩ���

		map.put("zj", shuqian.getZj());//�½�

		map.put("yh", shuqian.getYh());//�û�

		map.put("sj", shuqian.getSj());//ʱ��

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		shuqiandao.update(map);
		return selectall(null,map1);
	}
	/**
	 * ��ѯshuqian��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shuqiandao.select(Integer.parseInt(keyid));
		request.setAttribute("sqid", list.get(0).get("sqid"));//��ǩ���

		request.setAttribute("zj", list.get(0).get("zj"));//�½�

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("sj", list.get(0).get("sj"));//ʱ��

		
		return "shuqian/shuqianmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shuqiandao.select(Integer.parseInt(keyid));
		request.setAttribute("sqid", list.get(0).get("sqid"));//��ǩ���

		request.setAttribute("zj", list.get(0).get("zj"));//�½�

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("sj", list.get(0).get("sj"));//ʱ��

		return "shuqian/shuqiandetail";
	}
	
	/**
	 * ��ѯshuqian��Ϣ
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
