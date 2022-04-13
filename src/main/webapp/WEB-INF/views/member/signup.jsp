<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/signup.css" type="text/css"/>
<script src="/js/member.js"></script>
<div class="container">
	<h2 id="signup-logo">회원가입</h2>
	<hr/>
	<form method="post" action="/member/memberOk" id="memberFrm" onsubmit="return memberCheck()">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" class="signup-id" name="userid" id="userid" placeholder="아이디" />
				<span id="chk"></span> 
				<input type="hidden" id="idChk" value="N" />
			</li>
			<li>비밀번호</li>
			<li><input type="password" class="signup-pwd" name="userpwd" id="userpwd" placeholder="비밀번호" /></li>
			<li>비밀번호확인</li>
			<li><input type="password" class="signup-pwd" name="userpwd2" id="userpwd2" placeholder="비밀번호확인" /></li>
			<li>이름</li>
			<li><input type="text" class="signup-name" name="username" id="username" placeholder="이름" /></li>
			<li>닉네임</li>
			<li>
				<input type="text" class="signup-nickname" name="nickname" id="nickname" placeholder="닉네임" />
				<span id="nchk"></span> 
				<input type="hidden" id="nickChk" value="N" />
			</li>
			<li>연락처</li>
			<li>
				<input type="text"  class="signup-tel" name="tel1" id="tel1" maxlength="3" /> - 
				<input type="text" class="signup-tel" name="tel2" id="tel2" maxlength="4" /> -
				<input type="text" class="signup-tel" name="tel3" id="tel3" maxlength="4" />
				<input type="button" id="sms-btn1" class="btn signup-btn" value="SMS인증"/>
			</li>
			<li class="sms">&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<li class="sms">
				<input type="text" class="signup-sms" name="smsCode" id="smsCode" placeholder="인증번호 5자리를 입력하세요"/>
				<input type="text" id="authCode"/>
				<input type="button" id="sms-btn2" class="btn signup-btn" value="인증"/>
			</li>
			<li>이메일</li>
			<li><input type="text" class="signup-email" name="email" id="email" placeholder="example@naver.com"/></li>
			<li>주소</li>
			<li><input type="text" class="signup-addr" name="address" id="address" placeholder="ex) 서울시 광진구" /></li>
			<li><input type="submit" class="btn signup-btn" id="signSub" value="가입하기" /></li>
		</ul>
	</form>
</div>


