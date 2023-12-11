package com.kh.tinyfarm.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
		//리스트 이어서 (포토 mapper부터)
		
		return "product/ProductListView";
	}
	
	

}
