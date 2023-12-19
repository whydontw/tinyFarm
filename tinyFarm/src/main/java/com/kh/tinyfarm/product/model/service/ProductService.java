package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.product.model.vo.Category;
import com.kh.tinyfarm.product.model.vo.Product;

public interface ProductService {

	//상품 수 조회
	int listCount();

	//상품 리스트
	ArrayList<Product> selectList(PageInfo pi);

	//상품 조회수 증가
	int increaseCount(int pno);

	//상품 조회
	Product selectProduct(int pno);
	
	//카테고리 조회
	ArrayList<Category> selectCategoryList();

	//상품등록
	int insertProduct(Product p);
	int insertAttachment(Attachment a);



}
