package com.semiproject.soboon.dao;

import java.util.List;

import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

public interface AdminDAO {

	public List<MemberVO> memberList(PagingVO pVO);
	
	public int totalRecord(PagingVO pVO);
	
	public MemberVO MemberSelect(String name);
	
	public int memberDelete(String userid);
	
	public int memberMultiDelete(MemberVO vo);
}
