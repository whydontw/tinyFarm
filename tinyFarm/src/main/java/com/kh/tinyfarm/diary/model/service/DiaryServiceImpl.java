package com.kh.tinyfarm.diary.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.diary.model.dao.DiaryDao;
import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.diary.model.vo.DiaryCategory;
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
	public ArrayList<Board> myBoardList(String userId, PageInfo bPi) {
		return diaryDao.myBoardList(sqlSession,userId,bPi);
	}

	//내가 쓴 댓글 목록
	@Override
	public ArrayList<BoardReply> myReplyList(String userId,PageInfo rPi) {
		return diaryDao.myReplyList(sqlSession,userId,rPi);
	}

	//팔로잉 목록
	@Override
	public ArrayList<Follow> myFollowingList(String userId,PageInfo fiPi) {
		return diaryDao.myFollowingList(sqlSession,userId,fiPi);
	}
	
	//팔로워 목록
	@Override
	public ArrayList<Member> myFollowerList(String userId,PageInfo fwPi) {
		return diaryDao.myFollowerList(sqlSession,userId,fwPi);
	}
	
	//일지등록
	@Override
	public int insertDiary(Diary d) {
		return diaryDao.insertDiary(sqlSession,d);
	}

	//일지목록
	@Override
	public ArrayList<Diary> selectDiaryList(int userNo) {
		return diaryDao.selectDiaryList(sqlSession,userNo);
	}

	//일지 선택
	@Override
	public Diary selectDiary(Diary d) {
		return diaryDao.selectDiary(sqlSession, d);
	}

	//일지 디테일
	@Override
	public Diary viewDiary(int diaryNo) {
		return diaryDao.viewDiary(sqlSession,diaryNo);
	}
	
	//일지 존재여부
	@Override
	public int existDiary(Diary d) {
		return diaryDao.existDiary(sqlSession,d);
	}
	
	//일지삭제
	@Override
	public int deleteDiary(int diaryNo) {
		return diaryDao.deleteDiary(sqlSession,diaryNo);
	}
	//카테고리이름 추출
	@Override
	public DiaryCategory selectCategory(String cNo) {
		return diaryDao.selectCategory(sqlSession,cNo);
	}
	//일지 수정
	@Override
	public int updateDiary(Diary d) {
		return diaryDao.updateDiary(sqlSession,d);
	}
	//일지 개수(등급관리용)
	@Override
	public int diaryListCount(int userNo) {
		return diaryDao.diaryListCount(sqlSession,userNo);
	}
	
	//씨앗등급
	@Override
	public int gradeSeed(int userNo) {
		return diaryDao.gradeSeed(sqlSession,userNo);
	}
	
	//새싹등급
	@Override
	public int gradeShoot(int userNo) {
		return diaryDao.gradeShoot(sqlSession,userNo);
	}
	//잎새등급
	@Override
	public int gradeLeaf(int userNo) {
		return diaryDao.gradeLeaf(sqlSession,userNo);
	}
	//열매등급
	@Override
	public int gradeFruit(int userNo) {
		return diaryDao.gradeFruit(sqlSession,userNo);
	}

}
