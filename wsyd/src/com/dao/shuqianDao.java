package com.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shuqianDao")
public class shuqianDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 保存shuqian信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shuqian.insertshuqian", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shuqian.delshuqian", id);
	}

	/**
	 * 修改shuqian信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shuqian.updateshuqian", map);
	}

	/**
	 * 查询shuqian信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shuqian.selectshuqian", id) ; 
	}
	/**
	 * 查询shuqian信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shuqian.selectall", "") ; 
	}

}
