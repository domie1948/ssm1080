package com.action;
import java.sql.ResultSet;
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
import com.util.DBO;
@Controller
@RequestMapping(value="/yonghu")
public class yonghuAction {
	/**
	 * �Զ�ע��ҵ���߼��㣬ע�뷽ʽʹ����ע���Զ�ע��
	 */

	@Resource yonghuDao yonghudao;
	@RequestMapping(value="/addPage")
	public String addPage(yonghu yonghu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		
		System.out.println("addPageok");
		return "yonghu/yonghuadd";
	}
	
	@RequestMapping(value="/add")
	public String add(yonghu yonghu,HttpServletRequest request){
		Map<String,Object> map= new HashMap<String,Object>();
		//String name=(String)request.getParameter("name");

		map.put("yhid", yonghu.getYhid());//�û����

		map.put("yhm", yonghu.getYhm());//�û���

		map.put("mm", yonghu.getMm());//����

		map.put("xm", yonghu.getXm());//����

		map.put("qx", yonghu.getQx());//Ȩ��

		map.put("zcsj", yonghu.getZcsj());//ע��ʱ��

		map.put("lxdh", yonghu.getLxdh());//��ϵ�绰

		map.put("lxdz", yonghu.getLxdz());//��ϵ��ַ

		map.put("xb", yonghu.getXb());//�Ա�

		map.put("nl", yonghu.getNl());//����

		map.put("ah", yonghu.getAh());//����

		

		String sql="select count(1) as num from yonghu where yhm='"+yonghu.getYhm()+"'";
		DBO db=new DBO();
		ResultSet rs=null;
		int a=0;
		try{
		rs=db.query(sql);
		if(rs.next()){
			a=rs.getInt("num");
		}
		if(a==0){
		
		request.setAttribute("msg", "<script>alert('��ӳɹ�');</script>");
		yonghudao.save(map);
		}else{
			request.setAttribute("msg", "<script>alert('���ʧ�ܡ��û����ظ�');</script>");	
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		

		System.out.println("addok");
		return "yonghu/yonghuadd";
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
		yonghudao.del(id);
		return selectall(null,map);
	}
	/**
	 * �޸�yonghu��Ϣ
	 */
	@RequestMapping(value="/update")
	public String update(yonghu yonghu,HttpServletRequest request,Map<String,Object> map1){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("yhid", yonghu.getYhid());//�û����

		map.put("yhm", yonghu.getYhm());//�û���

		map.put("mm", yonghu.getMm());//����

		map.put("xm", yonghu.getXm());//����

		map.put("qx", yonghu.getQx());//Ȩ��

		map.put("zcsj", yonghu.getZcsj());//ע��ʱ��

		map.put("lxdh", yonghu.getLxdh());//��ϵ�绰

		map.put("lxdz", yonghu.getLxdz());//��ϵ��ַ

		map.put("xb", yonghu.getXb());//�Ա�

		map.put("nl", yonghu.getNl());//����

		map.put("ah", yonghu.getAh());//����

		request.setAttribute("msg", "<script>alert('�޸ĳɹ�');</script>");
		yonghudao.update(map);
		return selectall(null,map1);
	}
	/**
	 * ��ѯyonghu��Ϣ
	 */
	@RequestMapping(value="/modify")
	public String modify(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.select(Integer.parseInt(keyid));
		request.setAttribute("yhid", list.get(0).get("yhid"));//�û����

		request.setAttribute("yhm", list.get(0).get("yhm"));//�û���

		request.setAttribute("mm", list.get(0).get("mm"));//����

		request.setAttribute("xm", list.get(0).get("xm"));//����

		request.setAttribute("qx", list.get(0).get("qx"));//Ȩ��

		request.setAttribute("zcsj", list.get(0).get("zcsj"));//ע��ʱ��

		request.setAttribute("lxdh", list.get(0).get("lxdh"));//��ϵ�绰

		request.setAttribute("lxdz", list.get(0).get("lxdz"));//��ϵ��ַ

		request.setAttribute("xb", list.get(0).get("xb"));//�Ա�

		request.setAttribute("nl", list.get(0).get("nl"));//����

		request.setAttribute("ah", list.get(0).get("ah"));//����

		
		return "yonghu/yonghumodify";
	}
	
	@RequestMapping(value="/detail")
	public String detail(Integer id,Map<String,Object> map,HttpServletRequest request){
		String keyid=(String)request.getParameter("keyid");
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.select(Integer.parseInt(keyid));
		request.setAttribute("yhid", list.get(0).get("yhid"));//�û����

		request.setAttribute("yhm", list.get(0).get("yhm"));//�û���

		request.setAttribute("mm", list.get(0).get("mm"));//����

		request.setAttribute("xm", list.get(0).get("xm"));//����

		request.setAttribute("qx", list.get(0).get("qx"));//Ȩ��

		request.setAttribute("zcsj", list.get(0).get("zcsj"));//ע��ʱ��

		request.setAttribute("lxdh", list.get(0).get("lxdh"));//��ϵ�绰

		request.setAttribute("lxdz", list.get(0).get("lxdz"));//��ϵ��ַ

		request.setAttribute("xb", list.get(0).get("xb"));//�Ա�

		request.setAttribute("nl", list.get(0).get("nl"));//����

		request.setAttribute("ah", list.get(0).get("ah"));//����

		return "yonghu/yonghudetail";
	}
	
	/**
	 * ��ѯyonghu��Ϣ
	 */
	@RequestMapping(value="/selectall")
	public String selectall(Integer id,Map<String,Object> map){
		List<Map<String,Object>> list= new  ArrayList<Map<String,Object>>();
		list=yonghudao.selectAll();
		System.out.println("listsize="+list.size());
		
		map.put("mylist", list);
		return "yonghu/yonghulist";
	}
}
