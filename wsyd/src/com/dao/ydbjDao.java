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
	 * 保存ydbj信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.ydbj.insertydbj", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.ydbj.delydbj", id);
	}

	/**
	 * 修改ydbj信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.ydbj.updateydbj", map);
	}

	/**
	 * 查询ydbj信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.ydbj.selectydbj", id) ; 
	}
	/**
	 * 查询ydbj信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.ydbj.selectall", "") ; 
	}

}
