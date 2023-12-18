package com.kh.tinyfarm.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.board.model.service.BoardService;
import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.qna.model.service.QnaService;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Controller
public class AdminController {
	
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;

	
	
	
	//메인 페이지
	@GetMapping("/main.ad")
	public String adminMain() {
		return "admin/main";
	}
	
	
	
	//QNA 목록
	@GetMapping("/qnaList.ad")
	public String selectQnaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int qnaListCount = qnaService.qnaListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 5;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(qnaListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
		ArrayList<Qna> qList = qnaService.selectQnaList(pi);
		

		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);


		return "admin/qnaList";
	}
	
	
	//QNA 답변 페이지 Form
	@PostMapping("/qnaAnswerForm.ad")
	public String qnaAnswerForm(int qnaNo, Model model) {

		Qna qna = qnaService.selectQnaDetail(qnaNo);
		System.out.println(qna);
		
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerForm";
	}
	
	
	
	//QNA 답변 등록
	@PostMapping("/qnaAnswer.ad")
	public String qnaAnswerEnroll(Qna qnaAnswer, Model model) {
		
		System.out.println(qnaAnswer);
		
		int result = qnaService.qnaAnswerEnroll(qnaAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	//QNA 답변 수정 Form
	@PostMapping("/qnaAnswerUpdateForm.ad")
	public String qnaAnswerUpdateForm(int qnaNo, Model model) {
		
		Qna qna = qnaService.selectQnaDetail(qnaNo);
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerUpdateForm";
	}
	
	
	
	//QNA 답변 수정 등록
	@PostMapping("/qnaAnswerUpdate.ad")
	public String qnaAnswerUpdate(Qna updateAnswer, Model model) {
		
		int qnaNo = updateAnswer.getQnaNo();
		
		int result = qnaService.qnaAnswerUpdate(updateAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	//사용자 QNA 일괄 삭제
	@PostMapping("/qnaAnswerDelete.ad")
	public String chkQnaDelete(String chkQnaList, Model model) {
				
		String[] ckList = chkQnaList.split(",");
		
		ArrayList<Integer> qnaList = new ArrayList<>();
		
		for(int i = 0; i < ckList.length; i++) {
			qnaList.add(i, Integer.parseInt(ckList[i]));
		}
		
		int result = qnaService.chkQnaDelete(qnaList);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	// ###################################################################
	
	
	
	//회원 목록 조회
	@GetMapping("/memberList.ad")
	public String memberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int memberListCount = memberService.memberListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 10;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(memberListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
		ArrayList<Member> mList = memberService.selectMemberList(pi);
		
		model.addAttribute("mList", mList);
		model.addAttribute("pi", pi);
		
		return "admin/memberList";
	}

	
	
	//선택한 회원 일괄중지
	@PostMapping("/memberStatus.ad")
	public String memberStatusN(String chkMemberList, Model model) {
				
		String[] ckList = chkMemberList.split(",");
		
		ArrayList<Integer> mList = new ArrayList<>();
		
		for(int i = 0; i < ckList.length; i++) {
			mList.add(i, Integer.parseInt(ckList[i]));
		}
				
		int result = memberService.memberStatusN(mList);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:memberList.ad";
	}
	
	
	
	//회원 상세조회
	@ResponseBody
	@RequestMapping(value="memberDetailInfo.ad", produces = "application/json; charset=utf-8")
	public Member selectMemberDetailInfo(int userNo) {
		return memberService.selectMemberDetailInfo(userNo);
	}
	
	
	//admin - 회원상태 업데이트
	@ResponseBody
	@RequestMapping(value="memberInfoUpdate.ad", produces = "application/json; charset=utf-8")
	public Member memberStatusUpdate(Member m, Model model) {
		
		int result = memberService.memberStatusUpdate(m);
		
		if(result > 0) {
			return memberService.selectMemberDetailInfo(m.getUserNo());
		}else {
			return m;
		}
		
	}
	
	
	
	//회원 목록 조회
	@GetMapping("/boardList.ad")
	public String boardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int boardListCount = boardService.boardListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 10;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(boardListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
		ArrayList<Member> bList = boardService.selectAdminMemberList(pi);
		
		model.addAttribute("bList", bList);
		model.addAttribute("pi", pi);
		
		return "admin/boardList";
	}
	
	
}
