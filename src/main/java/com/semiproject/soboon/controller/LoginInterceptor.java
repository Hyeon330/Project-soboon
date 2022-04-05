package com.semiproject.soboon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	/// ��Ʈ�ѷ��� ȣ��Ǳ� ���� ����� �޼���
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// false : �ش� ��Ʈ�ѷ��� �̵��Ѵ�.(�ٸ� �ּҸ� response.sendRedirect�� �Ҵ�)
		// true : �ش� ��Ʈ�ѷ��� �̵��Ѵ�.(���� �����ߴ� �ּҷ� �̵�)

		// request ��ü���� session��ü�� ������
		HttpSession session = request.getSession();

		// �α��� ���±��ϱ�
		String logStatus = (String) session.getAttribute("logStatus");

		if (logStatus != null && logStatus.equals("Y")) { // �α��� �Ǿ��� ��
			return true; // ���� �� ����
		} else { // �α��� �ȵȰ�� �α��� ��(Ȩ������)���� �̵�
			// �α��� ������ �̵�
			response.sendRedirect("/member/login"); // request.getContextPath()�� ����ȴ�.
			return false;
		}
	}

}
