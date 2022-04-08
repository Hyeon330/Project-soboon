package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;

@Mapper 
@Repository
public interface ShareBrdDAO {

	// 글 등록
	public int shareInsert(BoardVO vo); 
	
	// 글 리스트 보이기
	public List<BoardVO> shareListSelect();
}
