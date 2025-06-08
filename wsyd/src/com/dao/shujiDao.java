package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shujiDao")
public class shujiDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����shuji��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shuji.insertshuji", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shuji.delshuji", id);
	}

	/**
	 * �޸�shuji��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shuji.updateshuji", map);
	}

	/**
	 * ��ѯshuji��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shuji.selectshuji", id) ; 
	}
	/**
	 * ��ѯshuji��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.shuji.selectall", map) ; 
	}

}
