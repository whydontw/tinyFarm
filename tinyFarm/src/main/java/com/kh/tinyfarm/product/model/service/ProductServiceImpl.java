package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.product.model.dao.ProductDao;
import com.kh.tinyfarm.product.model.vo.Category;
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

	//상품 조회수 증가
	@Override
	public int increaseCount(int pno) {
		
		return productDao.increaseCount(sqlSession,pno);
	}

	//상품 조회
	@Override
	public Product selectProduct(int pno) {
		
		return productDao.selectProduct(sqlSession,pno);
	}
	
	//카테고리 조회
	@Override
	public ArrayList<Category> selectCategoryList() {
		
		return productDao.selectCategoryList(sqlSession);
	}

	//상품 등록
	@Override
	public int insertProduct(Product p) {
		
		return productDao.insertProduct(sqlSession,p);
	}


	@Override
	public int insertAttachment(Attachment a) {
		
		return productDao.insertAttachment(sqlSession,a);
	}




}
