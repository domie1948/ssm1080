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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("szid", shouzang.getSzid());//�ղر��

		map.put("shj", shouzang.getShj());//�鼮

		map.put("yh", shouzang.getYh());//�û�

		map.put("sj", shouzang.getSj());//ʱ��

		shouzangdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "shouzang/shouzangadd";
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
		shouzangdao.del(id);
		return selectall(null,map);
	}
	/**
	 * �޸�shouzang��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(shouzang shouzang,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("szid", shouzang.getSzid());//�ղر��

		map.put("shj", shouzang.getShj());//�鼮

		map.put("yh", shouzang.getYh());//�û�

		map.put("sj", shouzang.getSj());//ʱ��

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		shouzangdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * ��ѯshouzang��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shouzangdao.select(Integer.parseInt(keyid));
		request.setAttribute("szid", list.get(0).get("szid"));//�ղر��

		request.setAttribute("shj", list.get(0).get("shj"));//�鼮

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("sj", list.get(0).get("sj"));//ʱ��

		
		return "shouzang/shouzangmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shouzangdao.select(Integer.parseInt(keyid));
		request.setAttribute("szid", list.get(0).get("szid"));//�ղر��

		request.setAttribute("shj", list.get(0).get("shj"));//�鼮

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("sj", list.get(0).get("sj"));//ʱ��

		return "shouzang/shouzangdetail";
	}
	
	/**
	 * ��ѯshouzang��Ϣ
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
