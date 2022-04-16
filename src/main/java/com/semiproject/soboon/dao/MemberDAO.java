package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

@Mapper
@Repository
public interface MemberDAO {
	public int memberInsert(MemberVO vo);
	public int idCheck(String userid);
	public int nicknameCheck(String nickname);
	public int emailCheck(String email);
	public void telCheck(String tel, String ckNum);
	public String searchid_tel(String username, String tel);
	public String searchid_email(String username,String email);
	public MemberVO loginCheck(MemberVO vo);
	public int totalRecord(PagingVO pVO);
	public List<MemberVO> MemberList(PagingVO pVO);
	public int memberDelete(String userid);
	public int memberMultiDelte(MemberVO vo);
	public int getMembercnt();
	public void updateMyAddr(MemberVO vo);
}
