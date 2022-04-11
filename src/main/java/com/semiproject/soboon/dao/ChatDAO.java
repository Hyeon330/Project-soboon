package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ChatVO;

@Mapper
@Repository
public interface ChatDAO {
	public List<ChatVO> getLastMessage(String userid);
}
