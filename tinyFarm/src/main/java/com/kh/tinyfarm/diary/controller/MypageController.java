package com.kh.tinyfarm.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tinyfarm.diary.model.service.DiaryService;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;



@Controller
public class MypageController {

	// 서비스 호출
	@Autowired
	private DiaryService diaryService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;

//	board 나오면 진행
//	@Autowired
//	private BoardService boardService;

	// 각 페이지 위임 모음
	// 마이페이지
	@GetMapping("mypage.me")
	public String mypage() {
		return "mypage/mypage";
	}

	// 마이페이지
	@GetMapping("update.me")
	public String updateUser() {
		return "mypage/updatePage";
	}

	// 영농일지
	@GetMapping("diary.me")
	public String diary() {
		return "mypage/myDiaryPage";
	}

	// 일지작성페이지
	@GetMapping("insert.di")
	public String insertDiary() {
		return "mypage/insertDiary";
	}

	// 거래목록
	@GetMapping("trade.me")
	public String tradeList() {
		return "mypage/myTradePage";
	}

	// 활동내역
	@GetMapping("active.me")
	public String myboard() {
		
		return "mypage/myActivePage";
	}

	// 회원정보 수정하기
	@PostMapping("update.me")
	public ModelAndView updateMember(Member m
									,MultipartFile reUpfile
									,HttpSession session
									,ModelAndView mv) {
		System.out.println(m);
		System.out.println(reUpfile);
		
		// 새로운 프로필 사진 첨부시
		if (!reUpfile.getOriginalFilename().equals("")) {

			// DB에 정보 덮어쓰기
			String changeName = saveFile(reUpfile, session);

			// 기존 파일 존재하면 지어주기
			if (!m.getOriginName().equals("")) {
				File f = new File(session.getServletContext().getRealPath(m.getChangeName()));
				f.delete();
			}

			// Member에 새 프로필사진 담기
			m.setOriginName(reUpfile.getOriginalFilename());
			m.setChangeName(changeName);
		}

		// 새로 입력한 정보 변경해주기(DB)
		int result = diaryService.updateMember(m);

		// 마이페이지 재요청
		mv.setViewName("redirect:mypage.me");
		if (result > 0) {
			Member loginUser = memberService.loginMember(m); // 기존에 회원정보 조회메소드 활용
			session.setAttribute("loginUser", loginUser);// 조회한 데이터 세션에 갱신
			session.setAttribute("alertMsg", "회원정보 수정이 완료되었습니다.");
			mv.setViewName("redirect:mypage.me"); // 마이페이지 재요청
		} else {
			mv.addObject("errorMsg", "회원정보수정실패").setViewName("common/error");
		}

		return mv;
	}

	// 비밀번호 변경
	@ResponseBody
	@PostMapping("updatePwd.me")
	public String updatePWd(Member m
							,String currentPwd
							,String updatePwd
							,Model model
							,HttpSession session) {
		
		Member loginUser = ((Member) session.getAttribute("loginUser")); 
		String loginUserPwd = loginUser.getUserPwd(); // 비밀번호 추출

		
		if (!bcryptPasswordEncoder.matches(currentPwd, loginUserPwd)) {//현재비밀번호 일치 테스트
			return "NNNYY"; 
		}else { //비밀번호 불일치
			// 암호화 작업 - 스크립트로 조건처리 하고 넘어왔으니 바로 암호화
			String encPwd = bcryptPasswordEncoder.encode(updatePwd);
			
			m.setUserPwd(encPwd);
			
			int result = diaryService.updatePwd(m);
			
			if (result>0) { // 성공
				return "YYYYY";
			} else { // 실패
				return "NNNNN";
			}
		}
			
	}

	// 회원탈퇴
	@PostMapping("delete.me")
	public String deleteMember(String userPwd
								,HttpSession session
								,Model model) {

		Member loginUser = ((Member) session.getAttribute("loginUser")); // 세션에서 로그인 정보 추출

		String userId = loginUser.getUserId(); // 아이디 추출
		String loginUserPwd = loginUser.getUserPwd(); // 비밀번호 추출

		if (bcryptPasswordEncoder.matches(userPwd, loginUserPwd)) { // 비밀번호 일치

			int result = diaryService.deleteMember(userId);

			if (result > 0) { // 탈퇴 성공

				session.setAttribute("alertMsg", "그동안 저희 사이트를 이용해주셔서 감사합니다.");
				// 세션에 있는 로그인 정보 지우기
				session.removeAttribute("loginUser");
				return "redirect:/"; // 메인으로 위임

			} else { // 탈퇴 실패
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage"; // 에러페이지로 이동
			}

		} else {// 비밀번호 잘못입력

			session.setAttribute("alertMsg", "비밀번호를 잘못입력하셨습니다.");
			return "redirect:mypage.me"; // 마이페이지 유지
		}

	}

	// 파일명 수정 모듈
	public String saveFile(MultipartFile upfile
							,HttpSession session) {
		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

}
