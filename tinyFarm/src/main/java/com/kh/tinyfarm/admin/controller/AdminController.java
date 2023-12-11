package com.kh.tinyfarm.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.qna.model.service.QnaService;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private QnaService qnaService;

	
	
	
	//관리자 메인 페이지
	@GetMapping("/main")
	public String adminMain() {
		return "admin/main";
	}
	
	
	//관리자 Qna 리스트
	@GetMapping("/qnaList")
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
	
	
	
	//관리자 QNA 답변페이지
	@GetMapping("/qnaAnswer")
	public String qnaAnswerForm(int qno, Model model) {
		
		System.out.println("qno" + qno);
		
		Qna qna = qnaService.selectQnaDetail(qno);
		System.out.println(qna);
		
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerForm";
	}
	
	
	//관리자 QNA 답변 등록
	@PostMapping("/qnaAnswer")
	public String qnaAnswerEnroll(Qna qnaAnswer, Model model) {
		
		int result = qnaService.qnaAnswerEnroll(qnaAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList";
	}
	
	
	
	//관리자 QNA 수정 페이지
	@GetMapping("/qnaAnswerUpdate")
	public String qnaAnswerUpdateForm(int qno, Model model) {
		
		Qna qna = qnaService.selectQnaDetail(qno);
		model.addAttribute("qna", qna);
		
		return "admin/qnaAnswerUpdateForm";
	}
	
	
	
	//관리자 QNA 답변 수정
	@PostMapping("/qnaAnswerUpdate")
	public String qnaAnswerUpdate(Qna updateAnswer, Model model) {
		
		int qnaNo = updateAnswer.getQnaNo();
		
		int result = qnaService.qnaAnswerUpdate(updateAnswer);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaAnswerUpdate?qno=" + qnaNo;
	}
	
	
	
	
	//관리자 Qna 전체답변 페이지
//	@GetMapping("/qnaAnswerAll")
//	public String selectQnaAllList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
//		
//		
//		// 페이징 처리된 게시글 조회하기
//		// 현재 페이지 정보(currentPage) - 처음 게시판을 들어올 때는 페이지 정보가 없으니 defaultValue에 설정해 주기
//		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
//		int qnaListCount = qnaService.qnaListCount();
//
//		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
//		int boardLimit = 5;
//		// 페이징 바 개수(pageLimit)
//		int pageLimit = 5;
//
//		PageInfo pi = Pagination.getPageInfo(qnaListCount, currentPage, pageLimit, boardLimit);
//
//		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
//		ArrayList<Qna> qList = qnaService.selectQnaList(pi);
//		
//
//		model.addAttribute("qList", qList);
//		model.addAttribute("pi", pi);
//
//
//		return "admin/qna";
//	}
//	
	
	
	
	
}
