package com.kh.tinyfarm.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.admin.model.dao.AdminDao;
import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{
	
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// ================================================
	//	BoardReport
	
	//신고 게시글 개수
	@Override
	public int boardReportListCount() {
		return adminDao.boardReportListCount(sqlSession);
	}

	//신고 게시글 목록
	@Override
	public ArrayList<BoardReport> selectBoardReportList(PageInfo pi, int category) {
		return adminDao.selectBoardReportList(sqlSession, pi, category);
	}

	
	//신고게시글 일괄변경하기
	@Override
	public int boardReportStatus(Map<String, Object> map) {
		return adminDao.boardReportStatus(sqlSession, map);
	}
	
	

}
