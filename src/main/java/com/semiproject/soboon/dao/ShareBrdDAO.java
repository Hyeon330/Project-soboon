package com.semiproject.soboon.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;

@Mapper 
@Repository
public interface ShareBrdDAO {

	// 글 등록
	public int shareInsert(BoardVO vo); 
	
}
