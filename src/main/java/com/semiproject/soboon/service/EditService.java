package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MyPageVO;
import com.semiproject.soboon.vo.PickVO;
import com.semiproject.soboon.vo.ReplyVO;
import com.semiproject.soboon.vo.myPagingVO;

public interface EditService {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
	public List<BoardVO> mypostList(String userid, myPagingVO pVO);
	public int mypostCount(String userid);
	public int myreplyCount(String userid);
	public int mypickCount(String userid);
	public MemberVO myInfo(String userid);
	public List<BoardVO> mypostList2(String userid);
	public int mypostMultiDelete(BoardVO vo);
	public int mycommentMultiDelete(ReplyVO rVO);
	public int mypickMultiDelete(PickVO kVO);
	public List<ReplyVO> myReplyList(String userid, myPagingVO pVO);
	public List<MyPageVO> myPickList(String userid, myPagingVO pVO);
}