package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.product.model.dao.ProductDao;
import com.kh.tinyfarm.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품 전체 개수
	@Override
	public int listCount() {
		
		return productDao.listCount(sqlSession);
	}


	//상품 리스트
	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		
		return productDao.selectList(sqlSession, pi);
	}

}
