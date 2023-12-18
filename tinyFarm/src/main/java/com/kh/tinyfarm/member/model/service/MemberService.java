package com.kh.tinyfarm.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;

public interface MemberService {

	//로그인 메소드
	Member loginMember(Member m);
	
	//회원가입 메소드
	int insertMember(Member m);
	
	//아이디 중복체크 메소드
	int checkId(String checkId);

	//이메일발송
	public void sendEmail(Member vo, String div, String plainPassword) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, Member vo) throws Exception;

	
	//admin - 회원 목록 (회원수)
	int memberListCount();

	//admin - 회원 목록
	ArrayList<Member> selectMemberList(PageInfo pi);

	
	//admin - 회원활동 일괄중지
	int memberStatusN(ArrayList<Integer> mList);

	

}