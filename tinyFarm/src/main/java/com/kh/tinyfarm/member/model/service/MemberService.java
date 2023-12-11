package com.kh.tinyfarm.member.model.service;

import com.kh.tinyfarm.member.model.vo.Member;

public interface MemberService {

	//로그인 메소드
	Member loginMember(Member m);
	
	//회원가입 메소드
	int insertMember(Member m);
	
	//아이디 중복체크 메소드
	int checkId(String checkId);
}
