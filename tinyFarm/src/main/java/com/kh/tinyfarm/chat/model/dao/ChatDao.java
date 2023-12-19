package com.kh.tinyfarm.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

@Repository
public class ChatDao {

	public ArrayList<Member> findUser(SqlSessionTemplate sqlSession,String search) {
		System.out.println(search);
		return (ArrayList)sqlSession.selectList("chatMapper.selectFindUserList",search);
	}

	public int insertChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		System.out.println(cr);
		return sqlSession.insert("chatMapper.insertChatRoom", cr);
	}

	public ArrayList<ChatRoom> selectChatList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList",userId);
	}

	public int checkExistChatRoom(SqlSessionTemplate sqlSession, ChatRoom cr) {
		
		return sqlSession.selectOne("chatMapper.checkExistChatRoom", cr);
	}
	
	//채팅 메세지 테이블에 넣기
	public int insertChatMsg(SqlSessionTemplate sqlSession, ChatMessage chatMessage) {
		
		return sqlSession.insert("chatMapper.insertChatMsg", chatMessage);
	}
	
	//방 번호에 해당하는 채팅 메세지 가져오기
	public ArrayList<ChatMessage> selectChatMsg(SqlSessionTemplate sqlSession,int chatRoomNo) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMsg",chatRoomNo);
	}
	
	//채팅 대상 유저 검색
	public ArrayList<Member> searchUser(SqlSessionTemplate sqlSession,String search) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectSearchUserList",search);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int chatRoomNo) {
		System.out.println("안녕22 : "+chatRoomNo);
		int result = sqlSession.delete("chatMapper.deleteRoom", chatRoomNo);
		System.out.println("result : "+result);
		return result;
	}
	
	

}
