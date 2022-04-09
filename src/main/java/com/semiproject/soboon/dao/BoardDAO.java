package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;

@Mapper 
@Repository
public interface BoardDAO {

	// 나눔,요청 글 등록
	public int shareAndReqInsert(BoardVO vo); 
	
	// 글 리스트 보이기
	public List<BoardVO> selectList(String category);
	
	// 카테고리 가져오기
	public BoardVO selectCategory(String category);
	
}
