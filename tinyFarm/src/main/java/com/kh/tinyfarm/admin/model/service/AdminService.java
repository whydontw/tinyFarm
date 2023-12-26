package com.kh.tinyfarm.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

public interface AdminService {

	//신고 게시글 개수
	int boardReportListCount();

	//신고 게시글 목록
	ArrayList<BoardReport> selectBoardReportList(PageInfo pi, int category);

	
	//신고 게시글 일괄변경
	int boardReportStatus(Map<String, Object> map);

}
