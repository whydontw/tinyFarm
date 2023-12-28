package com.kh.tinyfarm.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.diary.model.service.DiaryService;
import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.diary.model.vo.DiaryCategory;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.vo.Product;

@Controller
public class MypageController {

	//서비스 호출
	@Autowired
	private DiaryService diaryService;
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	private SimpleDateFormat f;

	//마이페이지
	@GetMapping("mypage.me")
	public String mypage() {
		return "mypage/mypage";
	}

	//회원정보 수정페이지
	@GetMapping("update.me")
	public String updateUser(HttpSession session,Model model) {
		
		//탈퇴시에 보여줄 요소들
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		int userNo = loginUser.getUserNo(); //영농일지 파트에서 계속 userNo로 진행해서 따로 했습니다.
		String enrollDate = loginUser.getEnrollDate(); //가입날짜 
		
		Date today = new Date();
		f= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date enroll = f.parse(enrollDate);
			
			long difference = today.getTime() - enroll.getTime();
			
			long differenceDate = difference / (24 * 60 * 60 * 1000);
			
			int boardCount = diaryService.boardListCount(userId); //게시글 수
			int replyCount = diaryService.replyListCount(userId); //댓글 수
			int diaryCount = diaryService.diaryListCount(userNo);
			model.addAttribute("boardCount", boardCount);
			model.addAttribute("replyCount", replyCount);
			model.addAttribute("diaryCount", diaryCount);
			model.addAttribute("date", differenceDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "mypage/updateInfo";
	}

	//회원정보 수정하기
	@PostMapping("update.me")
	public ModelAndView updateMember(Member m
									,MultipartFile reUpfile
									,HttpSession session
									,ModelAndView mv) {

		Member preUser = (Member) session.getAttribute("loginUser"); // 기존 사진정보를 위해 회원정보 session에서 가져오기
		//새로운 프로필 사진 첨부시
		if (!reUpfile.getOriginalFilename().equals("")) {

			//DB에 정보 덮어쓰기
			String changeName = saveFile(reUpfile, session);
			//기존 파일 존재하면 지워주기
			if (preUser.getOriginName() != null) {
				File f = new File(session.getServletContext().getRealPath(preUser.getChangeName()));
				f.delete();
			}
			//Member에 새 프로필사진 담기
			m.setOriginName(reUpfile.getOriginalFilename());
			m.setChangeName("resources/uploadFiles/"+changeName);
		}

		//새로 입력한 정보 변경해주기(DB)
		int result = diaryService.updateMember(m);

		//마이페이지 재요청
		if (result > 0) {
			Member loginUser = memberService.loginMember(m); // 기존에 회원정보 조회메소드 활용
			session.setAttribute("loginUser", loginUser);// 조회한 데이터 세션에 갱신
			session.setAttribute("alertMsg", "회원정보 수정이 완료되었습니다.");
			mv.setViewName("redirect:/mypage.me"); // 마이페이지 재요청
		} else {
			mv.addObject("errorMsg", "회원정보수정실패").setViewName("common/error");
		}

		return mv;
	}

	//비밀번호 변경
	@ResponseBody
	@PostMapping("updatePwd.me")
	public String updatePwd(String curPwd
							,String updatePwd
							,HttpSession session) {
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		String loginUserPwd = loginUser.getUserPwd(); // 비밀번호 추출
		
		//현재비밀번호 일치 테스트
		if (bcryptPasswordEncoder.matches(curPwd, loginUserPwd)) { //일치하면
			//암호화 작업 - 스크립트로 조건처리 하고 넘어왔으니 바로 암호화
			String encPwd = bcryptPasswordEncoder.encode(updatePwd);
			
			loginUser.setUserPwd(encPwd);
			
			int result = diaryService.updatePwd(loginUser);
			
			if (result > 0) { //성공
				Member updateUser = memberService.loginMember(loginUser); //기존 회원정보 조회메소드 활용
				session.setAttribute("loginUser", updateUser);
				return "YYYYY";
			} else { //실패
				return "NNNNN";
			}
		} else { //비밀번호 일치하지 않음
			//YY두개(리턴값 3개로 나누려다 보니 이렇게 됐습니다 YY의 의미는 없습니다 ..)
			return "NNNYY";
		}

	}

	//회원탈퇴
	@GetMapping("delete.me")
	public String deleteMember(String userPwd
								,HttpSession session
								,Model model) {

		Member loginUser = ((Member) session.getAttribute("loginUser")); //세션에서 로그인 정보 추출

		String userId = loginUser.getUserId(); //회원 아이디 추출
		String loginUserPwd = loginUser.getUserPwd(); //회원 비밀번호 추출

		if (bcryptPasswordEncoder.matches(userPwd, loginUserPwd)) { //비밀번호 일치 확인

			int result = diaryService.deleteMember(userId);

			if (result > 0) { //탈퇴 성공

				session.setAttribute("alertMsg", "그동안 저희 사이트를 이용해주셔서 감사합니다.");
				//세션에 있는 로그인 정보 지우기
				session.removeAttribute("loginUser");
				return "redirect:/"; //메인으로 위임

			} else { //탈퇴 실패
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage"; //에러페이지로 이동
			}

		} else {//비밀번호 잘못입력

			session.setAttribute("alertMsg", "비밀번호를 잘못입력하셨습니다.");
			return "redirect:mypage.me"; //마이페이지 유지
		}

	}

	//파일명 수정 모듈
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	//활동내역
	@GetMapping("active.me")
	public String myboard() {
		return "mypage/myActivePage";
	}

	//내가 쓴 게시글 목록 조회
	@ResponseBody
	@PostMapping(value = "boardPage.me", produces = "application/json; charset=UTF-8")
	public Map<String, Object> myBoardList(String userId, Board b,
			@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.boardListCount(userId);
		//한 페이지에서 보여줘야하는 게시글 개수 (boardLimit)X
		int boardLimit = 5;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;

		//페이징 처리된 게시글 목록 조회하기
		PageInfo bPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> bList = diaryService.myBoardList(userId, bPi);
		
		//map에 페이지 정보와 글정보 담기
		result.put("bList", bList);
		result.put("bPi", bPi);

		return result;
	}

	//내가 쓴 댓글 조회
	@ResponseBody
	@PostMapping(value = "replyPage.me", produces = "application/json; charset=UTF-8")
	public Map<String, Object> myreplyList(String userId, BoardReply r,
			@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.replyListCount(userId);
		//한 페이지에서 보여줘야하는 게시글 개수 (replyLimit)
		int boardLimit = 5;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;

		//페이징 처리된 게시글 목록 조회하기
		PageInfo rPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<BoardReply> rList = diaryService.myReplyList(userId, rPi);

		//map에 페이지 정보와 글정보 담기
		result.put("rList", rList);
		result.put("rPi", rPi);

		return result;
	}

	//팔로잉 목록 조회
	@ResponseBody
	@PostMapping(value = "followingPage.me", produces = "application/json; charset=UTF-8")
	public Map<String, Object> followingList(String userId, Follow f,
			@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.fwingListCount(userId);
		//한 페이지에서 보여줘야하는 게시글 개수
		int boardLimit = 5;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;

		//페이징 처리된 게시글 목록 조회하기
		PageInfo fiPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Follow> fiList = diaryService.myFollowingList(userId, fiPi);
		//map에 페이지 정보와 글정보 담기
		result.put("fiList", fiList);
		result.put("fiPi", fiPi);

		return result;
	}

	//팔로워 목록 조회
	@ResponseBody
	@PostMapping(value = "followerPage.me", produces = "application/json; charset=UTF-8")
	public Map<String, Object> followerList(String userId, Follow f,
			@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.fwerListCount(userId);
		//한 페이지에서 보여줘야하는 게시글 개수
		int boardLimit = 5;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;

		//페이징 처리된 게시글 목록 조회하기
		PageInfo fwPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Member> fwList = diaryService.myFollowerList(userId, fwPi);
		//map에 페이지 정보와 글정보 담기
		result.put("fwList", fwList);
		result.put("fwPi", fwPi);

		return result;
	}
	
	//팔로잉&팔로워 클릭시 모달창 정보
	@ResponseBody
	@PostMapping(value = "getFollowInfo.me", produces = "application/json; charset=UTF-8")
	public Member getFollowInfo(String followingId) {
		Member m = diaryService.selectFollowInfo(followingId); //팔로우 한 유저 아이디 정보 가져오기
		return m;
	}
	
	//언팔로우
	@GetMapping("unfollow.me")
	public String unfollowUser(String followId,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		Follow following = new Follow(userId, followId);
		
		int result = diaryService.unfollowUser(following);
		
		if(result>0) {
			session.setAttribute("alertMsg", "팔로우 취소가 완료되었습니다.");
			return "redirect:/active.me";
		}else {
			session.setAttribute("alertMsg", "다시 시도해주세요.");
			return "redirect:/active.me";
		}
	}
		
	
	//영농일지 달력페이지+회원등급 조정
	@GetMapping("diary.me")
	public String diary() {
		return "mypage/myDiaryPage";
	}
	
	//달력에 이미지 띄우기
	@ResponseBody
	@GetMapping("calendarImg.do")
	public ArrayList<Diary> calendarImgLoad(Diary d, int userNo) {
		// 회원이 작성한 영농일지 리스트 뽑기
		ArrayList<Diary> dList = diaryService.selectDiaryList(userNo);
		return dList;
	}

	//일지 유무 확인
	@ResponseBody
	@PostMapping("info.di")
	public String existDiary(Diary d, Date date, int userNo) {
		f = new SimpleDateFormat("YYYY/MM/dd");

		String selectDate = f.format(date);
		d.setDiaryWriter(userNo);
		d.setSelectDate(selectDate);

		int count = diaryService.existDiary(d);

		if (count == 1) {//일지가 있으면
			return "YY";
		} else {//없으면
			return "NN";
		}
	}

	//일지 작성페이지
	@GetMapping("insert.di")
	public String insertDiaryPage() {
		return "mypage/insertDiary";
	}
	
	//일지 작성 + 회원등급 조정
	@PostMapping("insert.di")
	public String insertDiary(String selectDate
			,Diary d
			,HttpSession session) {
		//등업용 회원정보 미리 꺼내기
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();

		// diary 객체에 날짜 담기
		d.setSelectDate(selectDate);
		int result = diaryService.insertDiary(d);
		
		if (result>0) {
			int diaryCount = diaryService.diaryListCount(userNo);
			//씨앗, 새싹(7개), 잎새(14개), 열매(30개)
			//글 작성 후 개수 바로 카운트
			if(diaryCount==7 || diaryCount==14 || diaryCount==30) {
				Member changeGrade = updateGrade(session);
				session.setAttribute("loginUser", changeGrade);
				session.setAttribute("alertMsg", "축하합니다!회원등급이 \\n"+m.getGrade()+"에서 "
												+changeGrade.getGrade()+"로 변경되었습니다!\\n"
												+ "앞으로도 열심히 일지를 작성해주세요!");
			}else {
				session.setAttribute("alertMsg", "일지 작성 성공");
			}
			return "redirect:/diary.me";
		} else {
			session.setAttribute("alertMsg", "게시글 작성 실패");
			return "common/error";
		}
		
	}	
	
	//회원 등급
	public Member updateGrade(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		Member changeGrade = null;
		int diaryCount = diaryService.diaryListCount(userNo);
		int grade = 0;
		//등급 올라가는 경우
		if(diaryCount==7) {
			grade = diaryService.gradeShoot(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m); // 기존 회원정보 조회메소드 활용
			}
		}else if(diaryCount==14){
			grade = diaryService.gradeLeaf(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m);
			}
		}else if(diaryCount==30){
			grade = diaryService.gradeFruit(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m); 
			}
		}
		
		//등급이 내려가는 경우
		if(diaryCount==6) {
			grade = diaryService.gradeSeed(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m);
			}
		}else if(diaryCount==13) {
			grade = diaryService.gradeShoot(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m);
			}
		}else if(diaryCount==29){
			grade = diaryService.gradeLeaf(userNo);
			if(grade>0) {
				changeGrade = memberService.loginMember(m);
			}
		}
		
		
		return changeGrade;
	}

	//일지 수정페이지
	@GetMapping("updatePage.di")
	public String updateDiaryPage(int diaryNo, Model md) {

		// 해당 번호의 일지 불러오기
		Diary d = diaryService.viewDiary(diaryNo);
		// date형식이 아닌 문자열이여서 뒷부분 잘라주기 (00:00:00)
		String cutDate = d.getSelectDate().substring(0, 10);
		// -부분 / 로 바꿔주기
		String date = cutDate.replace("-", "/");
		// d에 담아주고 페이지 넘기기
		d.setSelectDate(date);

		md.addAttribute("d", d);

		return "mypage/updateDiary";
	}

	//일지 수정
	@PostMapping("update.di")
	public ModelAndView updateDiary(Diary d,HttpSession session, ModelAndView mv) {
		
		int result = diaryService.updateDiary(d);
		//뷰페이지에 카테고리 이름으로 보여주기 위한 작업
		String cNo = d.getCategoryNo();
		if (result > 0) {
			session.setAttribute("alertMsg", "일지 수정이 완료되었습니다.");
			DiaryCategory dc = diaryService.selectCategory(cNo);
			d.setCategoryNo(dc.getDiarycateName());
			mv.addObject("d", d);
			mv.setViewName("mypage/diaryViewPage");
		} else {
			session.setAttribute("alertMsg", "일지 수정이 실패했습니다.");
			//에러페이지 넘기기
			mv.setViewName("common/error");
		}
		return mv;

	}

	//일지 뷰페이지(ajax로 정보만 불러오기)
	@ResponseBody
	@PostMapping("viewSet.di")
	public Diary selectDiary(Diary d, int userNo, Date date) {

		f = new SimpleDateFormat("YYYY/MM/dd");
		String selectDate = f.format(date);

		// 뽑고자 하는 일지 Diary에 담아주기
		d.setDiaryWriter(userNo);
		d.setSelectDate(selectDate);

		Diary diaryOne = diaryService.selectDiary(d);

		return diaryOne;
	}

	//영농일지 뷰페이지로 넘기기
	@PostMapping("view.di")
	public String viewDiary(Integer diaryNo, Date selectDate, Model model) {

		Diary d = diaryService.viewDiary(diaryNo);

		// selectDate 형식 DB처럼 바꿔주기 (yyyy-mm-dd- hh:mm:ss 에서 변경)
		f = new SimpleDateFormat("YYYY/MM/dd");
		String date = f.format(selectDate);

		String cNo = d.getCategoryNo();
		DiaryCategory dc = diaryService.selectCategory(cNo);

		// d에 바꾼 값 넣어주기
		d.setSelectDate(date); // 날짜형식변경
		d.setCategoryNo(dc.getDiarycateName()); // 카테고리 이름추출

		model.addAttribute("d", d);

		return "mypage/diaryViewPage";
	}

	//영농일지 삭제
	@GetMapping("delete.di")
	public String deleteDiary(int diaryNo, HttpSession session) {

		int result = diaryService.deleteDiary(diaryNo); //삭제처리
		//등급하락 준비물
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		if (result > 0) {
			//삭제 후 일지개수 6,13,29일때 등급 하락
			int diaryCount = diaryService.diaryListCount(userNo);
			
			if(diaryCount==6 || diaryCount==13 || diaryCount==29) {
				Member changeGrade = updateGrade(session);
				session.setAttribute("loginUser", changeGrade);
			}
			session.setAttribute("alertMsg", "일지가 삭제되었습니다.");
			return "mypage/myDiaryPage";
		} else {
			session.setAttribute("alertMsg", "삭제 실패");
			return "redirect:/diaryViewPage";
		}
	}

	
	//거래목록
	@GetMapping("trade.me")
	public String tradeList() {
		return "mypage/myTradePage";
	}
	
	//구매내역
	@ResponseBody
	@PostMapping(value="orderPage.me",produces="application/json; charset=UTF-8")
	public Map<String, Object> orderPage(int userNo
							,@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.orderListCount(userNo);
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 10;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;
		
		//페이징 처리된 게시글 목록 조회하기
		PageInfo oPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Product> oList = diaryService.myOrderList(userNo, oPi);
		
		//map에 페이지 정보와 글정보 담기
		result.put("oList", oList);
		result.put("oPi", oPi);
		
		return result;
	}

	//구매내역
	@ResponseBody
	@PostMapping(value="sellPage.me",produces="application/json; charset=UTF-8")
	public Map<String, Object> sellPage(int userNo
							,@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.sellListCount(userNo);
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 10;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;
		
		//페이징 처리된 게시글 목록 조회하기
		PageInfo sPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Product> sList = diaryService.mySellrList(userNo, sPi);
		
		//map에 페이지 정보와 글정보 담기
		result.put("sList", sList);
		result.put("sPi", sPi);
		
		return result;
	}
