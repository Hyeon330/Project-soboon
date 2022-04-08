package com.semiproject.soboon.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	public int memberInsert(MemberVO vo);
	public int idCheck(String userid);
	public int nicknameCheck(String nickname);
	public MemberVO loginCheck(MemberVO vo);
}
