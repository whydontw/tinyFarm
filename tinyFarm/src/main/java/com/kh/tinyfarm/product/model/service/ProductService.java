package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.product.model.vo.Product;

public interface ProductService {

	//상품 수 조회
	int listCount();

	//상품 리스트
	ArrayList<Product> selectList(PageInfo pi);

}