/*	
	//구매 검색 내역
	@ResponseBody
	@PostMapping(value="searchOrder.me",produces="application/json; charset=UTF-8")
	public Map<String, Object> sellPage(int userNo,Date searchDate, Payment pm
										,@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		
		pm.setUserNo(userNo);
		pm.setOrderDate(searchDate);
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.searchDateOrderCount(pm);
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 10;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;
		
		//페이징 처리된 게시글 목록 조회하기
		PageInfo oPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Product> oList = diaryService.searchOrderList(pm);
				
		//map에 페이지 정보와 글정보 담기
		result.put("oList", oList);
		result.put("oPi", oPi);
				
		return result;
	
	}
	
	//판매 검색 내역
	@ResponseBody
	@PostMapping(value="searchSell.me",produces="application/json; charset=UTF-8")
	public Map<String, Object> sellPage(int userNo,Date searchDate, Payment pm
										,@RequestParam(value = "currentPage", defaultValue = "1") String cp) {
		
		pm.setUserNo(userNo);
		pm.setOrderDate(searchDate);
		//페이징처리 된 게시글 조회하기
		Map<String, Object> result = new HashMap<String, Object>();
		//현재 페이지 정보 (currentPage)
		int currentPage = Integer.parseInt(cp);
		//전체 게시글 개수 (listCount)
		int listCount = diaryService.searchDateSellCount(pm);
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 10;
		//페이징바 개수 (pageLimit)
		int pageLimit = 5;
		
		//페이징 처리된 게시글 목록 조회하기
		PageInfo sPi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Product> sList = diaryService.searchOrderList(pm);
				
		//map에 페이지 정보와 글정보 담기
		result.put("sList", sList);
		result.put("sPi", sPi);
				
		return result;
		
	}
	*/
}
