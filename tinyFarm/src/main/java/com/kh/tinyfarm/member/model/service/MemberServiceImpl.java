package com.kh.tinyfarm.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.dao.MemberDao;
import com.kh.tinyfarm.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public Member loginMember(Member m) {
	
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}
	
	
	@Override
	public int checkId(String checkId) {
		return memberDao.checkId(sqlSession,checkId);
	}

	
	
	
	//admin - 전체 회원수
	@Override
	public int memberListCount() {
		return memberDao.memberListCount(sqlSession);
	}
	

	//admin - 회원 리스트
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return memberDao.selectMemberList(sqlSession, pi);
	}

	
	//admin - 회원활동 일괄중지
	@Override
	public int memberStatusN(ArrayList<Integer> mList) {
		return memberDao.memberStatusN(sqlSession, mList);
	}

	
	//admin - 회원 정보 상세조회
	@Override
	public Member selectMemberDetailInfo(int userNo) {
		return memberDao.selectMemberDetailInfo(sqlSession, userNo);
	}

	
	//admin - 회원 정보 상세조회
	@Override
	public int memberStatusUpdate(Member m) {
		return memberDao.memberStatusUpdate(sqlSession, m);
	}
	
	
	
	
	
}
