package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public MemberVO readMember(String userid);
	public int idCheck(String userid);
	public int nicknameCheck(String nickname);
	public int emailCheck(String email);
	public void telCheck(String tel, String ckNum);
	public MemberVO loginCheck(MemberVO vo);
	public int totalRecord(PagingVO pVO);
	public int getMembercnt();
	public void updateMyAddr(MemberVO vo);
	//아이디찾기
	public String searchid_tel(String username,String tel);
	public String searchid_email(String username,String email);
	//임시비밀번호
	public int updatePwd(MemberVO vo); //비밀번호업데이트
	public int memberMultiDelete(MemberVO vo);
	public List<MemberVO> memberList(PagingVO pVO);
	
	//경고회수 증가
	public void updateWarn(ReportVO rVO);

}