package com.kh.tinyfarm.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping("chatList.ch")
	public String goChat() {
		return "chat/chatingList";
	}
}
