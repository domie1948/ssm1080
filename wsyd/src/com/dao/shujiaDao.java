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
	 * 保存shujia信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shujia.insertshujia", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shujia.delshujia", id);
	}

	/**
	 * 修改shujia信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shujia.updateshujia", map);
	}

	/**
	 * 查询shujia信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shujia.selectshujia", id) ; 
	}
	/**
	 * 查询shujia信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.shujia.selectall", "") ; 
	}

}
