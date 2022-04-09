package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.BoardVO;

public interface BoardService {

	// 나눔,요청 글 등록
	public int shareAndReqInsert(BoardVO vo);
	
	// 글 리스트 보이기
	public List<BoardVO> selectList(String category);
	
	// 카테고리 가져오기
	public BoardVO selectCategory(String category);
}
