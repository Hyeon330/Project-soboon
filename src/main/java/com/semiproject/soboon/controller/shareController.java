package com.semiproject.soboon.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class shareController {

	@GetMapping("/shareboard/shareList")
	public ModelAndView shareForm(ModelAndView mav) {
		mav.setViewName("shareboard/shareList");
		return  mav;
	}
}
