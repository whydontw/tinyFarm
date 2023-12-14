package com.kh.tinyfarm.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	//QNA 답변 페이지 이동
	@GetMapping("/qnaAnswer.ad")
	public String qnaAnswerForm(int qno, Model model) {
		
		System.out.println("qno" + qno);
		
		Qna qna = qnaService.selectQnaDetail(qno);
		System.out.println(qna);
		
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerForm";
	}
	
	
	
	//QNA 답변 등록
	@PostMapping("/qnaAnswer.ad")
	public String qnaAnswerEnroll(Qna qnaAnswer, Model model) {
		
		int result = qnaService.qnaAnswerEnroll(qnaAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	//QNA 답변 수정
	@GetMapping("/qnaAnswerUpdate.ad")
	public String qnaAnswerUpdateForm(int qno, Model model) {
		
		Qna qna = qnaService.selectQnaDetail(qno);
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerUpdateForm";
	}
	
	
	
	//QNA 답변 수정
	@PostMapping("/qnaAnswerUpdate.ad")
	public String qnaAnswerUpdate(Qna updateAnswer, Model model) {
		
		int qnaNo = updateAnswer.getQnaNo();
		
		int result = qnaService.qnaAnswerUpdate(updateAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaAnswerUpdate.ad?qno=" + qnaNo;
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
	
	
	
//	public String 
	
	
	
	
	
	
}
