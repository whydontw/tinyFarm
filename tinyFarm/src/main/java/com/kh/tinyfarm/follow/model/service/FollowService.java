package com.kh.tinyfarm.follow.model.service;

import com.kh.tinyfarm.follow.model.vo.Follow;

public interface FollowService {

	
	int insertFollow(Follow fw);

	int deleteFollow(Follow fw);

	int selectFollow(Follow fw);

	

}
