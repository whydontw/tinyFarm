package com.kh.tinyfarm.board.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.board.dao.BoardDao;
import com.kh.tinyfarm.board.vo.Board;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

	@Override
	public int insertBoard(Board b) {
		
		return boardDao.insertBoard(sqlSession,b);
	}


	
	/*
	//게시글 등록
	@Override
	public int insertBoard(Board b, List<MultipartFile> fileList) {
		
		System.out.println("serviceImpl작동되는지 확인용");
		int result1= boardDao.insertBoard(sqlSession,b);
		int result2= boardDao.insertAttachment(sqlSession,fileList);
		
		
		
		if(result1*result2>0) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
		return result1*result2;
	}
	*/
	
}
