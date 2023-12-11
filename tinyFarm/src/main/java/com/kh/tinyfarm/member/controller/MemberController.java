package com.kh.tinyfarm.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;
    
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
    
    @RequestMapping("/loginGo.me")
    public String loginPage() {
        return "member/memberLoginForm";
    }
 
    
    
    @RequestMapping("/login.me")
    public ModelAndView loginProcess(Member m, ModelAndView mv, HttpSession session) {

    
    	Member loginUser = memberService.loginMember(m);
    
    	//사용자에게 입력받은 비밀번호 : m.getUserPwd() / 데이터베이스에서 조회해온 암호문은 : loginUser.getUserPwd()
    	if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
    		session.setAttribute("loginUser", loginUser);
    		System.out.println("성공");
    		mv.setViewName("redirect:/");
    		
   		} else {
   			mv.addObject("errorMsg", "로그인 실패");
   			
   			mv.setViewName("common/errorPage");
   		}
    	return mv;
    } 
    
    //로그아웃
    @RequestMapping("logout.me")
    public String logoutMember(HttpSession session) {
    
    	//세션에 담겨있는 loginUser정보 지우기
    	session.removeAttribute("loginUser");
    	
    	return "redirect:/";
    }
    
    //회원가입창
    @GetMapping("/join.me")
    public String joinPage() {
        return "member/memberEnrollForm";
    }
    
    //회원등록
    @RequestMapping("insert.me")
    public String insertMember(Member m 
    						 , Model model
    						 , HttpSession session) {
    	//암호화 작업
    	String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
    	
    	m.setUserPwd(encPwd);
   
    	int result = memberService.insertMember(m);
    	
    	if(result>0) { //성공
    		session.setAttribute("alertMsg", "회원가입성공");
    		return "redirect:/";
    	} else { //실패
    		model.addAttribute("errorMsg", "회원가입 실패");
    		return "common/errorPage"; 
    	}
    }  
    
    //프로필사진
    @PostMapping("insert.me")
	public String insertMember(Member m
						   ,MultipartFile upfile
						   ,HttpSession session) {
    	
   
    	if(!upfile.getOriginalFilename().equals("")) {
    		
    		String changeName = saveFile(upfile,session);
    		
    		m.setOriginName(upfile.getOriginalFilename());
			m.setChangeName("resources/uploadFiles/"+changeName);
    	}
		int result = memberService.insertMember(m);
				
				if(result>0) {
					session.setAttribute("alertMsg", "회원가입 성공");
					return "redirect:/";
				}else {
					session.setAttribute("alertMsg", "회원 등록 실패");
					return "common/errorPage";
			}
    }
    
    
  //파일명 수정 모듈
  	public String saveFile(MultipartFile upfile
  						  ,HttpSession session) {
  		String originName = upfile.getOriginalFilename(); 
  		
  		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
  		
  		int ranNum = (int)(Math.random()*90000+10000);
  		
  		String ext = originName.substring(originName.lastIndexOf("."));
  		
  		String changeName = currentTime+ranNum+ext;
  		
  		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
  		
  		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
  		
  		return changeName;
  	}
  	
  	
	@ResponseBody
	@RequestMapping("checkId.me")
	public String checkId(String checkId) {
		
		//사용자가 입력한 아이디가 데이터베이스에 존재하는지 중복체크하기 
		int count = memberService.checkId(checkId);
		
		if(count>0) { //사용하면 안된다(중복)
			return "NNNNN";
		}else { //사용 가능
			return "NNNNY";
		}
		
	}
	
}