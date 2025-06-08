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
	 * 保存shouzang信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shouzang.insertshouzang", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shouzang.delshouzang", id);
	}

	/**
	 * 修改shouzang信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shouzang.updateshouzang", map);
	}

	/**
	 * 查询shouzang信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shouzang.selectshouzang", id) ; 
	}
	/**
	 * 查询shouzang信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shouzang.selectall", "") ; 
	}

}
