package com.kh.tinyfarm.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.board.model.dao.BoardDao;
import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardLike;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.board.model.vo.BoardReport;

import com.kh.tinyfarm.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	
	/*
	//게시글 리스트
		@Override
		public ArrayList<Board> selectBoardList(int userNo) {

			return boardDao.selectBoardList(sqlSession,userNo);
		}
*/
	
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//게시글 리스트
		@Override
		public ArrayList<Board> selectBoardList() {

			return boardDao.selectBoardList(sqlSession);
		}

	
	/*
	//게시글 리스트 총 개수
	@Override
	public int boardListCount() {
		
		return boardDao.boardListCount(sqlSession);
	}
	
	//페이지가 있는 게시글리스트 조회
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		
		return boardDao.selectBoardList(sqlSession,pi);
	}
	*/
	//게시글 상세보기 전 조회수 증가 메소드
	@Override
	public int boardIncreaseCount(int boardNo) {
		
		return boardDao.boardIncreaseCount(sqlSession,boardNo);
	}
	
	//게시글 상세보기
	@Override
	public Board boardDetail(int boardNo) {
		
		return boardDao.boardDetail(sqlSession,boardNo);
	}
	
	//게시글 등록
	@Override
	public int insertBoard(Board b) {
		
		return boardDao.insertBoard(sqlSession,b);
	}
	//게시글 수정
	@Override
	public int boardUpdate(Board boardInfo) {
		
		return boardDao.boardUpdate(sqlSession,boardInfo);
	}

	//게시글삭제
	@Override
	public int boardDelete(int boardNo) {
		
		return boardDao.boardDelete(sqlSession,boardNo);
	}

	//댓글 리스트조회
	@Override
	public ArrayList<BoardReply> boardReplyList(int boardNo) {
		
		return boardDao.boardReplyList(sqlSession,boardNo);
	}

	//댓글 작성
	@Override
	public int insertReply(BoardReply br) {
		
		return boardDao.insertReply(sqlSession,br);
	}

	//댓글 수정
	@Override
	public int updateReply(BoardReply br) {
		
		return boardDao.updateReply(sqlSession,br);
	}

	//댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		
		return boardDao.deleteReply(sqlSession,replyNo);
	}

	
	//유저가 좋아요했는지 안했는지 확인
	/*
	 * @Override public int findLike(BoardLike br) {
	 * 
	 * return boardDao.findLike(sqlSession,br); }
	 */
	@Override
	public ArrayList<BoardLike> findLike(BoardLike br) {
		
		return boardDao.findLike(sqlSession,br);
	}

	
	
	//좋아요 수 증가
	@Override
	public int likeIncreaseCount(BoardLike bl) {
		
		return boardDao.likeIncreaseCount(sqlSession,bl);
	}

	//좋아요하기
	@Override
	public int doLike(BoardLike bl) {

		return boardDao.doLike(sqlSession,bl);
	}

	//좋아요 취소 누르면 카운트 감소
	@Override
	public int likeDecreaseCount(BoardLike bl) {
		
		return boardDao.likeDecreaseCount(sqlSession,bl);
	}

	//좋아요 취소
	@Override
	public int cancelLike(BoardLike bl) {

		return boardDao.cancelLike(sqlSession,bl);
	}

	//신고하기 기능
	@Override
	public int boardReport(BoardReport bp) {
		
		return boardDao.boardReport(sqlSession,bp);
	}

	/*
	//댓글 신고하기
	@Override
	public int boardReReport(ReplyReport rp) {
		
		return boardDao.boardReReport(sqlSession,rp);
	}

	 */
	
	
}
