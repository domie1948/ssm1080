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
	 * 保存zhangjie信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.zhangjie.insertzhangjie", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.zhangjie.delzhangjie", id);
	}

	/**
	 * 修改zhangjie信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.zhangjie.updatezhangjie", map);
	}

	/**
	 * 查询zhangjie信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.zhangjie.selectzhangjie", id) ; 
	}
	/**
	 * 查询zhangjie信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.zhangjie.selectall", map) ; 
	}

}
