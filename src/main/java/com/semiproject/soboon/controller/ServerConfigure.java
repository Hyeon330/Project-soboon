package com.semiproject.soboon.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {

	private static final List<String> URL_PATERRNS = Arrays.asList(
			"/shareBoard/shareWrite","/shareBoard/shareWriteOK",
			"/shareBoard/shareEdit","/shareBoard/shareEditOk",
			"/shareBoard/shareDel","/rentBoard/rentWrite",
			"/rentBoard/rentWriteOk", "/rentBoard/rentEdit",
			"/rentBoard/rentEditOk", "/rentBoard/rentDel",
			"/saleBoard/saleWrite", "/saleBoard/saleWriteOk",
			"/saleBoard/saleEdit", "/saleBoard/saleEditOk",
			"/saleBoard/saleDel", "/reqBoard/reqWrite",
			"/reqBoard/reqWriteOk", "/reqBoard/reqEdit",
			"/reqBoard/reqEditOk", "/reqBoard/reqDel"
			);
	
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATERRNS);
	}
}
