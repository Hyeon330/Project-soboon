package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ReplyAndPickVO;

@Mapper
@Repository
public interface ReplyAndPickDAO {

	// 댓글 등록하기
	public int insertReply(ReplyAndPickVO vo);
	
	// 댓글 목록보이기
	public List<ReplyAndPickVO> selectReplyList(int no);

	// 댓글 수정하기 
	public int updateReply(ReplyAndPickVO vo);
	
	// 댓글 삭제하기
	public int deleteReply(int replyno, String nickname);
}
