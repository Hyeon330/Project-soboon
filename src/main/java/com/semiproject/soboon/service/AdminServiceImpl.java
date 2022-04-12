package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.MemberDAO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	MemberDAO dao;
	@Override
	public List<MemberVO> memberList(PagingVO pVO) {
		return dao.MemberList(pVO);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public int memberDelete(String userid) {
		return dao.memberDelete(userid);
	}

	@Override
	public int memberMultiDelete(MemberVO vo) {
		return dao.memberMultiDelte(vo);
	}

}
