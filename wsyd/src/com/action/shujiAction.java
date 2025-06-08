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
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
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

		map.put("sjid", shuji.getSjid());//�鼮���

		map.put("sjmc", shuji.getSjmc());//�鼮����

		map.put("fl", shuji.getFl());//����

		map.put("zz", shuji.getZz());//����

		map.put("cbs", shuji.getCbs());//������

		map.put("js", shuji.getJs());//����

		map.put("tp", shuji.getTp());//ͼƬ

		map.put("wj", shuji.getWj());//�ļ�

		map.put("lll", shuji.getLll());//�����

		map.put("sj", shuji.getSj());//�ϼ�

		shujidao.save(map);
		
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		System.out.println("addok");
		return "shuji/shujiadd";
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
		shujidao.del(id);
		return selectall(null,map,request);
	}
	/**
	 * �޸�shuji��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(shuji shuji,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("sjid", shuji.getSjid());//�鼮���

		map.put("sjmc", shuji.getSjmc());//�鼮����

		map.put("fl", shuji.getFl());//����

		map.put("zz", shuji.getZz());//����

		map.put("cbs", shuji.getCbs());//������

		map.put("js", shuji.getJs());//����

		map.put("tp", shuji.getTp());//ͼƬ

		map.put("wj", shuji.getWj());//�ļ�

		map.put("lll", shuji.getLll());//�����

		map.put("sj", shuji.getSj());//�ϼ�

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		shujidao.update(map);
		return selectall(null,map1,request);
	}
	/**
	 * ��ѯshuji��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujidao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//�鼮���

		request.setAttribute("sjmc", list.get(0).get("sjmc"));//�鼮����

		request.setAttribute("fl", list.get(0).get("fl"));//����

		request.setAttribute("zz", list.get(0).get("zz"));//����

		request.setAttribute("cbs", list.get(0).get("cbs"));//������

		request.setAttribute("js", list.get(0).get("js"));//����

		request.setAttribute("tp", list.get(0).get("tp"));//ͼƬ

		request.setAttribute("wj", list.get(0).get("wj"));//�ļ�

		request.setAttribute("lll", list.get(0).get("lll"));//�����

		request.setAttribute("sj", list.get(0).get("sj"));//�ϼ�

		
		return "shuji/shujimodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=shujidao.select(Integer.parseInt(keyid));
		request.setAttribute("sjid", list.get(0).get("sjid"));//�鼮���

		request.setAttribute("sjmc", list.get(0).get("sjmc"));//�鼮����

		request.setAttribute("fl", list.get(0).get("fl"));//����

		request.setAttribute("zz", list.get(0).get("zz"));//����

		request.setAttribute("cbs", list.get(0).get("cbs"));//������

		request.setAttribute("js", list.get(0).get("js"));//����

		request.setAttribute("tp", list.get(0).get("tp"));//ͼƬ

		request.setAttribute("wj", list.get(0).get("wj"));//�ļ�

		request.setAttribute("lll", list.get(0).get("lll"));//�����

		request.setAttribute("sj", list.get(0).get("sj"));//�ϼ�

		return "shuji/shujidetail";
	}
	
	/**
	 * ��ѯshuji��Ϣ
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
		list=shujidao.selectAll(map1);
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "shuji/shujilist";
	}
}
