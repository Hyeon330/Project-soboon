package com.semiproject.soboon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.EditDAO;
import com.semiproject.soboon.vo.MemberVO;

@Service
public class EditServiceImpl implements EditService {
	@Inject
	EditDAO dao;

	@Override
	public MemberVO selectEdit(String userid) {
		return dao.selectEdit(userid);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}

	@Override
	public int editUpdate(MemberVO vo) {
		return dao.editUpdate(vo);
	}

	@Override
	public int delMember(String userid) {
		return dao.delMember(userid);
	}
}
