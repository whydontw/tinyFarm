package com.kh.tinyfarm.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.board.model.vo.BoardReport;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Repository
public class AdminDao {

	// 신고 게시글 개수
	public int boardReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.boardReportListCount");
	}

	
	// 신고 게시글 목록
	public ArrayList<BoardReport> selectBoardReportList(SqlSessionTemplate sqlSession, PageInfo pi, int category) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("adminMapper.selectBoardReportList", category, rowBounds);

	}


	//신고글 상태변경
	public int boardReportStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		if((int)(map.get("status")) == 1) {
			return sqlSession.update("adminMapper.revokeBoardReport", map);
		}else {
			return sqlSession.update("adminMapper.deleteBoardReport", map);
		}
	}
	
	
	
	
	
}
