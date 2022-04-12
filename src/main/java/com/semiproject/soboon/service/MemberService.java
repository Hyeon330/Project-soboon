package com.semiproject.soboon.service;

import com.semiproject.soboon.vo.MemberVO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public int idCheck(String userid);
	public int nicknameCheck(String nickname);
	public MemberVO loginCheck(MemberVO vo);
}