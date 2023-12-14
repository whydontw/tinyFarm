package com.kh.tinyfarm.diary.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.diary.model.dao.DiaryDao;
import com.kh.tinyfarm.member.model.vo.Member;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDao diaryDao;

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int updateMember(Member m) {
		return diaryDao.updateMenber(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return diaryDao.updatePwd(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		return diaryDao.deleteMember(sqlSession, userId);
	}

}
