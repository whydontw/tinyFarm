package com.kh.tinyfarm.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.admin.model.service.AdminService;
import com.kh.tinyfarm.board.model.service.BoardService;
import com.kh.tinyfarm.board.model.vo.BoardReport;
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
	
	@Autowired
	private AdminService adminService;
	
	

	
	
	
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
	public String qnaAnswerEnroll(Qna qnaAnswer, Model model, HttpSession session) {
		
		System.out.println(qnaAnswer);
		
		int result = qnaService.qnaAnswerEnroll(qnaAnswer);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "답변을 등록하였습니다.");
		}else {
			session.setAttribute("alertMsg", "답변 등록에 실패하였습니다.");
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
	public String qnaAnswerUpdate(Qna updateAnswer, Model model, HttpSession session) {
		
		int qnaNo = updateAnswer.getQnaNo();
		
		int result = qnaService.qnaAnswerUpdate(updateAnswer);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "답변을 수정하였습니다.");
		}else {
			session.setAttribute("alertMsg", "답변 수정에 실패하였습니다.");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	//사용자 QNA 일괄 삭제
	@PostMapping("/qnaAnswerDelete.ad")
	public String chkQnaDelete(String chkQnaList, Model model, HttpSession session) {
				
		String[] ckList = chkQnaList.split(",");
		
		ArrayList<Integer> qnaList = new ArrayList<>();
		
		for(int i = 0; i < ckList.length; i++) {
			qnaList.add(i, Integer.parseInt(ckList[i]));
		}
		
		int result = qnaService.chkQnaDelete(qnaList);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선택한 QNA 내역을 삭제하였습니다.");
		}else {
			session.setAttribute("alertMsg", "삭제 실패!");
		}
		
		return "redirect:qnaList.ad";
	}
	
	
	
	// ###################################################################
	
	
	
	
	//회원 게시글 페이지
	@GetMapping("/memberList.ad")
	public String memberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		model.addAttribute("currentPage", currentPage);
		return "admin/memberList";
		
	}
	
	
	@ResponseBody
	@GetMapping("/selectMemberList.ad")
	public  ResponseEntity<Map<String, Object>> selectMemberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String searchId, Model model) {

		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int memberListCount = memberService.memberListCount(searchId);

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 5;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(memberListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
	    ArrayList<Member> mList = memberService.selectMemberList(pi, searchId);

	    
	    // 데이터를 Map에 담아서 전송
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("mList", mList);
	    resultMap.put("pi", pi);

	    
	    // ResponseEntity로 감싸서 전송
	    return ResponseEntity.ok(resultMap);
		
	}
	
	
	
	//선택한 회원 일괄중지
	@ResponseBody
	@GetMapping("/memberStatus.ad")
	public String memberStatus(String chkMemberList, String status, Model model, HttpSession session) {
		
		int statusNm = 0;
		
		if(status.equals("Y")) {
			statusNm = 1;
		}
		
		
		String[] ckList = chkMemberList.split(",");
		
		ArrayList<Integer> mList = new ArrayList<>();
		
		for(int i = 0; i < ckList.length; i++) {
			mList.add(i, Integer.parseInt(ckList[i]));
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("status", statusNm);
		map.put("mList", mList);

		
		int result = memberService.memberStatus(map);
		
		System.out.println("일괄 어쩌구 결과: " + result);
		
		String resultStr = "";
		
		if(result > 0) {
			resultStr = "NNNY";
		}else {
			resultStr = "NNNN";
		}
		
		return resultStr;
		
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
	
	
	
	
	
	
	// ###################################################################
	
	
	
	//신고 게시글 페이지
	@GetMapping("/boardReportList.ad")
	public String boardReportList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		model.addAttribute("currentPage", currentPage);
		return "admin/boardReportList";
		
	}
	
	
	//신고글 목록 조회하기
	@ResponseBody
	@GetMapping("selectBoardReportList.ad")
	public  ResponseEntity<Map<String, Object>> selectBoardReportList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value="category", defaultValue="0")int category, Model model) {

		// 전체 게시글 개수(listCount) - selectListCount() 메소드 명
		int boardListCount = adminService.boardReportListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수(boardLimit)
		int boardLimit = 10;
		// 페이징 바 개수(pageLimit)
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(boardListCount, currentPage, pageLimit, boardLimit);

		// 페이징 처리된 게시글 목록 조회해서 boardListView에 보여주기
	    ArrayList<BoardReport> brList = adminService.selectBoardReportList(pi, category);

	    
	    // 데이터를 Map에 담아서 전송
	    Map<String, Object> resultMap = new HashMap<>();
	    
	    resultMap.put("brList", brList);
	    resultMap.put("pi", pi);

	    
	    // ResponseEntity로 감싸서 전송
	    return ResponseEntity.ok(resultMap);
		
	}
	
	
	
	
	//신고 취소, 게시글 삭제
	@ResponseBody
	@GetMapping("/boardReportStatus.ad")
	public String boardReportStatus(String chkBoardReportList, String status, Model model, HttpSession session) {
		
		System.out.println("status" + status);
		
		int statusNm = 0;
		
		if(status.equals("cancel")) {
			statusNm = 1;
		}
		
		
		String[] ckList = chkBoardReportList.split(",");
		
		ArrayList<Integer> brList = new ArrayList<>();
		
		for(int i = 0; i < ckList.length; i++) {
			brList.add(i, Integer.parseInt(ckList[i]));
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("status", statusNm);
		map.put("brList", brList);

		
		int result = adminService.boardReportStatus(map);
		
		String resultStr = "";
		
		if(result > 0) {
			resultStr = "NNNY";
		}else {
			resultStr = "NNNN";
		}
		
		return resultStr;
		
	}
	
	
	//신고 게시글 페이지
	@GetMapping("/replyReportList.ad")
	public String boardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		model.addAttribute("currentPage", currentPage);
		return "admin/replyReportList";
		
	}
	

	
	
}
