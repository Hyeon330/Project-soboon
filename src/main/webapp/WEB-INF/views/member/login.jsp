<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" type="text/css"/>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/login.js"></script>
<div class="container">
	<div id="login">
		<h1>로그인</h1>
		<form method="post" action="/member/loginOk" id="loginFrm" onsubmit="return loginFrmCheck()">
			<ul>
				<li><input type="text" class="login-id" name="userid" id="userid" placeholder="ID" /></li>
				<li><input type="password" class="login-pwd" name="userpwd" id="userpwd" placeholder="PASSWORD" /></li>
				<br/>
				<li><input type="submit" class="btn login-btn" value="로그인">
				<a href="/member/signup"><input type="button" class="btn login-btn1" id="signupBtn" value="회원가입"></a></li>
				<br/>
				<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=4f0872694d90dd12a1b5d2f2045a544b&redirect_uri=http://localhost:9000/member/kakao/klogin&response_type=code"><img src="/img/kakao_login_button.png" class="kakaoBtn"/></a></li>
				<li><a href="/member/search_info"><input type="button" class="btn login-btn2" id="FindInfoBtn" value="아이디/비밀번호찾기"/></a></li>
			</ul>
		</form>
	</div>
</div>