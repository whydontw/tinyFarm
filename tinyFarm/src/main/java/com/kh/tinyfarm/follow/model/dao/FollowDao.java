package com.kh.tinyfarm.follow.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.follow.model.vo.Follow;


@Repository
public class FollowDao {

	public int insertFollow(SqlSessionTemplate sqlSession, Follow fw) {
		
		return sqlSession.insert("followMapper.insertFollow", fw);
	}

	public int deleteFollow(SqlSessionTemplate sqlSession, Follow fw) {
	
		return sqlSession.delete("followMapper.deleteFollow", fw);
	}

	public int selectFollow(SqlSessionTemplate sqlSession, Follow fw) {
	
		return sqlSession.selectOne("followMapper.selectFollow", fw);
	}

}
