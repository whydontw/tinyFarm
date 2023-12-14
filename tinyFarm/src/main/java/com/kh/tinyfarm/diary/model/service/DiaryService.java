package com.kh.tinyfarm.diary.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.board.vo.Board;
import com.kh.tinyfarm.board.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;



public interface DiaryService {

	int updateMember(Member m);

	int updatePwd(Member m);

	int deleteMember(String userId);

	int boardListCount(String userId);

	int replyListCount(String userId);
	
	int fwingListCount(String userId);

	int fwerListCount(String userId);

	ArrayList<Board> MyBoardList(PageInfo bPi);

	ArrayList<BoardReply> MyReplyList(PageInfo rPi);

	ArrayList<Follow> MyFollowingList(PageInfo fiPi);

	ArrayList<Follow> MyFollowerList(PageInfo fwPi);



}
