package com.semiproject.soboon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	/// 컨트롤러가 호출되기 전에 실행될 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// false : 해당 컨트롤러로 이동한다.(다른 주소를 response.sendRedirect로 할당)
		// true : 해당 컨트롤러로 이동한다.(원래 접속했던 주소로 이동)

		// request 객체에서 session객체를 얻어오기
		HttpSession session = request.getSession();

		// 로그인 상태구하기
		String logStatus = (String) session.getAttribute("logStatus");

		if (logStatus != null && logStatus.equals("Y")) { // 로그인 되었을 때
			return true; // 가던 길 가기
		} else { // 로그인 안된경우 로그인 폼(홈페이지)으로 이동
			// 로그인 폼으로 이동
			response.sendRedirect("/member/login"); // request.getContextPath()는 없어도된다.
			return false;
		}
	}

}
