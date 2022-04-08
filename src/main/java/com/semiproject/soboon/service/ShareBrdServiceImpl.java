package com.semiproject.soboon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.ShareBrdDAO;
import com.semiproject.soboon.vo.BoardVO;

@Service
public class ShareBrdServiceImpl implements ShareBrdService {

	@Inject
	ShareBrdDAO dao;
	
	@Override
	public int shareInsert(BoardVO vo) {
		return dao.shareInsert(vo);
	}

}
