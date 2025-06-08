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
	 * 保存lyb信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.lyb.insertlyb", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.lyb.dellyb", id);
	}

	/**
	 * 修改lyb信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.lyb.updatelyb", map);
	}

	/**
	 * 查询lyb信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.lyb.selectlyb", id) ; 
	}
	/**
	 * 查询lyb信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.lyb.selectall", "") ; 
	}

}
