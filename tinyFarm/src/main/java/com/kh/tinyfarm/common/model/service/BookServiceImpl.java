package com.kh.tinyfarm.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.dao.BookDao;
import com.kh.tinyfarm.common.model.vo.Book;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;
	
	 @Autowired
	 private SqlSessionTemplate sqlSession;
	
	 // 생성자 추가
    public BookServiceImpl() {
        System.out.println("MemberServiceImpl 생성자 호출");
    }

	@Override
	public int insertBook(Book b) {
		return bookDao.insertBook(sqlSession, b);
	}
}
