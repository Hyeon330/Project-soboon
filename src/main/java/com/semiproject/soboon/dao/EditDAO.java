package com.semiproject.soboon.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MypagePagingVO;

@Mapper
@Repository
public interface EditDAO {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
	public List<BoardVO> mypostList(String userid, MypagePagingVO pVO);
	public int mypostCount(String userid);
	public int myreplyCount(String userid);
}
