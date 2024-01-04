package com.kh.tinyfarm.follow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tinyfarm.follow.model.service.FollowService;
import com.kh.tinyfarm.follow.model.vo.Follow;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@RequestMapping("insertFollow.fw")
	public String insertFollow(int boardNo,Follow fw) {
		System.out.println("fw :"+fw);
	
		int result =followService.insertFollow(fw);
		System.out.println(result);
		
		if(result>0) {	
		
			return "redirect:detail.bo?boardNo="+boardNo;
		}else {
		
			return "common/errorPage";
		}
	}
	
	@RequestMapping("deleteFollow.fw")
	public String deleteFollow(int boardNo,Follow fw) {
		System.out.println("fw :"+fw);
	
		int result =followService.deleteFollow(fw);
		System.out.println(result);
		
		if(result>0) {	
		
			return "redirect:detail.bo?boardNo="+boardNo;
		}else {
			
			return "common/errorPage";
		}
	}
	
	
}
