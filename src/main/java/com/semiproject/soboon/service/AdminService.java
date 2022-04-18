package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

public interface AdminService {
	
	public List<MemberVO> memberList(PagingVO pVO);
	
	public int totalRecord(PagingVO pVO);
}
