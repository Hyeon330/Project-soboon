package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.EditDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MyPageVO;
import com.semiproject.soboon.vo.PickVO;
import com.semiproject.soboon.vo.ReplyVO;
import com.semiproject.soboon.vo.myPagingVO;

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

	@Override
	public List<BoardVO> mypostList(String userid, myPagingVO pVO) {
		return dao.mypostList(userid, pVO);
	}

	@Override
	public int mypostCount(String userid) {
		return dao.mypostCount(userid);
	}

	@Override
	public int myreplyCount(String userid) {
		return dao.myreplyCount(userid);
	}

	@Override
	public List<BoardVO> mypostList2(String userid) {
		return dao.mypostList2(userid);
	}

	@Override
	public int mypostMultiDelete(BoardVO vo) {
		return dao.mypostMultiDelete(vo);
	}

	@Override
	public int mypickCount(String userid) {
		return dao.mypickCount(userid);
	}

	@Override
	public MemberVO myInfo(String userid) {
		return dao.myInfo(userid);
	}

	@Override
	public List<ReplyVO> myReplyList(String userid, myPagingVO pVO) {
		return dao.myReplyList(userid, pVO);
	}

	@Override
	public int mycommentMultiDelete(ReplyVO rVO) {
		return dao.mycommentMultiDelete(rVO);
	}

	@Override
	public List<MyPageVO> myPickList(String userid, myPagingVO pVO) {
		return dao.myPickList(userid, pVO);
	}

	@Override
	public int mypickMultiDelete(PickVO kVO) {
		return dao.mypickMultiDelete(kVO);
	}
	
}