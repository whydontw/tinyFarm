package com.kh.tinyfarm.follow.model.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.follow.model.dao.FollowDao;
import com.kh.tinyfarm.follow.model.vo.Follow;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDao followDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	
	@Override
	public int insertFollow(Follow fw) {
		
		return followDao.insertFollow(sqlSession,fw);
	}


	@Override
	public int deleteFollow(Follow fw) {
		
		return followDao.deleteFollow(sqlSession,fw);
	}


	@Override
	public int selectFollow(Follow fw) {
		
		return followDao.selectFollow(sqlSession,fw);
	}

}
