package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shouzangDao")
public class shouzangDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����shouzang��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shouzang.insertshouzang", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shouzang.delshouzang", id);
	}

	/**
	 * �޸�shouzang��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shouzang.updateshouzang", map);
	}

	/**
	 * ��ѯshouzang��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shouzang.selectshouzang", id) ; 
	}
	/**
	 * ��ѯshouzang��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shouzang.selectall", "") ; 
	}

}
