package com.kh.tinyfarm.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.common.model.service.BookService;
import com.kh.tinyfarm.common.model.vo.Book;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;

@Controller
public class BookRecomController {
 
	@Autowired
	private BookService bookService;

	//책 추천 메인페이지
	@RequestMapping("bookMain.re")
	   public String bookMain() {
	       return "book/bookMain";  
	   }
	
	//책 등록 페이지
	@RequestMapping("bookInsert.re")
	public String bookInsert() {
		return "book/bookInsert";  
	}
	
	// 책등록 페이지
	@PostMapping("insert.re")
	public String insertBook(Book b, MultipartFile upfile, HttpSession session) {
		
//		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encPwd);

		if (!upfile.getOriginalFilename().equals("")) {
			String BookChangeName = saveFile(upfile, session);
			b.setBookOriginName(upfile.getOriginalFilename());
			b.setBookChangeName("resources/uploadFiles/book/" + BookChangeName);
		} else {
			// 파일이 업로드되지 않았거나 null인 경우
			b.setBookOriginName("bookImage.jpg");
			b.setBookChangeName("resources/uploadFiles/book/bookImage.jpg");
		}

		int result = bookService.insertBook(b);

		// 여기에 추가적인 로직이나 결과에 대한 처리를 추가할 수 있습니다.
		if (result > 0) {
			session.setAttribute("alertMsg", "도서 등록 완료");
			return "redirect:/bookMain.re";
		} else {
			session.setAttribute("alertMsg", "도서 등록 실패");
			return "common/errorPage";
		}
	}
	
	// 파일명 수정 모듈
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String BookOriginName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = BookOriginName.substring(BookOriginName.lastIndexOf("."));

		String BookChangeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/book/");

		try {
			upfile.transferTo(new File(savePath + BookChangeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return BookChangeName;
	}
}
