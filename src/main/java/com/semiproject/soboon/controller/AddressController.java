package com.semiproject.soboon.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.semiproject.soboon.service.AddressService;

@RestController
@RequestMapping("/addr/")
public class AddressController {

	@Inject
	AddressService service;
	
	@GetMapping("getLargeAddr")
	public List<String> getLargeAddr() {
		return service.getLargeAddr();
	}
	
	@GetMapping("getMediumAddr")
	public List<String> getMediumAddr(String large) {
		System.out.println("sdfafda");
		return service.getMediumAddr(large);
	}
	
	@GetMapping("getSmallAddr")
	public List<String> getSmallAddr(String large, String medium) {
		return service.getSmallAddr(large, medium);
	}
}
