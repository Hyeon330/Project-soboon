package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.BoardDAO;
import com.semiproject.soboon.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public int shareAndReqInsert(BoardVO vo) {
		return dao.shareAndReqInsert(vo);
	}

	@Override
	public List<BoardVO> selectList(String category) {
		return dao.selectList(category);
	}

	@Override
	public BoardVO selectCategory(String category) {
		return dao.selectCategory(category);
	}

}
