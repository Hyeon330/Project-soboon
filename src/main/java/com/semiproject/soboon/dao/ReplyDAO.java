package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ReplyVO;

@Mapper
@Repository
public interface ReplyDAO {

	// 댓글 목록보이기
	public List<ReplyVO> selectReplyList(ReplyVO vo);
	
	// 댓글 등록하기
	
	// 댓글 수정하기 
	
	// 댓글 삭제하기
}
