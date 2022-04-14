package com.semiproject.soboon.service;

import java.util.List;

public interface AddressService {

	public List<String> getLargeAddr();
	public List<String> getMediumAddr(String large);
	public List<String> getSmallAddr(String large, String medium);
}
