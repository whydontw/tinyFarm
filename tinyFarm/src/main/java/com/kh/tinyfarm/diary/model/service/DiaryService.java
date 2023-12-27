package com.kh.tinyfarm.diary.model.service;


import java.util.ArrayList;
import java.util.Date;

import com.kh.tinyfarm.board.model.vo.Board;
import com.kh.tinyfarm.board.model.vo.BoardReply;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.diary.model.vo.Diary;
import com.kh.tinyfarm.diary.model.vo.DiaryCategory;
import com.kh.tinyfarm.member.model.vo.Follow;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.vo.Product;

public interface DiaryService {

	int updateMember(Member m);

	int updatePwd(Member m);

	int deleteMember(String userId);

	int boardListCount(String userId);

	int replyListCount(String userId);

	int fwingListCount(String userId);

	int fwerListCount(String userId);

	ArrayList<Board> myBoardList(String userId, PageInfo bPi);

	ArrayList<BoardReply> myReplyList(String userId, PageInfo rPi);

	ArrayList<Follow> myFollowingList(String userId, PageInfo fiPi);

	ArrayList<Member> myFollowerList(String userId, PageInfo fwPi);

	int insertDiary(Diary d);

	ArrayList<Diary> selectDiaryList(int userNo);

	Diary selectDiary(Diary d);

	Diary viewDiary(int diaryNo);

	int existDiary(Diary d);

	int deleteDiary(int diaryNo);

	DiaryCategory selectCategory(String cNo);

	int updateDiary(Diary d);

	int diaryListCount(int userNo);
	
	int gradeSeed(int userNo);

	int gradeShoot(int userNo);

	int gradeLeaf(int userNo);

	int gradeFruit(int userNo);

	int orderListCount(int userNo);

	ArrayList<Product> myOrderList(int userNo, PageInfo oPi);

	int sellListCount(int userNo);

	ArrayList<Product> mySellrList(int userNo, PageInfo sPi);

	Member selectFollowInfo(String followingId);

	int unfollowUser(Follow following);

//	int searchDateOrderCount(Payment pm);
//	
//	ArrayList<Product> searchOrderList(Payment pm);
//	
//	int searchDateSellCount(Payment pm);
//	
//	ArrayList<Product> searchSellList(Payment pm);
}
