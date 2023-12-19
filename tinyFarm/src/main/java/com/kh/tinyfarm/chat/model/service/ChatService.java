package com.kh.tinyfarm.chat.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.chat.model.vo.ChatMessage;
import com.kh.tinyfarm.chat.model.vo.ChatRoom;
import com.kh.tinyfarm.member.model.vo.Member;

public interface ChatService {
	
	ArrayList<Member> findUser(String search);

	int insertChatRoom(ChatRoom cr);

	ArrayList<ChatRoom> selectChatList(String userId);
	
	int checkExistChatRoom(ChatRoom cr);

	int insertChatMsg(ChatMessage chatMessage);
	
	ArrayList<ChatMessage> selectChatMsg(int chatRoomNo);

	ArrayList<Member> searchUser(String search);

	int deleteRoom(int chatRoomNo);
}
