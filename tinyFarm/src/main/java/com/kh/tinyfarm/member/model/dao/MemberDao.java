package com.kh.tinyfarm.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.tinyfarm.member.model.vo.Member;

@Repository 
public class MemberDao {
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession , Member m) {
	
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	//아이디 중복체크
		public int checkId(SqlSessionTemplate sqlSession, String checkId) {
			
			return sqlSession.selectOne("memberMapper.checkId",checkId);
		}
	
}
