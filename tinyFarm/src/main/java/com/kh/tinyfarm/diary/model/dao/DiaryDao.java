package com.kh.tinyfarm.diary.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.member.model.vo.Member;


@Repository
public class DiaryDao {

	public int updateMenber(SqlSession sqlSession, Member m) {
		return sqlSession.update("diaryMapper.updateMember", m);
	}

	public int updatePwd(SqlSession sqlSession, Member m) {
		return sqlSession.update("diaryMapper.updatePwd", m);
	}

	public int deleteMember(SqlSession sqlSession, String userId) {
		return sqlSession.update("diaryMapper.deleteMember",userId);
	}

}
