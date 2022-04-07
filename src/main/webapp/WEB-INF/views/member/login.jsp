<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/login.css" type="text/css"/>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	function loginFrmCheck(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		if($("#userpwd").val()==''){
			alert("비밀번호를 입력하세요.");
			$("#userpwd").focus();
			return false;
		}
		return true;
	}
</script>
<div class="container">
	<div id="login">
		<h1>소분소분</h1>
		<form method="post" action="/member/loginOk" id="loginFrm"
			onsubmit="return loginFrmCheck()">
			<ul>
				<li><input type="text" name="userid" id="userid" placeholder="ID" /></li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="PASSWORD" /></li>
				<li><input type="submit" class="btn log" value="로그인" /></li>
				<li><span id="kakaobtn"><i class="bi bi-chat"></i><input type="submit" class="btn kakao" value="카카오톡으로 로그인하기"/></span></li>
				<li>
					<input type="button" class="btn btn1" id="changeBtn" value="아이디/비밀번호찾기"/>
					<a href="/member/signup"><input type="button" class="btn btn2" id="signupBtn" value="회원가입"/></a>
				<li>
			</ul>
		</form>
	</div>
</div>