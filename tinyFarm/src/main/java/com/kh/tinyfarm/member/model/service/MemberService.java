package com.kh.tinyfarm.member.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;

public interface MemberService {

	//로그인 메소드
	Member loginMember(Member m);
	
	//회원가입 메소드
	int insertMember(Member m);
	
	//아이디 중복체크 메소드
	int checkId(String checkId);

	
	
	//admin - 회원 목록 (회원수)
	int memberListCount();

	//admin - 회원 목록
	ArrayList<Member> selectMemberList(PageInfo pi);

	
	//admin - 회원활동 일괄중지
	int memberStatusN(ArrayList<Integer> mList);
}
