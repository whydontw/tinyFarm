package com.kh.tinyfarm.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.Book;

@Repository 
public class BookDao {

	//회원가입
		public int insertBook(SqlSessionTemplate sqlSession, Book b) {
			return sqlSession.insert("bookMapper.insertBook", b);
		}
}
