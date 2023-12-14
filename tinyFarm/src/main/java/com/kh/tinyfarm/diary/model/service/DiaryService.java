package com.kh.tinyfarm.diary.model.service;

import com.kh.tinyfarm.member.model.vo.Member;

public interface DiaryService {

	int updateMember(Member m);

	int updatePwd(Member m);

	int deleteMember(String userId);


}
