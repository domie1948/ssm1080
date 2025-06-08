package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lybDao")
public class lybDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����lyb��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.lyb.insertlyb", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.lyb.dellyb", id);
	}

	/**
	 * �޸�lyb��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.lyb.updatelyb", map);
	}

	/**
	 * ��ѯlyb��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.lyb.selectlyb", id) ; 
	}
	/**
	 * ��ѯlyb��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.lyb.selectall", "") ; 
	}

}
