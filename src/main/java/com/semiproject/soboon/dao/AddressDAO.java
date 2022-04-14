package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper 
@Repository
public interface AddressDAO {
	public List<String> getLargeAddr();
	public List<String> getMediumAddr(String large);
	public List<String> getSmallAddr(String large, String medium);
}
