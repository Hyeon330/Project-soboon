package com.semiproject.soboon.dao;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.semiproject.soboon.vo.MemberVO;

@Mapper
@Repository
public interface EditDAO {
	public MemberVO selectEdit(String userid);
	public int nicknameCheck(String nickname);
	public int editUpdate(MemberVO vo);
	public int delMember(String userid);
}
