package com.kh.tinyfarm.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.product.model.service.ProductService;
import com.kh.tinyfarm.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productservice;
	
	@RequestMapping("plist.bo")
	public String selectProductList(@RequestParam(value="currentPage",defaultValue="1") int currentPage, Model model) {
		
		int maxPage; // 가장 마지막 페이징바
		int startPage; // 페이징바 시작수
		int endPage; //페이징바 끝수
		
		//페이징 처리된 전체 상품 조회
		int listCount = productservice.listCount();
		
		int productLimit = 9;
		int pageLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, productLimit);
		
		ArrayList <Product> list = productservice.selectList(pi);
	
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "product/ProductListView";
	}
	
	
	@GetMapping("pdetail.bo")
	public String selectProduct(int pno, Model model) {
		
		int result = productservice.increaseCount(pno);
		
		if(result>0) {
			Product p = productservice.selectProduct(pno);
			
			model.addAttribute("p",p);
			
		}else {
			return "common/errorPage";
		}

			return "product/ProductDetailView";
	}
	
	@GetMapping("pinsert.bo")
	public String productEnrollForm(){
		
		return "product/ProductEnrollForm";
	}
	
	
	@PostMapping("pinsert.bo")
	public String insertProduct(Product p, Attachment a, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile,session);
			
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName("/resources/uploadFiles/"+changeName);
		}
		
		int result = productservice.insertProduct(p,a);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:plist.bo";
		}else {
			session.setAttribute("alertMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
		
		//파일명 수정 모듈
		public String saveFile(MultipartFile upfile
							  ,HttpSession session) {
			//파일명 수정하기 
			//1. 원본파일명 추출 
			String originName = upfile.getOriginalFilename(); 
			
			//2. 시간 추출하기 (년월일시분초) - util.Date 
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//3. 뒤에 붙일 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000+10000);
			
			//4.원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을찾고 그 뒤로 잘라내기 .txt 
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기(업로드이름)
			String changeName = currentTime+ranNum+ext;
			
			//6.저장시킬 실질적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			//7. 경로와 수정파일명으로 파일 업로드 하기(경로+파일명) 파일객체를 생성한뒤 해당 파일 객체를 업로드시킨다.
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return changeName;
		}
		
		
		
	
	
	
	
	
	
	

}
