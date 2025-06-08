package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shujiaDao")
public class shujiaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����shujia��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shujia.insertshujia", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shujia.delshujia", id);
	}

	/**
	 * �޸�shujia��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shujia.updateshujia", map);
	}

	/**
	 * ��ѯshujia��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shujia.selectshujia", id) ; 
	}
	/**
	 * ��ѯshujia��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shujia.selectall", "") ; 
	}

}
