package com.kh.tinyfarm.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookRecomController {
 
	//책 추천 메인페이지
	@RequestMapping("bookMain.re")
	   public String bookMain() {
	       return "book/bookMain";  
	   }
}
