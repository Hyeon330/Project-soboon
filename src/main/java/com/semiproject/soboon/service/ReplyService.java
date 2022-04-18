package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.ReplyVO;

public interface ReplyService {

	// 댓글 등록하기
	public int insertReply(ReplyVO vo);
	
	// 댓글 목록보이기
	public List<ReplyVO> selectReplyList(int no);

	// 댓글 수정하기 
	public int updateReply(ReplyVO vo);
	
	// 댓글 삭제하기
	public int deleteReply(int replyno, String nickname);

}

