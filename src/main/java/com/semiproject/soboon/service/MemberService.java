package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public int idCheck(String userid);
	public int nicknameCheck(String nickname);
	public int emailCheck(String email);
	public void telCheck(String tel, String ckNum);
	public String searchid_tel(String username, String tel);
	public String searchid_email(String username, String email);
	public MemberVO loginCheck(MemberVO vo);
	public int totalRecord(PagingVO pVO);
	public List<MemberVO> memberList(PagingVO pVO);
	public int getMembercnt();
}

