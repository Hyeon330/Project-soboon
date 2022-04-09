package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.BoardVO;

public interface ShareBrdService {

	// 글 등록
	public int shareInsert(BoardVO vo); 
	
	// 글 리스트 보이기
	public List<BoardVO> shareListSelect();
}
