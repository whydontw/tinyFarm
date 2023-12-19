package com.kh.tinyfarm.diary.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.member.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;




@Repository
public class DiaryDao {
	//회원정보 수정
	public int updateMember(SqlSession sqlSession,Member m) {
		return sqlSession.update("diaryMapper.updateMember", m);
	}
	//비밀번호 변경
	public int updatePwd(SqlSession sqlSession,Member m) {
		
		return sqlSession.update("diaryMapper.updatePwd", m);
	}
	//회원탈퇴
	public int deleteMember(SqlSession sqlSession,String userId) {
		return sqlSession.update("diaryMapper.deleteMember",userId);
	}
	
	//내 게시글개수
	public int boardListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.boardListCount",userId);
	}
	
	//내 댓글개수
	public int replyListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.replyListCount",userId);
	}
	
	//팔로잉수
	public int fwingListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.fwingListCount",userId);
	}
	
	//팔로워수
	public int fwerListCount(SqlSession sqlSession,String userId) {
		return sqlSession.selectOne("diaryMapper.fwerListCount",userId);
	}
	
	//내 게시글 목록
	public ArrayList<Board> myBoardList(SqlSession sqlSession,String userId,PageInfo bPi) {
		
		int limit = bPi.getPageLimit();
		int offset = (bPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myBoardList",userId,rowbounds);
	}

	//내 댓글 목록
	public ArrayList<BoardReply> myReplyList(SqlSession sqlSession,String userId,PageInfo rPi) {
		
		int limit = rPi.getPageLimit();
		int offset = (rPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myReplyList",userId,rowbounds);
	}

	//팔로잉 목록
	public ArrayList<Follow> myFollowingList(SqlSession sqlSession,String userId,PageInfo fiPi) {
		
		int limit = fiPi.getPageLimit();
		int offset = (fiPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myFollowingList",userId,rowbounds);
	}

	//팔로워 목록
	public ArrayList<Member> myFollowerList(SqlSession sqlSession,String userId,PageInfo fwPi) {
		
		int limit = fwPi.getPageLimit();
		int offset = (fwPi.getCurrentPage() - 1) * limit;

		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("diaryMapper.myFollowerList",userId,rowbounds);
	}
	
	//일지작성
	public int insertDiary(SqlSession sqlSession,Diary d) {
		return sqlSession.insert("diaryMapper.insertDiary",d);
	}
	public ArrayList<Diary> selectDiaryList(SqlSession sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectDiaryList", userNo);
	}

	
	
	


}
