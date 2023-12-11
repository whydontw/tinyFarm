package com.kh.tinyfarm.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.board.vo.Board;
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
	

	
	
}
