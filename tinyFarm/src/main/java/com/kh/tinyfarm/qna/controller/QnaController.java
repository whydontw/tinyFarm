package com.kh.tinyfarm.qna.controller;

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
public class QnaController {

	
	@Autowired
	private QnaService qnaService;
	
	
	//사용자 QNA 등록 페이지
	@GetMapping("/qnaForm")
	public String qnaForm() {
		return "qna/qnaForm";
	}
	
	
	//사용자 QNA 입력
	@PostMapping("/qnaEnroll")
	public String qnaEnroll(Qna qna, Model model) {
		
		System.out.println(qna);
		
		int result = qnaService.qnaEnroll(qna);
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:/";
		
	}
	
	
	
	//사용자 QNA 목록
	@GetMapping("/qnaList")
	public String selectQnaList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		//내 세션에서 꺼내오기
		int userNo =  2;
		
		// 페이징 처리된 게시글 조회하기
		// 현재 페이지 정보(currentPage) - 처음 게시판을 들어올 때는 페이지 정보가 없으니 defaultValue에 설정해 주기
		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int qnaListCount = qnaService.qnaListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 5;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(qnaListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
		ArrayList<Qna> qList = qnaService.selectMyQnaList(pi, userNo);
		
		System.out.println("qnalist");
		for(Qna qa: qList) {
			System.out.println(qa);
		}

		model.addAttribute("qList", qList);
		model.addAttribute("pi", pi);

		return "qna/qnaList";
	}
	
	
	
	//QNA 답변 조회
	@GetMapping("/qnaAnswerView")
	public String myQnaAnswer(int qno, Model model) {
		
		Qna qna = qnaService.selectQnaDetail(qno);
		model.addAttribute("qna", qna);
		
		return "qna/qnaUpdateForm";
		
	}
	
	
	//QNA 답변 수정 Form
	@GetMapping("/qnaUpdate")
	public String myQnaUpdate(int qno, Model model) {
		
		Qna qna = qnaService.selectQnaDetail(qno);
		
		System.out.println("수정하려면 불러와야지" + qna);
		
		model.addAttribute("qna", qna);
		
		return "qna/qnaUpdateForm";
		
	}
	
	
	//관리자 QNA 답변 수정
	@PostMapping("/qnaUpdate")
	public String qnaAnswerUpdate(Qna updateQna, Model model) {
		
//		int qnaNo = updateQna.getQnaNo();
		
		System.out.println("수정 답변내용" + updateQna);
		
		int result = qnaService.qnaUpdate(updateQna);

		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:qnaList";
	}
	
	
	
		
	}
