package com.semiproject.soboon;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
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
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		return commonsMultipartResolver;
	}
}
