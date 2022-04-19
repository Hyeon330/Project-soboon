<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/member/login.css" type="text/css"/>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/js/member/login.js"></script>
<div class="container">
	<div id="login">
		<div id="logoBox"><a href="/"><img src="/img/로고6.png" id="loginLogo"/></a></div>
		<form method="post" action="/member/loginOk" id="loginFrm" onsubmit="return loginFrmCheck()">
			<ul>
				<li><input type="text" class="login-id" name="userid" id="userid" placeholder="ID" /></li>
				<li class="pwd_control">
					<input type="password" class="login-pwd" name="userpwd" id="userpwd" placeholder="PASSWORD">
					<i class="fa fa-eye fa-lg"></i>
				</li>
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