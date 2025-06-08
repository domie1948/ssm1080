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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("ydbjid", ydbj.getYdbjid());//�Ķ��ʼǱ��

		map.put("bt", ydbj.getBt());//����

		map.put("sj", ydbj.getSj());//�鼮

		map.put("nr", ydbj.getNr());//����

		map.put("yh", ydbj.getYh());//�û�

		map.put("fbsj", ydbj.getFbsj());//����ʱ��

		map.put("gk", ydbj.getGk());//����

		map.put("dz", ydbj.getDz());//����

		ydbjdao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "ydbj/ydbjadd";
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
		ydbjdao.del(id);
		return selectall(null,map);
	}
	/**
	 * �޸�ydbj��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(ydbj ydbj,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("ydbjid", ydbj.getYdbjid());//�Ķ��ʼǱ��

		map.put("bt", ydbj.getBt());//����

		map.put("sj", ydbj.getSj());//�鼮

		map.put("nr", ydbj.getNr());//����

		map.put("yh", ydbj.getYh());//�û�

		map.put("fbsj", ydbj.getFbsj());//����ʱ��

		map.put("gk", ydbj.getGk());//����

		map.put("dz", ydbj.getDz());//����

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		ydbjdao.update(map);
		return selectall(null,map1);
	}
	/**
	 * ��ѯydbj��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=ydbjdao.select(Integer.parseInt(keyid));
		request.setAttribute("ydbjid", list.get(0).get("ydbjid"));//�Ķ��ʼǱ��

		request.setAttribute("bt", list.get(0).get("bt"));//����

		request.setAttribute("sj", list.get(0).get("sj"));//�鼮

		request.setAttribute("nr", list.get(0).get("nr"));//����

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("fbsj", list.get(0).get("fbsj"));//����ʱ��

		request.setAttribute("gk", list.get(0).get("gk"));//����

		request.setAttribute("dz", list.get(0).get("dz"));//����

		
		return "ydbj/ydbjmodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=ydbjdao.select(Integer.parseInt(keyid));
		request.setAttribute("ydbjid", list.get(0).get("ydbjid"));//�Ķ��ʼǱ��

		request.setAttribute("bt", list.get(0).get("bt"));//����

		request.setAttribute("sj", list.get(0).get("sj"));//�鼮

		request.setAttribute("nr", list.get(0).get("nr"));//����

		request.setAttribute("yh", list.get(0).get("yh"));//�û�

		request.setAttribute("fbsj", list.get(0).get("fbsj"));//����ʱ��

		request.setAttribute("gk", list.get(0).get("gk"));//����

		request.setAttribute("dz", list.get(0).get("dz"));//����

		return "ydbj/ydbjdetail";
	}
	
	/**
	 * ��ѯydbj��Ϣ
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
