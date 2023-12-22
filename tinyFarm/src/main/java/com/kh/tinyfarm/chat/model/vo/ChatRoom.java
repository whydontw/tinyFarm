package com.kh.tinyfarm.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoom {
	private int chatRoomNo;//	CHAT_ROOM_NO 채팅방 번호
	private String firstMemId;//	FIRST_MEM_ID 최초 송신자
	private String receiveMemId;//	RECEIVE_MEM_ID 수신자
	

}
