package com.semiproject.soboon.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MyPageVO;
import com.semiproject.soboon.vo.PickVO;
import com.semiproject.soboon.vo.ReplyVO;
import com.semiproject.soboon.vo.MyPagingVO;

@Mapper
@Repository
public interface EditDAO {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
	public List<BoardVO> mypostList(String userid, MyPagingVO pVO);
	public int mypostCount(String userid);
	public int myreplyCount(String userid);
	public int mypickCount(String userid);
	public MemberVO myInfo(String userid);
	public List<BoardVO> mypostList2(String userid);
	public int mypostMultiDelete(BoardVO vo);
	public int mycommentMultiDelete(ReplyVO rVO);
	public int mypickMultiDelete(PickVO kVO);
	public List<ReplyVO> myReplyList(String userid, MyPagingVO pVO);
	public List<MyPageVO> myPickList(String userid, MyPagingVO pVO);
	
	
}
