package com.kh.tinyfarm.diary.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.tinyfarm.board.service.BoardService;




@Controller
public class MypageController {
	
	//서비스 호출
	@Autowired
	private BoardService boardService;
	
	//	board 나오면 진행
	//	@Autowired
	//	private BoardService boardService;
	
	//각 페이지 위임 모음
	//마이페이지
	@GetMapping("mypage.me")
	public String mypage() {
		return "mypage/mypage";
	}
	//마이페이지
		@GetMapping("update.me")
		public String updateUser() {
			return "mypage/updatePage";
		}
	//영농일지
	@GetMapping("diary.me")
	public String diary() {
		return "mypage/myDiaryPage";
	}
	
	//일지작성페이지
	@GetMapping("insert.di")
	public String insertDiary() {
		return "mypage/insertDiary";
	}
	
	//거래목록
	@GetMapping("trade.me")
	public String tradeList() { 
		return "mypage/myTradePage";
	}
	//활동내역
	@GetMapping("active.me")
	public String myboard() {
//		// 페이징처리 된 게시글 조회하기
//
//				// 현재 페이지 정보 (currentPage)
//				int currentPage = Integer.parseInt(cp);
//				// 전체 게시글 개수 (listCount)
//				int listCount = diaryService.boardListCount();
//				// 한 페이지에서 보여줘야하는 게시글 개수 (boardLimit)X
//				int boardLimit = 5;
//				// 페이징바 개수 (pageLimit)
//				int pageLimit = 5;
//
//				// 페이징 처리된 게시글 목록 조회하기
//				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
//
//				ArrayList<Board> list = diaryService.selectMyBoardList(pi);
//
//				model.addAttribute("list", list);
//				model.addAttribute("pi", pi);
//				
		return "mypage/myActivePage";
	}

	
}

