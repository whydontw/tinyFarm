package com.kh.tinyfarm.board.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardLike;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;

public interface BoardService {

	//게시글 리스트 총 개수
	int boardListCount();

	//페이지가 있는 게시글리스트 조회
	ArrayList<Board> selectBoardList(PageInfo pi);
	
	//게시글 상세보기 전 조회수 증가 메소드
	int boardIncreaseCount(int boardNo);
	
	//게시글 상세보기
	Board boardDetail(int boardNo);

	//게시글 등록
	int insertBoard(Board b);

	//게시글 수정
	int boardUpdate(Board boardInfo);

	//게시글 삭제
	int boardDelete(int boardNo);

	//댓글 리스트 조회
	ArrayList<BoardReply> boardReplyList(int boardNo);

	//댓글 작성
	int insertReply(BoardReply br);

	//댓글 수정
	int updateReply(int replyNo);

	//댓글 삭제
	int deleteReply(int replyNo);

	//좋아요 하면 카운트 증가
	int likeIncreaseCount(BoardLike bl);
	
	//좋아요 하기
	int doLike(BoardLike bl);

	

	

	
	

	
	
}
