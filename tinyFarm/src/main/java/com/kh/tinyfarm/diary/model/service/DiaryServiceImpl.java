package com.kh.tinyfarm.diary.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.board.vo.Board;
import com.kh.tinyfarm.board.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.diary.model.dao.DiaryDao;
import com.kh.tinyfarm.member.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;


@Service
public class DiaryServiceImpl implements DiaryService {
	//호출
	@Autowired
	private DiaryDao diaryDao;

	@Autowired
	private SqlSession sqlSession;
	
	//회원정보 수정
	@Override
	public int updateMember(Member m) {
		return diaryDao.updateMember(sqlSession, m);
	}
	
	//비밀번호 변경
	@Override
	public int updatePwd(Member m) {
		return diaryDao.updatePwd(sqlSession,m );
	}

	//회원탈퇴
	@Override
	public int deleteMember(String userId) {
		return diaryDao.deleteMember(sqlSession, userId);
	}

	//내가 쓴 게시글 개수
	@Override
	public int boardListCount(String userId) {
		return diaryDao.boardListCount(sqlSession, userId);
	}
	
	//내가 쓴 댓글 개수
	@Override
	public int replyListCount(String userId) {
		return diaryDao.replyListCount(sqlSession, userId);
	}
	
	//팔로잉 수
	@Override
	public int fwingListCount(String userId) {
		return diaryDao.fwingListCount(sqlSession, userId);
	}

	//팔로워 수
	@Override
	public int fwerListCount(String userId) {
		return diaryDao.fwerListCount(sqlSession, userId);
	}

	//내가 쓴 게시글 목록
	@Override
	public ArrayList<Board> MyBoardList(PageInfo bPi) {
		return diaryDao.MyBoardList(sqlSession, bPi);
	}

	//내가 쓴 댓글 목록
	@Override
	public ArrayList<BoardReply> MyReplyList(PageInfo rPi) {
		return diaryDao.MyReplyList(sqlSession, rPi);
	}

	//팔로잉 목록
	@Override
	public ArrayList<Follow> MyFollowingList(PageInfo fiPi) {
		return diaryDao.MyFollowingList(sqlSession, fiPi);
	}
	
	//팔로워 목록
	@Override
	public ArrayList<Follow> MyFollowerList(PageInfo fwPi) {
		return diaryDao.MyFollowerList(sqlSession, fwPi);
	}

}
