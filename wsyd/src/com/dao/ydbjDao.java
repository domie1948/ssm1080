package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ydbjDao")
public class ydbjDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * ����ydbj��Ϣ
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.ydbj.insertydbj", map);
		
	}
	/**
	 * ɾ��aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.ydbj.delydbj", id);
	}

	/**
	 * �޸�ydbj��Ϣ
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.ydbj.updateydbj", map);
	}

	/**
	 * ��ѯydbj��Ϣ
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.ydbj.selectydbj", id) ; 
	}
	/**
	 * ��ѯydbj��Ϣ
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.ydbj.selectall", "") ; 
	}

}
