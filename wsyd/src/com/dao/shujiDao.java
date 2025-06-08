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
	 * 保存shuji信息
	 * @param map
	 */
	public void save(Map<String, Object> map) {
		sqlSession.insert("com.shuji.insertshuji", map);
		
	}
	/**
	 * 删除aa
	 * @param id
	 */
	public void del(Integer id) {
		sqlSession.delete("com.shuji.delshuji", id);
	}

	/**
	 * 修改shuji信息
	 * @param map
	 */
	public void update(Map<String, Object> map) {
		sqlSession.update("com.shuji.updateshuji", map);
	}

	/**
	 * 查询shuji信息
	 * @param id
	 * @return 
	 */
	public List<Map<String, Object>> select(Integer id) {
		return sqlSession.selectList("com.shuji.selectshuji", id) ; 
	}
	/**
	 * 查询shuji信息
	 * 
	 * @return 
	 */
	public List<Map<String, Object>> selectAll(Map<String, Object> map) {
		return sqlSession.selectList("com.shuji.selectall", map) ; 
	}

}
