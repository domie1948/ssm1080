package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shuqianDao")
public class shuqianDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����shuqian��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shuqian.insertshuqian", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shuqian.delshuqian", id);
	}

	/**
	 * �޸�shuqian��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shuqian.updateshuqian", map);
	}

	/**
	 * ��ѯshuqian��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shuqian.selectshuqian", id) ; 
	}
	/**
	 * ��ѯshuqian��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shuqian.selectall", "") ; 
	}

}
