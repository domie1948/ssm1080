package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sjflDao")
public class sjflDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存sjfl信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.sjfl.insertsjfl", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.sjfl.delsjfl", id);
	}

	/**
	 * 修改sjfl信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.sjfl.updatesjfl", map);
	}

	/**
	 * 查询sjfl信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.sjfl.selectsjfl", id) ; 
	}
	/**
	 * 查询sjfl信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.sjfl.selectall", "") ; 
	}

}
