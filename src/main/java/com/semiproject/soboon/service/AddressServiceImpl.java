package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.AddressDAO;

@Service
public class AddressServiceImpl implements AddressService {

	@Inject
	AddressDAO dao;

	@Override
	public List<String> getLargeAddr() {
		return dao.getLargeAddr();
	}

	@Override
	public List<String> getMediumAddr(String large) {
		return dao.getMediumAddr(large);
	}

	@Override
	public List<String> getSmallAddr(String large, String medium) {
		return dao.getSmallAddr(large, medium);
	}

}
