package com.semiproject.soboon.service;



import com.semiproject.soboon.vo.MemberVO;

public interface EditService {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
}
