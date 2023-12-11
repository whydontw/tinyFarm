package com.kh.tinyfarm.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MypageController {
	
//	//서비스 호출
//	@Autowired
//	private DiaryService diaryService;
	
	//각 페이지 위임 모음
	//마이페이지(회원정보수정이 메인)
	@GetMapping("mypage.me")
	public String mypage() {
		return "mypage/mypage";
	}
	//영농일지
	@GetMapping("diary.me")
	public String diary() {
		return "mypage/myDiaryPage";
	}
	//팔로우 목록
	@GetMapping("follow.me")
	public String followList() { 
		return "mypage/myFollowPage";
	}
	//거래목록
	@GetMapping("trade.me")
	public String tradeList() { 
		return "mypage/myTradePage";
	}
	//내가 쓴 게시글
	@GetMapping("board.me")
	public String myboard() {
		return "mypage/myBoardPage";
	}
	//내가 쓴 댓글
	@GetMapping("reply.me")
	public String reply() {
		return "mypage/myReplyPage";
	}
	//회원탈퇴
	@GetMapping("delete.me")
	public String deleteUser() {
		return "mypage/myDeletePage";
	}
	
	//일지 작성
	@ResponseBody
	@PostMapping("insert.Di")
	public void insertDiary() {
		
	}
	

	
}
