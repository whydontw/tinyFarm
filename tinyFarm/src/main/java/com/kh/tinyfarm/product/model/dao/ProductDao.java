package com.kh.tinyfarm.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.product.model.vo.Product;

@Repository //퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리함
public class ProductDao {

	//상품 전체 개수
	public int listCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productMapper.listCount");
	}

	//상품 리스트
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList");
	}

}
