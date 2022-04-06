package com.semiproject.soboon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	// 컨트롤러가 호출되기 전에 실행될 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// false: 로그인으로 보내기
		// true: 정상 작동
		
		// Request객체에서 session객체 얻어오기
		HttpSession session = request.getSession();

		// 로그인 상태구하기
		String logStatus = (String) session.getAttribute("logStatus");

		if (logStatus != null && logStatus.equals("Y")) { // 로그인되었을때
			
			return true;
		} else { // 로그인 안된경우
			response.sendRedirect("/member/login");
			return false;
		}
	}
}
