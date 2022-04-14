package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MypagePagingVO;

public interface EditService {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
	public List<BoardVO> mypostList(String userid, MypagePagingVO pVO);
	public int mypostCount(String userid);
	public int myreplyCount(String userid);
}