package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.HomeDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.HomeVO;
import com.semiproject.soboon.vo.PagingVO;

@Service
public class HomeServiceImpl implements HomeService {
	@Inject
	HomeDAO dao;
	
	@Override
	public List<HomeVO> selectList() {
		return dao.selectList();
	}
}
