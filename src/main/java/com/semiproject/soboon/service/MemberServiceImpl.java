package com.semiproject.soboon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.MemberDAO;
import com.semiproject.soboon.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	
}
