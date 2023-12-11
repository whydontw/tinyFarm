package com.kh.tinyfarm.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.board.vo.Board;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	//게시글 리스트 총 개수 
	public int boardListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.boardListCount");
	}

	//페이지바가 있는 게시글 리스트 조회
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", null, rowBounds);
	}
	
	//게시글 상세보기 전 조회수 증가 메소드
	public int boardIncreaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.boardIncreaseCount", boardNo);
	}
	
	//게시글 상세보기
	public Board boardDetail(SqlSessionTemplate sqlSession, int boardNo) {
	
		return sqlSession.selectOne("boardMapper.boardDetail", boardNo);
	}

	//게시물 추가
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	
	/*
	//게시글 등록
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	//게시글 사진 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, List<MultipartFile> fileList) {
		
		return sqlSession.insert("boardMapper.insertAttachment",fileList);
	}
	*/

	
	
	

}
