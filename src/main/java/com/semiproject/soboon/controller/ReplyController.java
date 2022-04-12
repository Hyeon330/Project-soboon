package com.semiproject.soboon.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.semiproject.soboon.service.ReplyService;

@RequestMapping("/reply/")
@RestController
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	// 댓글 등록하기
	
}
