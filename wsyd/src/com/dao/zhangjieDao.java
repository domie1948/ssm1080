package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("zhangjieDao")
public class zhangjieDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����zhangjie��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.zhangjie.insertzhangjie", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.zhangjie.delzhangjie", id);
	}

	/**
	 * �޸�zhangjie��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.zhangjie.updatezhangjie", map);
	}

	/**
	 * ��ѯzhangjie��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.zhangjie.selectzhangjie", id) ; 
	}
	/**
	 * ��ѯzhangjie��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.zhangjie.selectall", map) ; 
	}

}
